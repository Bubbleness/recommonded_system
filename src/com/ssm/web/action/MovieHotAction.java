package com.ssm.web.action;

import java.util.LinkedList;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.MovieHot;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.FileUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.MovieHotService;

@Controller
@RequestMapping("/sys")
public class MovieHotAction extends BaseAction {
	private String				actionname	= "滚动图片";
	private String				actionclass	= "MovieHot";
	@Autowired
	private MovieHotService	service;

	/**
	 * 添加滚动轮播图 返回到添加的页面
	 * @return
	 */
	@RequestMapping(value = "/add2MovieHot.do")
	public String add2() {
		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addMovieHot";
	}

	/**
	 * 根据主键查询出一个轮播图信息，并进入修改页面
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getMovieHot.do")
	public String get(int uid) {
		try {
			MovieHot bean = service.get(uid);
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifyMovieHot";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	/**
	 * 删除一个轮播图
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteMovieHot.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryMovieHot.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	/**
	 * 添加轮播图
	 * @param bean 轮播图实体
	 * @return
	 */
	@RequestMapping(value = "/addMovieHot.do")
	public String add(MovieHot bean) {
		try {
			//读取文件信息（也就是读取轮播图的图片）
			String f = FileUtil.uploadFile(request, "resfile");
			if(StringUtils.isNotBlank(f))
				bean.setImgFile(f);
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
	 * 更新一个轮播图的信息
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/updateMovieHot.do")
	public String update(MovieHot bean) {
		try {
			//获取图片信息
			String f = FileUtil.uploadFile(request, "resfile");
			if(StringUtils.isNotBlank(f))
				bean.setImgFile(f);
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryMovieHot.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	/**
	 * 查询出所有的轮播图
	 * @return
	 */
	@RequestMapping(value = "/queryMovieHot.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, MovieHot.class, parmnames, parmvalues);

			//			if (parmnames.contains("type")) {
			//				actionname1 = (String) parmvalues.get(parmnames.indexOf("type"));
			//			}

			Page page = service.selectPage(p, MovieHot.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listMovieHot";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
