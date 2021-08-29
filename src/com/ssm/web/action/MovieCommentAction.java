package com.ssm.web.action;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.MovieComment;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.MovieCommentService;

@Controller
@RequestMapping("/sys")
public class MovieCommentAction extends BaseAction {
	private String				actionname	= "评论";
	private String				actionclass	= "MovieComment";
	@Autowired
	private MovieCommentService	service;

	/**
	 * 没有使用到
	 * @return
	 */
	@RequestMapping(value = "/add2MovieComment.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addMovieComment";
	}

	/**
	 * 没有使用到
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getMovieComment.do")
	public String get(int uid) {
		try {
			MovieComment bean = service.get(uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifyMovieComment";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	/**
	 * 删除一条评论信息
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteMovieComment.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryMovieComment.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}
	@RequestMapping(value = "/deleteMovieCommentAll.do")
	public String deleteMovieCommentAll(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryMovieCommentAll.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addMovieComment.do")
	public String add(MovieComment bean) {
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
	 * 没有用到
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/updateMovieComment.do")
	public String update(MovieComment bean) {
		try {
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryMovieComment.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	/**
	 * 管理员状态下查询全部的评论
	 * @return
	 */
	@RequestMapping(value = "/queryMovieComment.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, MovieComment.class, parmnames, parmvalues);

			parmnames.add("userId");
			parmvalues.add(getSimpleUser().getId());

			Page page = service.selectPage(p, MovieComment.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listMovieComment";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	/**
	 * 普通用户状态下查询全部评论
	 * @return
	 */
	@RequestMapping(value = "/queryMovieCommentAll.do")
	public String queryMovieCommentAll() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, MovieComment.class, parmnames, parmvalues);

			Page page = service.selectPage(p, MovieComment.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "queryMovieCommentAll";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
