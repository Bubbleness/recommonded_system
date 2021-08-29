package com.ssm.web.action;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.Apply;
import com.ssm.bean.SimpleUser;
import com.ssm.util.Constant;
import com.ssm.util.DateUtil;
import com.ssm.util.FieldUtil;
import com.ssm.util.MapUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.ApplyService;

@Controller
@RequestMapping("/sys")//管理员
public class ApplyAction extends BaseAction {
    //用于jsp页面显示统一显示内容
    //在这里就是  例如：添加${actionname}   在页面显示：添加申请
	private String			actionname	= "申请";
	//向jsp页面传递请求的类型
	private String			actionclass	= "Apply";
	@Autowired
	private ApplyService	service;

	/**
	 * 添加一个申请
	 * @return
	 */
	@RequestMapping(value = "/add2Apply.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addApply";
	}

	/**
	 * 获取uid对应的用户的申请
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getApply.do")
	public String get(int uid) {
		try {
			Apply bean = service.get(uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			//跳转到modifyApply页面：进行申请的修改
			return "modifyApply";
		} catch (Exception e) {
			e.printStackTrace();
			//设置操作的一些信息
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	/**
	 * 确实申请，对uid对应的用户的申请进行操作
	 * @param status
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/checkApply.do")
	public String checkApply(String status,int uid) {
		try {
			service.udpateCheck(status,uid);
			//跳转到sys/queryApplyAll.do，也就是跳到查询出所有申请的界面
			MessageUtil.addForwardUrl(request, "操作成功.", "sys/queryApplyAll.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "操作失败.");
			return ERROR;
		}
	}

	//删除一个申请
	@RequestMapping(value = "/deleteApply.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryApply.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	/**
	 * 新建一个申请
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/addApply.do")
	public String add(Apply bean) {
		try {
			//获取申请的用户对象
			SimpleUser user = getSimpleUser();
			//判断该对象是否是V用户
			if ("V".equals(user.getType())) {
				MessageUtil.addMessage(request, "你已经是V用户了,不用申请了.");
				return ERROR;
			}
			//检查该用户是否已经申请过
			List selectAll = service.selectAll(Apply.class, MapUtil.createMap("userId", user.getId(), "status", "待审核"));
			if (selectAll.size() > 0) {
				MessageUtil.addMessage(request, "你已经申请过了,请等待审核.");
				return ERROR;
			}
			bean.setUserId(getSimpleUser().getId());
			bean.setAddDate(DateUtil.getCurrentTime());
			bean.setStatus("待审核");

			service.add(bean);
			MessageUtil.addMessage(request, "添加成功.");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "添加失败.");
			return ERROR;
		}

	}

	/**
	 * 更新一个申请
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/updateApply.do")
	public String update(Apply bean) {
		try {
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryApply.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	/**
	 * 查询一个申请
	 * @return
	 */
	@RequestMapping(value = "/queryApply.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, Apply.class, parmnames, parmvalues);

			parmnames.add("userId");
			parmvalues.add(getSimpleUser().getId());

			Page page = service.selectPage(p, Apply.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listApply";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	/**
	 * 查询出所有的申请
	 * @return
	 */
	@RequestMapping(value = "/queryApplyAll.do")
	public String queryApplyAll() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, Apply.class, parmnames, parmvalues);
			
			
			Page page = service.selectPage(p, Apply.class);
			session.setAttribute(Constant.SESSION_PAGE, page);
			
			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "queryApplyAll";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
