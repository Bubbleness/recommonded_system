package com.ssm.web.action;

import java.util.LinkedList;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.bean.Movie;
import com.ssm.util.Constant;
import com.ssm.util.FieldUtil;
import com.ssm.util.FileUtil;
import com.ssm.util.MessageUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.MovieAreaService;
import com.ssm.web.service.MovieService;
import com.ssm.web.service.MovieTypeService;

@Controller
@RequestMapping("/sys")
public class MovieAction extends BaseAction {
	//用于往jsp页面传值的
	private String				actionname	= "视频";
	private String				actionclass	= "Movie";

	//视频
	@Autowired
	private MovieService		service;
	//视频的地区
	@Autowired
	private MovieAreaService	movieAreaService;
	//视频的类型
	@Autowired
	private MovieTypeService	movieTypeService;

	/**
	 * 返回addMovie.jsp页面，该页面用来添加视频信息
	 * @return
	 */
	@RequestMapping(value = "/add2Movie.do")
	public String add2() {
		//查询出所有的视频地区的信息，放在list里面，供jsp页面显示
		putRequestValue("list", movieAreaService.selectAll());

		request.setAttribute("actionname", actionname);
		request.setAttribute("actionclass", actionclass);
		return "addMovie";
	}

	/**
	 * 根据uid查询出相应的视频，并且跳到视频修改的页面
	 * @param uid
	 * @return
	 */
	@RequestMapping(value = "/getMovie.do")
	public String get(int uid) {
		try {
			//查询出所有的的视频地区信息
			putRequestValue("list", movieAreaService.selectAll());
			//根据视频的uid查找出相应的视频
			Movie bean = service.get(uid);
			//将该视频对象存放在"modifybean"的value中，供jsp页面调用
			request.setAttribute("modifybean", bean);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "modifyMovie";
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "获取信息失败.");
			return ERROR;
		}
	}

	/**
	 * 删除一个视频
	 * @param ids
	 * @return
	 */
	@RequestMapping(value = "/deleteMovie.do")
	public String delete(String ids) {
		try {
			service.deleteAll(ids);
			//删除后跳转到查询出所有视频的页面
			MessageUtil.addForwardUrl(request, "删除信息成功.", "sys/queryMovie.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "删除信息失败.");
			return ERROR;
		}
	}

	/**
	 * 添加一个新的视频
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/addMovie.do")
	public String add(Movie bean) {
		try {
			//设置默认评分
			bean.setScore(10d);
			//设置默认评分用户
			bean.setScoreUserNumber(0);

			//处理上传视频文件和图片文件
			String f = FileUtil.uploadFile(request, "resfile1");
			//如果f不空则设置图片文件
			if (StringUtils.isNotBlank(f))
				bean.setImageFile(f);

			//如果上传的视频不空则设置视频文件
			f = FileUtil.uploadFile(request, "resfile2");
			if (StringUtils.isNotBlank(f))
				bean.setMovieFile(f);
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
	 * 更新一个视频信息
	 * @param bean
	 * @return
	 */
	@RequestMapping(value = "/updateMovie.do")
	public String update(Movie bean) {
		try {
			String f = FileUtil.uploadFile(request, "resfile1");
			if (StringUtils.isNotBlank(f))
				bean.setImageFile(f);

			f = FileUtil.uploadFile(request, "resfile2");
			if (StringUtils.isNotBlank(f))
				bean.setMovieFile(f);
			service.update(bean);
			MessageUtil.addForwardUrl(request, "更新成功.", "sys/queryMovie.do");
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			MessageUtil.addMessage(request, "更新失败.");
			return ERROR;
		}
	}

	/**
	 * 管理员中的查询所有视频
	 * 查询出所有的视频信息，返回到listMovie.jsp页面
	 * @return
	 */
	@RequestMapping(value = "/queryMovie.do")
	public String query() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			//创建出一页显示一页视频信息：用来分页使用的工具
			Page p = FieldUtil.createPage(request, Movie.class, parmnames, parmvalues);

			//选择分页的操作
			Page page = service.selectPage(p, Movie.class);
			//设置当前页中的内容
			session.setAttribute(Constant.SESSION_PAGE, page);

			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "listMovie";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

	/**
	 * 用户的收藏中的查询所有的收藏视屏
	 * @return
	 */
	@RequestMapping(value = "/queryMovieAll.do")
	public String queryMovieAll() {
		try {
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			Page p = FieldUtil.createPage(request, Movie.class, parmnames, parmvalues);
			
			Page page = service.selectPage(p, Movie.class);
			session.setAttribute(Constant.SESSION_PAGE, page);
			
			request.setAttribute("actionname", actionname);
			request.setAttribute("actionclass", actionclass);
			return "queryMovieAll";
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
