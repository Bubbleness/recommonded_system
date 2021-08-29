package com.ssm.web.action;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.SimpleUser;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.SimpleUserService;

@Controller
@RequestMapping("/sys")
public class SimpleUserAction extends BaseAction {
	//用户管理
	private String				actionname	= "用户";
	private String				actionclass	= "SimpleUser";
	@Autowired
	private SimpleUserService	service;

	@RequestMapping(value = "/add2SimpleUser.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addSimpleUser";
	}

	@RequestMapping(value = "/getSimpleUser.do")
	public String get(int uid) {
		try {
			SimpleUser bean = service.get(uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifySimpleUser";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteSimpleUser.do")
	public String delete(String ids) {
		try {
			service.deleteSimpleUser(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/querySimpleUser.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	/**
	 * 锁定用户（没有使用到）
	 * @param locked
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/lockuser.do")
	public String lockuser(String locked,int uid) {
		try {
			service.updateUserLock(locked,uid);
			MessageUtil.addForwardUrl(request, "操作成功.", "sys/querySimpleUser.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "操作失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addSimpleUser.do")
	public String add(SimpleUser bean) {
		try {
			service.addSimpleUser(bean);
			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	@RequestMapping(value = "/updateSimpleUser.do")
	public String update(SimpleUser bean) {
		try {
			service.updateSimpleUser(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/querySimpleUser.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	/**
	 * 查询出所有的用户
	 * @return
	 */
	@RequestMapping(value = "/querySimpleUser.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, SimpleUser.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.selectPage(p, SimpleUser.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listSimpleUser";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
