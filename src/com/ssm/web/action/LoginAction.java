package com.ssm.web.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.SimpleUser;
import com.ssm.bean.SysUser;
import com.ssm.util.Constant;
import com.ssm.util.MD5;
import com.ssm.util.MessageUtil;
import com.ssm.util.SessionBean;
import com.ssm.util.StringUtil;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.SimpleUserService;
import com.ssm.web.service.SysUserService;

@Controller
@RequestMapping("/com")
public class LoginAction extends BaseAction {

	//管理员
	@Autowired
	private SysUserService		sysUserService;
	//普通用户
	@Autowired
	private SimpleUserService	simpleUserService;

	/**
	 * 处理用户的登录
	 * @param username
	 * @param password
	 * @param loginType
	 * @param checkcode
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login.do")
	public String login(String username, String password, String loginType, String checkcode) throws Exception {
		log.info(username + " " + password + " " + loginType);
		String errorMessage = "登录失败,请稍候重试";
		try {
			//获取验证码
			//实现验证码功能可以使用 com.google.code.kaptcha 的jar包
			String code = (String) session.getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if (code == null) {
				//使当前session对象失效
				request.getSession(false).invalidate();
				return "redirect:/index.jsp";
			} else {
			}
			//在checkcode不为空时返回checkcode
			checkcode = StringUtil.stringVerification(checkcode);
			do {
				if (!code.toLowerCase().equals(checkcode.toLowerCase())) {
					errorMessage = "验证码错误";
					break;
				}
				//获取用户名
				username = StringUtil.stringVerification(username).toLowerCase();

				//进行密码加密操作
				MD5 md = new MD5();
				password = md.getMD5ofStr(password);
				//核实账户是否存在或者信息是否正确
				Object bean = sysUserService.login(username, password, loginType);
				if (bean == null) {
					errorMessage = "账号或者密码错误";
					break;
				}

				SessionBean sb = new SessionBean();
				sb.setUser(bean);
				session.setAttribute(Constant.SESSION_BEAN, sb);

				//普通用户的登录
				if (loginType.equals(SimpleUser.class.getSimpleName())) {
					SimpleUser tempuser = getSimpleUser();
					//用户的状态为黑名单
					if ("黑名单".equals(tempuser.getLocked())) {
						session.removeAttribute(Constant.SESSION_BEAN);
						session.setAttribute("signErrorMessage", "黑名单用户不能登陆");
						return "redirect:/index.jsp";
					}
					return "redirect:/exit.jsp";
				}
				return "main";

			} while (false);

		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("signErrorMessage", errorMessage);
		return "redirect:/index.jsp";
	}

	/**
	 * 普通用户的注册
	 * 该系统目前还不提供系统管理员的注册工作
	 * 系统管理员默认为 admin
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/reg.do")
	public String add(SimpleUser bean) {
		try {
			//按当前用户的用户名查找用户信息
			SimpleUser temp = simpleUserService.findByUname(bean.getUname());
			if (temp != null) {
				//如果查找到了，说明该用户已近存在
				putSessionValue("signErrorMessage", "很遗憾,账号已经被使用.");
			} else {
				bean.setUserGender("男");
				simpleUserService.addSimpleUser(bean);
				putSessionValue("signErrorMessage", "恭喜您! 注册成功.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			putSessionValue("signErrorMessage", "很遗憾,注册失败.");
		}

		return "redirect:/reg.jsp";

	}

	/**
	 * 跳转到修改密码 的界面
	 * @return
	 */
	@RequestMapping(value = "/update2Password.do")
	public String toSelf() {
		return "common/changepassword";
	}

	/**
	 * 更新管理员的密码等信息
	 * @param oldpassword
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/updateSysUserPassword.do")
	public String updateSysUserPassword(String oldpassword, String password) {
		SysUser user = getSysUser();
		user = sysUserService.get(user.getId());
		MD5 md = new MD5();
		oldpassword = md.getMD5ofStr(oldpassword);

		//检查输入的密码是否正确
		if (!user.getUserPassword().equals(oldpassword)) {
			MessageUtil.addMessage(request, "旧密码错误.");
			return ERROR;
		}

		password = md.getMD5ofStr(password);
		user.setUserPassword(password);

		sysUserService.updateAll(user);

		MessageUtil.addMessage(request, "修改成功.");
		return SUCCESS;
	}

	/**
	 * 更新普通用户的密码
	 * @param oldpassword
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/updateSimpleUserPassword.do")
	public String updateSimpleUserPassword(String oldpassword, String password) {
		SimpleUser user = getSimpleUser();
		user = simpleUserService.get(user.getId());
		MD5 md = new MD5();
		oldpassword = md.getMD5ofStr(oldpassword);

		if (!user.getUserPassword().equals(oldpassword)) {
			MessageUtil.addMessage(request, "旧密码错误.");
			return ERROR;
		}

		password = md.getMD5ofStr(password);
		user.setUserPassword(password);

		simpleUserService.updateAll(user);

		MessageUtil.addMessage(request, "修改成功.");
		return SUCCESS;
	}

	/**
	 * 注销操作
	 * @return
	 */
	@RequestMapping(value = "/logout.do")
	public String logout() {
		//是session失效
		session.invalidate();
		return "redirect:/exit.jsp";
	}

}
