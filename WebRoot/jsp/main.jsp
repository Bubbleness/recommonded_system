<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<c:if test="${empty SESSION_BEAN }">
<script type="text/javascript" language="javascript">
	top.location.href='${pageContext.request.contextPath}/index.jsp';
</script>
</c:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${appTitle }</title>
<meta name="referrer" content="no-referrer">
</head>

<frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0">
  <%--头部：显示用户信息以及系统时间等等--%>
  <frame src="${ctx }/jsp/common/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="213,*" frameborder="no" border="0" framespacing="0">
    <%--管理界面的左侧边栏部分：导航条--%>
    <frame src="${ctx }/jsp/left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <%--管理界面右侧部分：起始是一个背景，点击响应操作后会切换至对应的界面--%>
    <frame src="${ctx }/jsp/common/mainfra.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
<body>
 <%--管理员界面或者用户个人界面的整体部分--%>
</body>
</noframes></html>

