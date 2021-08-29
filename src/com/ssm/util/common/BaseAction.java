package com.ssm.util.common;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.ssm.bean.SimpleUser;
import com.ssm.bean.SysUser;
import com.ssm.util.Constant;
import com.ssm.util.SessionBean;

public class BaseAction {

	//日志
	protected static Logger			log		= Logger.getLogger(BaseAction.class);

	//正确的状态（跳转到根目录下的common/success页面）
	protected static String			SUCCESS	= "common/success";
	//错误的状态
	protected static String			ERROR	= "common/error";

	// protected HttpServletRequest request =
	// ((ServletRequestAttributes)RequestContextHolder
	// .getRequestAttributes()).getRequest();

	//request对象
	protected HttpServletRequest	request;
	protected HttpServletResponse	response;
	protected HttpSession			session;

	//该注解用于将数据添加到模型对象中，用于视图页面展示时使用
	//该方法用来设置request，response，session对象
	@ModelAttribute
	protected void setReqAndRes(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.session = request.getSession();

	}

	//File是个文件类：可以用来增加、删除、查找某种类型的文件或者文件夹
	protected File getResourceFile() {
		//获取resource下的文件对象
		File storageFile = new File(session.getServletContext().getRealPath("/resource"));
		return storageFile;
	}

	//在request范围内设置一个属性用来存值供其他页面操作
	protected void putRequestValue(String name, Object value) {
		request.setAttribute(name, value);
	}

	//在session范围内设置一个属性用来存值供其他页面操作
	protected void putSessionValue(String name, Object value) {
		session.setAttribute(name, value);
	}

	//获取HttpServletRequest对象
	protected HttpServletRequest getHttpServletRequest() {
		return request;
	}

	//获取HttpServletResponse对象
	protected HttpServletResponse getHttpServletResponse() {
		return response;
	}

	//获取session对象
	protected HttpSession getHttpSession() {
		return request.getSession();
	}

	//取getHttpServletRequest对象中设置的name字段的值
	protected String getString(String name) {
		return getHttpServletRequest().getParameter(name);
	}

	//将String类型转换为Integer类型
	protected int getInt(String name) {
		return Integer.valueOf(getHttpServletRequest().getParameter(name));
	}

	//将String类型转换为Double类型
	protected double getDouble(String name) {
		return Double.valueOf(getHttpServletRequest().getParameter(name));
	}

	//将String类型转换为Float类型
	protected float getFloat(String name) {
		return Float.valueOf(getHttpServletRequest().getParameter(name));
	}

	//向前端页面输出操作
	protected void print(String message) {
		try {
			//设置编码格式
			getHttpServletResponse().setCharacterEncoding("UTF-8");
			//向页面打印message信息
			getHttpServletResponse().getWriter().print(message);
			//刷新
			getHttpServletResponse().getWriter().flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//获取当前Session对象的用户
	protected Object getSessionUser() {
		SessionBean sb = (SessionBean) session.getAttribute(Constant.SESSION_BEAN);
		return sb.getUser();
	}

	//获取用户实体对象
	protected SimpleUser getSimpleUser() {
		SessionBean sb = (SessionBean) session.getAttribute(Constant.SESSION_BEAN);
		return (SimpleUser) sb.getUser();
	}

	//获取管理员
	protected SysUser getSysUser() {
		SessionBean sb = (SessionBean) session.getAttribute(Constant.SESSION_BEAN);
		return (SysUser) sb.getUser();
	}

	//获取Session对象的"name"字段的属性值
	protected Object getSessionValue(String name) {
		Object sb = session.getAttribute(name);
		return sb;
	}

	//bean.setImgFile(getUpdateFileField("imgFile"));
	protected String getUpdateFileField(String fieldName) {
		String str = request.getParameter(fieldName);
		if (StringUtils.isBlank(str)) {
			str = request.getParameter(fieldName + "_");
		}
		return str;
	}

}
