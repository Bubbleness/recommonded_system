package com.ssm.web.action;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.MovieScore;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.MovieScoreService;

@Controller
@RequestMapping("/sys")
public class MovieScoreAction extends BaseAction {
	private String				actionname	= "评分";
	private String				actionclass	= "MovieScore";
	@Autowired
	private MovieScoreService	service;

	@RequestMapping(value = "/add2MovieScore.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addMovieScore";
	}

	@RequestMapping(value = "/getMovieScore.do")
	public String get(int uid) {
		try {
			MovieScore bean = service.get(uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifyMovieScore";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/deleteMovieScore.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryMovieScore.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/addMovieScore.do")
	public String add(MovieScore bean) {
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

	@RequestMapping(value = "/updateMovieScore.do")
	public String update(MovieScore bean) {
		try {
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryMovieScore.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	@RequestMapping(value = "/queryMovieScore.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, MovieScore.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.selectPage(p, MovieScore.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listMovieScore";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
