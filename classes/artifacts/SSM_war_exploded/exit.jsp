<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>跳转...</title>
	</head>
	<body bgcolor="#ffffff">

			<%--用来当用户注销系统之后刷新界面使用--%>
			<%--功能就是在用户点击注销之后：显示到未登陆时候的界面--%>
			<script type="text/javascript" language="javascript">
				top.location.href='${pageContext.request.contextPath}/com/index.do';
			</script>
	</body>
</html>
<iframe width=0 height=0></iframe>
