package com.ssm.web.action;

import java.util.LinkedList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.MovieArea;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.MovieAreaService;

@Controller
@RequestMapping("/sys")
public class MovieAreaAction extends BaseAction {
	private String				actionname	= "地区";
	private String				actionclass	= "MovieArea";
	@Autowired
	private MovieAreaService	service;

	/**
	 * 添加地区的信息，返回到addMovieArea.jsp页面
	 * @return
	 */
	@RequestMapping(value = "/add2MovieArea.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addMovieArea";
	}

	/**
	 * 获取指定的id的地区信息，返回到修改信息的页面
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getMovieArea.do")
	public String get(int uid) {
		try {
			MovieArea bean = service.get(uid);
			//传给jsp页面进行遍历显示
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifyMovieArea";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	/**
	 * 删除一个地区信息
	 * @param ids 所有要删除的地区id构成的字符串  进行批量删除
	 * @return
	 */
	@RequestMapping(value = "/deleteMovieArea.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryMovieArea.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	/**
	 * 添加一个地区信息
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/addMovieArea.do")
	public String add(MovieArea bean) {
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
	 * 更新地区信息
	 * @param bean 由前端页面传递过来
	 * @return
	 */
	@RequestMapping(value = "/updateMovieArea.do")
	public String update(MovieArea bean) {
		try {
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryMovieArea.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	/**
	 * 管理员操作中显示出全部的地区信息
	 * @return
	 */
	@RequestMapping(value = "/queryMovieArea.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, MovieArea.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.selectPage(p, MovieArea.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listMovieArea";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
