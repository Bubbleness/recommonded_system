<%@ page pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	response.setHeader("Pragma","No-Cache");
	response.setHeader("Cache-Control","No-Cache");
	response.setDateHeader("Expires", 0);
%>
<%--<c:set>标签用于设置变量值和对象属性--%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="appTitle" value="智能推荐慕课网" />