<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="./jsp/common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html">
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, initial-scale=1.0, user-scalable=no">
<title>注册-${appTitle }</title>
<link rel="stylesheet" href="${ctx}/js/login/css/frozenui.css">
<link rel="stylesheet" href="${ctx}/js/login/css/login.css">
<link rel="stylesheet" href="${ctx}/js/login/css/base.css">
</head>
<body>

	<%--用户的注册界面--%>
	<%--完成用户的注册功能--%>
	<div class="c-title">
		<p class="name">${appTitle }</p>
	</div>
	<div class="c-login">
		<h1>注册</h1>
		<form class="loginForm" action="${ctx}/com/reg.do" method="post">
			<p style="color: #ff7575; height: 40px">${signErrorMessage }</p>
			<input type="text" class="userLogo" name="uname" placeholder="请输入账号" lay-verify="required">
			<input type="text" class="userLogo" name="userName" placeholder="请输入姓名" lay-verify="required">
			<input type="text" placeholder="请输入手机号码" name="userPhone" lay-verify="required|phone" maxlength="11">
			<input type="text" class="userLogo" name="userEmail" placeholder="请输入邮箱" lay-verify="required|email">
			<input type="password" name="userPassword" id="p1" placeholder="请输入密码" lay-verify="required">
			<input type="password" placeholder="请输入确认密码" id="p2" lay-verify="required">
			<input type="button" value="注册" id="regBtn">
			<a href="./index.jsp">账号登陆</a>
		</form>
	</div>
	<script type="text/javascript" src="${ctx}/js/login/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/login/js/base.js"></script>
	<script type="text/javascript">
		$('#regBtn').click(function() {
			if (!checkInputFunction($('#regBtn'))) {
				return false;
			}
			if ($("#p1").val() != $("#p2").val()) {
				showTip.fall("2次密码输入不一致");
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