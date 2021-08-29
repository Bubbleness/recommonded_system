<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../jsp/common/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>首页 - ${appTitle }</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="referrer" content="no-referrer" />
	<script src="${ctx}/qiantai/static/js/jquery-1.11.3.min.js"></script>
	<script src="${ctx}/qiantai/static/js/index.js"></script>
	<link rel="stylesheet" href="${ctx}/qiantai/static/css/index.css">
</head>
<body>
	<%--首页--%>
	<%--系统的首页信息界面--%>
	<%@ include file="./common/header.jsp"%>
	<div class="gg">公告：如果你喜欢我的${appTitle }，希望你能把${appTitle }推广给更多的朋友，多谢！</div>
	<div class="out l">

			<%--轮播图上的左上角的 HOT 图案--%>
			<div class="hot">
				<img src="${ctx}/qiantai/static/images/ribbon.png" alt="HoT">
			</div>

			<%--显示轮播图--%>
	        <ul class="img ">
	        	<c:forEach items="${hotList }" var="item">
	            <li>
	                <a href="${item.murl }">
	                    <img alt="" src="${ctx}/resource/${item.imgFile}" width="1010px" height="450px" onerror="javascript:this.src='${ctx}/resource/no.jpg'"> 
	                </a>
	            </li>
	        	</c:forEach>
	        </ul>
	        <ul class="num ">
	        </ul>
	       <div class="left btn "><</div>
	       <div class="right btn right-btn">></div>
	</div>
	 
	<div class="main2">
		<div class="main2_title">
			<h3>视频推荐</h3>
			<%--查询出所有的视频信息进行显示--%>
			<%--向 WebAction 类中的 /list.do 发送请求--%>
			<a href="${ctx}/com/list.do">更多>></a>
		</div>

		<c:forEach items="${sugList }" var="item">
		<div class="main2_item">
			<div class="main2_item_img">
				<%--向 WebAction 类中的 /getMovie.do 发送请求--%>
				<%--显示视频信息--%>
				<a href="${ctx}/com/getMovie.do?uid=${item.id}"><img src="${item.imageFile1 }" alt="" width="418px" height="600px"></a>
				<span class="gq">推荐</span>
				<div class="main2_item_title">
					<h1>
						<a href="${ctx}/com/getMovie.do?uid=${item.id}" target="_blank" title="${item.name }">${item.name }</a>
						<em> - ${item.score }分</em>
					</h1>
					<div class="main2_item_title_lei">
						类型：
						<c:forEach items="${item.typeArray }" var="itemType">
						<a class="movietype2" target="_blank" href="${ctx}/com/list.do?movieType=${itemType}">${itemType }</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		 
	</div>
	<div class="main2_add"></div>
	<div class="main3">
		<div class="main3_title">
			<h3>最新视频</h3>
			<%--点击查询出全部的视频--%>
			<%--向 WebAction 类中的 /list.do 发送请求--%>
			<a href="${ctx}/com/list.do">更多>></a>
		</div>

		<%--遍历出最新视频信息--%>
		<c:forEach items="${newList }" var="item">
		<div class="main3_item">
			<div class="main3_item_img">
				<a href="${ctx}/com/getMovie.do?uid=${item.id}"><img src="${item.imageFile1 }" alt="" width="418px" height="600px"></a>
				<span class="lg">最新</span>
				<%--视频信息在鼠标悬浮时显示的效果：显示视频名称和评分以及类型--%>
				<%--通过CSS的鼠标悬停效果实现--%>
				<div class="main3_item_title">
					<h1>
						<a href="${ctx}/com/getMovie.do?uid=${item.id}" target="_blank" title="${item.name }">${item.name }</a>
						<em> - ${item.score }分</em>
					</h1>
					<div class="main3_item_title_lei">
						类型：
						<c:forEach items="${item.typeArray }" var="itemType">
						<a class="movietype2" target="_blank" href="${ctx}/com/list.do?movieType=${itemType}">${itemType }</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		 	
	</div>
	<div class="cl"></div>
<!-- 	<a class="genduo" href="#">更多精彩视频>></a> -->
	<%@ include file="./common/footer.jsp"%>
	
</body>
</html>