<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../jsp/common/head.jsp"%>

<%--网页的 公共头部 部分--%>
<%--也就是从 网页最顶端  一直到  上半部分公告那边 为止--%>
<div id="top">
	<div class="top_main">
		<div class="top_main_left">
			<p>欢迎来到${appTitle }，一起分享视频给我们带来的快乐。</p>
		</div>
		<div class="top_main_right">
			<a class="top_main_right_2" href="">Ctrl+D 加入收藏夹</a>
		</div>
	</div>
</div>
<header>
	<div class="logo">
		<h1>
			<a href="${ctx }/" style="font-size: 30px">${appTitle }</a>
		</h1>
	</div>

	<%--网页上的 搜索框--%>
	<%--按照搜索的内容，在后台进行模糊查询--%>
	<div class="search">
		<form action="${ctx}/com/list.do" method="get">
			<input type="search" name="name" value="${name }" placeholder="请输入视频名字">
			<input type="submit"  value="搜索">
		</form>

	</div>
</header>
<nav>
	<div class="nav">
		<div class="nav_item">
			<a href="${ctx}/">
				<p>首页</p>
				<p>首页</p>
			</a>
		</div>
		<div class="nav_item">
			<a href="${ctx}/com/list.do">
				<p>视频</p>
				<p>视频</p>
			</a>
		</div>
		<c:choose>
			<%--显示出当前登录的用户的姓名--%>
			<c:when test="${SESSION_BEAN.role=='SimpleUser'}">
				<li style="width:40px">
					 <a style="" href="${ctx}/com/logout.do">退出</a>
				</li>
				<li style="width:150px">欢迎您: <a style="display: inline;" href="${ctx}/jsp/main.jsp">${SESSION_BEAN.user.userName }</a></li>
			</c:when>
			<c:otherwise>
				<li>
					<a href="${ctx}/reg.jsp">注册</a>
				</li>
				<li>
					<a href="${ctx}/index.jsp">登录</a>
				</li>
			</c:otherwise>
		</c:choose>

	</div>
</nav>