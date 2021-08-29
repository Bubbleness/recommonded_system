<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./jsp/common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
<title>登陆-${appTitle }</title>
<link rel="stylesheet" href="${ctx}/js/login/css/frozenui.css">
<link rel="stylesheet" href="${ctx}/js/login/css/login.css">
<link rel="stylesheet" href="${ctx}/js/login/css/base.css">
</head>
<body>

	<%--系统的登录注册界面--%>
	<%--实现用户的注册和登录功能--%>
	<div class="c-title">
		<p class="name">${appTitle }</p>
	</div>

	<div class="c-login">
		<h1>登陆</h1>
		<%--向 LoginAction 类中的 /login.do 发送请求信息--%>
		<form class="loginForm" action="${ctx}/com/login.do" method="post">
			<p style="color: #ff7575; height: 40px">${signErrorMessage }</p>
			<input type="text" class="userLogo" name="username" placeholder="请输入账号" lay-verify="required">
			<input type="password" name="password" placeholder="请输入密码" lay-verify="required">
			<input type="text" name="checkcode" placeholder="请输入验证码" lay-verify="required">
			<select name="loginType" style="height: 30px; margin-left: 40px; float: left; width: 110px">
				<option value="SysUser">管理员</option>
				<option value="SimpleUser">普通用户</option>
			</select>
			<img style="border: 0px; margin-left: 10px; float: left" width="" height="30px"
				src="${pageContext.request.contextPath }/checkcode" alt="验证码" align="left"
				onclick="this.src = '${pageContext.request.contextPath }/checkcode?' + Math.random();" />
			<div style="clear: both"></div>
			<input type="button" value="登陆" id="regBtn" style="margin-top: 10px">
			<a href="./reg.jsp">用户注册</a>
		</form>
	</div>
	<script type="text/javascript" src="${ctx}/js/login/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/login/js/base.js"></script>
	<script type="text/javascript">
		$('#regBtn').click(function() {
			if (!checkInputFunction($('#regBtn'))) {
				return false;
			}
			$(".loginForm").submit();
		});
	</script>
</body>
</html>
<%
	session.removeAttribute("signErrorMessage");
%>