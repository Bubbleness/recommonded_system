package com.ssm.web.action;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.MovieFav;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.MovieFavService;

@Controller
@RequestMapping("/sys")
public class MovieFavAction extends BaseAction {
	private String				actionname	= "收藏";
	private String				actionclass	= "MovieFav";
	@Autowired
	private MovieFavService	service;

	@RequestMapping(value = "/add2MovieFav.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addMovieFav";
	}

	@RequestMapping(value = "/getMovieFav.do")
	public String get(int uid) {
		try {
			MovieFav bean = service.get(uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifyMovieFav";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	/**
	 * 删除收藏
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteMovieFav.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryMovieFav.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	/**
	 * 添加收藏
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/addMovieFav.do")
	public String add(MovieFav bean) {
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

	@RequestMapping(value = "/updateMovieFav.do")
	public String update(MovieFav bean) {
		try {
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryMovieFav.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	/**
	 * 查询所有的收藏
	 * @return
	 */
	@RequestMapping(value = "/queryMovieFav.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, MovieFav.class, parmnames, parmvalues);

			parmnames.add("userId");
			parmvalues.add(getSimpleUser().getId());

			Page page = service.selectPage(p, MovieFav.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listMovieFav";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
