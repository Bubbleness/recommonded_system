package com.ssm.web.action;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.UserFilteringResult;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.UserFilteringResultService;

@Controller
@RequestMapping("/sys")
public class UserFilteringResultAction extends BaseAction {
	private String				actionname	= "XXXXXX";
	private String				actionclass	= "UserFilteringResult";
	@Autowired
	private UserFilteringResultService	service;

    /**
     * 返回添加页面
     * @return
     */
	@RequestMapping(value = "/add2UserFilteringResult.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addUserFilteringResult";
	}

    /**
     * 获取信息
     * @param uid
     * @return
     */
	@RequestMapping(value = "/getUserFilteringResult.do")
	public String get(int uid) {
		try {
			UserFilteringResult bean = service.get(uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifyUserFilteringResult";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

    /**
     * 删除
     * @param ids
     * @return
     */
	@RequestMapping(value = "/deleteUserFilteringResult.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryUserFilteringResult.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

    /**
     * 添加
     * @param bean
     * @return
     */
	@RequestMapping(value = "/addUserFilteringResult.do")
	public String add(UserFilteringResult bean) {
		try {
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
     * 更新
     * @param bean
     * @return
     */
	@RequestMapping(value = "/updateUserFilteringResult.do")
	public String update(UserFilteringResult bean) {
		try {
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryUserFilteringResult.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

    /**
     * 查询
     * @return
     */
	@RequestMapping(value = "/queryUserFilteringResult.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, UserFilteringResult.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.selectPage(p, UserFilteringResult.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listUserFilteringResult";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
