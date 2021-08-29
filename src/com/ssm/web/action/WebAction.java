package com.ssm.web.action;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONObject;
import com.ssm.bean.Movie;
import com.ssm.bean.MovieComment;
import com.ssm.bean.MovieFav;
import com.ssm.bean.MovieScore;
import com.ssm.bean.SimpleUser;
import com.ssm.bean.UserFilteringResult;
import com.ssm.util.Constant;
import com.ssm.util.DateUtil;
import com.ssm.util.FieldUtil;
import com.ssm.util.MapUtil;
import com.ssm.util.Page;
import com.ssm.util.common.BaseAction;
import com.ssm.web.service.MovieAreaService;
import com.ssm.web.service.MovieCommentService;
import com.ssm.web.service.MovieFavService;
import com.ssm.web.service.MovieHotService;
import com.ssm.web.service.MovieScoreService;
import com.ssm.web.service.MovieService;
import com.ssm.web.service.MovieTypeService;
import com.ssm.web.service.SimpleUserService;
import com.ssm.web.service.UserFilteringResultService;

@Controller
@RequestMapping("/com")
public class WebAction extends BaseAction {

	/**
	 * 添加视频的用户评论信息
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addMovieComment.do")
	public String addMovieComment(int uid) throws Exception {
		try {

			//首先判断用户是否已经登录，只有登录后才能进行评论
			SimpleUser user = getWebUser();
			if (user == null) {
				putSessionValue("errorMessage", "请先登陆后评论");
				return "redirect:/com/getMovie.do?uid=" + uid;
			}

			//获取当前用户信息
			user = simpleUserService.get(user.getId());
			//获取评论信息
			String content = getString("content");
			//设置用户对视频的评论信息
			MovieComment mc = new MovieComment();
			//评论内容
			mc.setContent(content);
			//被评论的视屏id
			mc.setMovieId(uid);
			//评论者id
			mc.setUserId(user.getId());
			//评论的用户是否为 大V 用户
			mc.setVtype(user.getType());
			//评论的时间
			mc.setAddDate(DateUtil.getCurrentTime(DateUtil.FULL));
			movieCommentService.add(mc);

			putSessionValue("errorMessage", "评论成功");
		} catch (Exception e) {
			e.printStackTrace();
			putSessionValue("errorMessage", "评论失败");
		}

		//返回到视频信息详情页面
		return "redirect:/com/getMovie.do?uid=" + uid;
	}

	/**
	 * 添加该视频到用户的收藏里面
	 * 即收藏该视频
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/addMovieFav.do")
	public String addMovieFavPage(int uid) throws Exception {
		try {

			//获取用户信息，判断当前是否有用户登录到系统
			SimpleUser user = getWebUser();
			//如果没有用户登录到系统：提示用户进行登录，只有登录后才能收藏
			if (user == null) {
				putSessionValue("errorMessage", "请先登陆后收藏");
				return "redirect:/com/getMovie.do?uid=" + uid;
			}

			//遍历该视频的收藏信息，判断当前用户是否已经收藏过该视频
			List selectAll = movieFavService.selectAll(MovieFav.class, MapUtil.createMap("movieId", uid, "userId", user.getId()));
			//用户已经收藏过，提示已收藏，并且返回已经到视频详情页面
			if (selectAll.size() > 0) {
				putSessionValue("errorMessage", "已经收藏过了");
				return "redirect:/com/getMovie.do?uid=" + uid;
			}

			//该视频还没有被收藏：添加该视频的收藏信息
			MovieFav mc = new MovieFav();
			//用户id
			mc.setUserId(user.getId());
			//视频id
			mc.setMovieId(uid);
			//收藏的时间
			mc.setAddDate(DateUtil.getCurrentTime());
			movieFavService.add(mc);

			putSessionValue("errorMessage", "收藏成功");
		} catch (Exception e) {
			e.printStackTrace();
			putSessionValue("errorMessage", "收藏失败");
		}

		//收藏完成后返回到视频详情页面
		return "redirect:/com/getMovie.do?uid=" + uid;
	}

	/**
	 * 显示视频信息，点击视频可以进入具体的视频详情界面
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getMovie.do")
	public String getMoviePage(int uid) throws Exception {

		//获取到视频信息存在item中
		putRequestValue("item", movieService.get(uid));

		//按评分降序排序全部的视频
		List<?> sugList = movieService.selectAll(Movie.class, "score desc");

		//取前六个视频进行显示
		if (sugList.size() > 6) {
			sugList = sugList.subList(0, 6);
		}
		//将前6个视频存在sugList中
		putRequestValue("sugList", sugList);

		//全部的视频，选择10个进行显示（按视频的添加的先后顺序）
		List<?> newList = movieService.selectAll(Movie.class, "id desc");
		if (newList.size() > 10) {
			newList = newList.subList(0, 10);
		}
		putRequestValue("newList", newList);

		//按视频的上有时间降序
		List<?> jingList = movieService.selectAll(Movie.class, "shangyingshijian desc,score desc");
		if (jingList.size() > 10) {
			jingList = jingList.subList(0, 10);
		}
		putRequestValue("jingList", jingList);

		putRequestValue("commentList",
				movieCommentService.selectAll(MovieComment.class, MapUtil.createMap("movieId", uid), "vtype desc,id desc"));

		//跳转到具体视频的详情页面
		return "forward:/qiantai/dilates.jsp";
	}


	/**
	 * 更新当前用户对当前视频的评分
	 * @param uid
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/updateScore.do")
	public String updateScorePage(int uid) throws Exception {

		//处理前端传递的JSON格式的数据
		JSONObject obj = new JSONObject();
		try {

			//判断用户是否登录，只有登录才能评分
			SimpleUser user = getWebUser();
			if (user == null) {
				obj.put("msg", "请先登陆后评分");
			} else {

				//如当前用户还没有对该视频进行评分则可以进行评分操作
				List selectAll = movieScoreService.selectAll(MovieScore.class, MapUtil.createMap("movieId", uid, "userId", user.getId()));
				if (selectAll.size() == 0) {
					MovieScore ms = new MovieScore();
					//评分时间
					ms.setAddDate(DateUtil.getCurrentTime());
					//被评分的视屏id
					ms.setMovieId(uid);
					//评分用户的id
					ms.setUserId(user.getId());
					//评分的分数
					ms.setSocre(getDouble("score"));
					movieScoreService.addScore(ms);

					//更新用户评分的数据，以用来计算用户相似度
					userFilteringResultService.updateUserFilteringResult();
					obj.put("msg", "评分成功");
				} else {
					obj.put("msg", "您已经参与过评分");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("msg", "评分失败");
		}
		print(obj.toJSONString());
		return null;
	}

	/**
	 *
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/index.do")
	public String indexPage() throws Exception {
		List<?> list = movieHotService.selectAll();
		putRequestValue("hotList", list);

		putRequestValue("sugList", selectSuggest());

		List<?> newList = movieService.selectAll(Movie.class, "id desc");
		if (newList.size() > 10) {
			newList = newList.subList(0, 10);
		}
		putRequestValue("newList", newList);

		return "forward:/qiantai/index.jsp";
	}

	/**
	 * 查询出所有的视频信息
	 * 交给前端页面进行显示
	 * @return
	 */
	@RequestMapping(value = "/list.do")
	public String listMovie() {
		try {

			//视频年份
			String nian = getString("nian");
			//视频地区
			String movieArea = getString("movieArea");
			//视频名称
			String name = getString("name");
			//视频类型
			String movieType = getString("movieType");
			// 字段名称集合
			LinkedList<String> parmnames = new LinkedList<String>();
			// 字段值集合
			LinkedList<Object> parmvalues = new LinkedList<Object>();
			//将全部信息生成页进行显示
			Page p = FieldUtil.createPage(request, Movie.class, parmnames, parmvalues);

			//对年份进行指定的格式化
			if (StringUtils.isNotBlank(nian)) {
				parmnames.add("movieYear");
				parmvalues.add(FieldUtil.format(Movie.class, "movieYear", nian));
			}

			//对地区进行指定格式化
			if (StringUtils.isNotBlank(movieArea)) {
				parmnames.add("movieAreaId");
				parmvalues.add(FieldUtil.format(Movie.class, "movieAreaId", movieArea));
			}

			//对视频名称进行指定格式化
			if (StringUtils.isNotBlank(name)) {
				parmnames.add("name");
				parmvalues.add(FieldUtil.format(Movie.class, "name", name));
			}

			//对视频类型进行指定格式化
			if (StringUtils.isNotBlank(movieType)) {
				parmnames.add("movieType");
				parmvalues.add(FieldUtil.format(Movie.class, "movieType", movieType));
			}

			Page page = movieService.selectPage(p, Movie.class);
			session.setAttribute(Constant.SESSION_PAGE, page);

			//将当前信息存入session对象，以便于前端jsp页面的调用
			putRequestValue("nian", nian);
			putRequestValue("movieArea", movieArea);
			putRequestValue("name", name);
			putRequestValue("movieType", movieType);
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<String> nianList = movieService.findAllYear();
		putRequestValue("nianList", nianList);

		putRequestValue("typeList", movieTypeService.selectAll());
		putRequestValue("areaList", movieAreaService.selectAll());

		return "forward:/qiantai/movie.jsp";
	}

	@SuppressWarnings("unchecked")
	private List<Movie> selectSuggest() {
		SimpleUser user = getWebUser();
		if (user == null) {
			List<Movie> newList = movieService.selectAll(Movie.class, "score desc");
			if (newList.size() > 5) {
				newList = newList.subList(0, 5);
			}
			return newList;
		}
		List<UserFilteringResult> rlist = userFilteringResultService.selectAll(UserFilteringResult.class,
				MapUtil.createMap("memberid", user.getId()));
		if (rlist.size() == 0) {
			List<Movie> newList = movieService.selectAll(Movie.class, "score desc");
			if (newList.size() > 5) {
				newList = newList.subList(0, 5);
			}
			return newList;
		} else {
			List<Movie> retlist = new ArrayList<Movie>();

			String[] ids = rlist.get(0).getProductids().split(",");
			for (String id : ids) {
				retlist.add(movieService.get(Integer.valueOf(id)));

			}
			if (retlist.size() > 5) {
				retlist = retlist.subList(0, 5);
			}

			return retlist;
		}
	}

	@RequestMapping(value = "/createData.do")
	public String createData() {

		//		for (int i = 1; i <= 30; i++) {
		//			SimpleUser user = new SimpleUser();
		//			user.setUname("9" + StringUtil.format0String(3, i));
		//			String n = StringUtil.getCNName();
		//			String ary[] = n.split("-");
		//			user.setUserName(ary[1]);
		//			user.setUserGender(ary[0]);
		//			user.setUserPassword("123456");
		//			user.setUserPhone("15788888888");
		//			simpleUserService.addSimpleUser(user);
		//		}

		//		//随机评价
		//		List<SimpleUser> userlist = simpleUserService.selectAll();
		//
		//		List<Movie> goodslist = movieService.selectAll();
		//
		//		Random ran = new Random();
		//		for (SimpleUser user : userlist) {
		//			int index = ran.nextInt(goodslist.size());
		//			for (int i = 0; i < 10; i++) {
		//				Movie goods = goodslist.get((index + i) % goodslist.size());
		//				MovieScore c = new MovieScore();
		//				c.setAddDate(DateUtil.getCurrentTime());
		//				c.setMovieId(goods.getId());
		//				c.setUserId(user.getId());
		//				c.setSocre((double) (ran.nextInt(10) + 1));
		//				if (c.getSocre() < 5)
		//					c.setSocre(c.getSocre() + 2);
		//				movieScoreService.addScore(c);
		//			}
		//		}
		//		userFilteringResultService.updateUserFilteringResult();

		print("OK");
		return null;
	}

	private SimpleUser getWebUser() {
		try {
			return getSimpleUser();
		} catch (Exception e) {
			return null;
		}
	}

	//系统的普通用户（使用到）
	@Autowired
	private SimpleUserService			simpleUserService;

	//视频课程（使用到）
	@Autowired
	private MovieService				movieService;

	//视频地区（使用到）
	@Autowired
	private MovieAreaService			movieAreaService;

	//收藏的视频（使用到）
	@Autowired
	private MovieFavService				movieFavService;

	//轮播图（使用到）
	@Autowired
	private MovieHotService				movieHotService;

	//视频评分（使用到）
	@Autowired
	private MovieScoreService			movieScoreService;

	//视频评论（使用到）
	@Autowired
	private MovieCommentService			movieCommentService;

	//推荐算法（使用到）
	@Autowired
	private UserFilteringResultService	userFilteringResultService;

	//视频分类（使用到）
	@Autowired
	private MovieTypeService			movieTypeService;
}
