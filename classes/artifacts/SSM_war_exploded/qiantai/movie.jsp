<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../jsp/common/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>搜索 - ${appTitle }</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="referrer" content="no-referrer" />
	<script src="${ctx}/qiantai/static/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="${ctx}/qiantai/static/css/movie.css">
	<link rel="stylesheet" href="${ctx}/qiantai/static/css/bootstrap.css">
    <script src="${ctx}/qiantai/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx }/qiantai/static/page/simplePagination.css" />
</head>
<body>

	<%--这是一个按条件搜索视频的界面，用来筛选出满足条件的视频
		搜索视频的实现方式：通过读取到用户选中的标签的内容，将其作为参数向后台发送请求
		后台读取到请求中的参数，按照参数的内容进行筛选满足条件的视屏
	--%>

	<%--点击搜索后显示的页面--%>
	<%--在这个页面可以点击相应的限制条件来搜索出相关的视频信息--%>
	<%--相当于按照给定的条件进行模糊查询--%>
	<%--这里引入了页面的公共头部部分：使用JSP的 include标签--%>
	<%@ include file="./common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="tag-box">
				<table class="table" style="margin-bottom:10px;">
					<tbody>
						<tr>
							<%--按照选定的年份进行查询：所有的年份是遍历所有视频的年份生成的--%>
							<%--向 WebAction 类中的 /list.do 发送请求，并且同时将参数传递给后端--%>
							<td class="tag-span2">年份：</td>
							<td class="tags">
								<%--如果年份这个条件中没有选择年份，那么对年份不做任何限制--%>
								<c:if test="${not empty nian }">
								<a class="tag" href="${ctx}/com/list.do?nian=&movieArea=${movieArea}&movieType=${movieType}" data-value="全部">全部</a>
								</c:if>

								<%--年份不为空：也就是选择了某个年份--%>
								<%--被选中的年份需要高亮显示--%>
								<c:if test="${empty nian }">
								<a class="tag active" href="${ctx}/com/list.do?nian=&movieArea=${movieArea}&movieType=${movieType}" data-value="全部">全部</a>
								</c:if>

								<%--遍历所有的年份--%>
								<c:forEach items="${nianList }" var="itemNian">

									<%--如果某一个具体的年份被选中，则向后台发送该指定年份的请求--%>
									<%--也就是在发送的查询请求中添加了年份的限制：查询出指定的年份的视屏--%>
									<c:if test="${itemNian==nian}">
										<a class="tag active" href="${ctx}/com/list.do?nian=${itemNian}&movieArea=${movieArea}&movieType=${movieType}" data-value="${itemNian }">${itemNian }</a>
									</c:if>
									<c:if test="${itemNian!=nian}">
										<a class="tag" href="${ctx}/com/list.do?nian=${itemNian}&movieArea=${movieArea}&movieType=${movieType}" data-value="${itemNian }">${itemNian }</a>
									</c:if>
								</c:forEach>
							</td>
						</tr>


						<%--进行视频地区的条件筛选--%>
						<tr>
							<td class="tag-span2">国家地区：</td>
							<td class="tags">
								<c:if test="${not empty movieArea }">
								<a class="tag" href="${ctx}/com/list.do?nian=${nian }&movieArea=&movieType=${movieType}" data-value="全部">全部</a>
								</c:if>
								<c:if test="${empty movieArea }">
								<a class="tag active" href="${ctx}/com/list.do?nian=${nian }&movieArea=&movieType=${movieType}" data-value="全部">全部</a>
								</c:if>
								<c:forEach items="${areaList }" var="itemArea">
									<c:if test="${itemArea.id == movieArea}">
										<a class="tag active" href="${ctx}/com/list.do?nian=${nian}&movieArea=${itemArea.id}&movieType=${movieType}" data-value="${itemNian }">${itemArea.name }</a>
									</c:if>
									<c:if test="${itemArea.id != movieArea}">
										<a class="tag" href="${ctx}/com/list.do?nian=${nian}&movieArea=${itemArea.id}&movieType=${movieType}" data-value="${itemNian }">${itemArea.name }</a>
									</c:if>
								</c:forEach>
							</td>
						</tr>


						<%--进行视频类型的筛选--%>
						<tr style="border-bottom:1px solid #DDD;">
							<td class="tag-span2">视频类型：</td>
							<td class="tags">
								<c:if test="${not empty movieType }">
									<a class="tag" href="${ctx}/com/list.do?nian=${nian}&movieArea=${movieArea}&movieType=" data-value="全部">全部</a>
								</c:if>
								<c:if test="${empty movieType }">
									<a class="tag active" href="${ctx}/com/list.do?nian=${nian }&movieArea=${movieType }&movieType=" data-value="全部">全部</a>
								</c:if>
								 <c:forEach items="${typeList }" var="itemType">
									<c:if test="${itemType.name == movieType}">
										<a class="tag active" href="${ctx}/com/list.do?nian=${nian}&movieArea=${movieArea}&movieType=${itemType.name}" data-value="${itemNian }">${itemType.name}</a>
									</c:if>
									<c:if test="${itemType.name != movieType}">
										<a class="tag" href="${ctx}/com/list.do?nian=${nian}&movieArea=${movieArea}&movieType=${itemType.name}" data-value="${itemNian }">${itemType.name}</a>
									</c:if>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="col-xs-12" style="padding:0 5px;">

				<%--没有筛选到满足条件的视频信息--%>
				<c:if test="${empty SESSION_PAGE.list }">
					<div class="col-xs-1-5 col-sm-4 col-xs-6 movie-item">没有找到相关信息</div>
				</c:if>

				<%--筛选出来了结果：那就遍历出结果，显示出满足条件的视频信息--%>
				<c:forEach items="${SESSION_PAGE.list }" var="item">
				<div class="col-xs-1-5 col-sm-4 col-xs-6 movie-item">
					<div class="movie-item-in">
						<a style="position:relative;display:block;" title="${item.name }" target="_blank" href="${ctx }/com/getMovie.do?uid=${item.id}">
							<img alt="${item.name }" title="${item.name }" src="${item.imageFile1 }">
							<span class="qtag hdtag">视频</span>
							<div class="item-hover"></div>
						</a>
						<div class="meta">
							<h1>
								<a href="}/com/getMovie.do?uid=${item.id}" target="_blank" title="${item.name }">${item.name }</a>
								<em> - ${item.score}分</em>
							</h1>
							<div class="otherinfo">
								类型：
								<c:forEach items="${item.typeArray }" var="itemType">
									<a class="movietype" target="_blank" href="${ctx}/com/list.do?movieType=${itemType}">${itemType }</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				 
			</div>	
		</div>
		<script type="text/javascript" src="${ctx }/qiantai/static/page/jquery.simplePagination.js"></script>
		<!-- 分页 -->
		<div class="pager-bg">
			<div id="light-pagination" class="pagination"></div>
		</div>
	</div>
	<script type="text/javascript">
		$('#light-pagination').pagination({
			pages: ${SESSION_PAGE.totalPage},
			cssStyle: 'light-theme',
			displayedPages: 5,
			currentPage:${SESSION_PAGE.currentPageNumber},
			edges: 7,
			hrefTextSuffix:'&nian=${nian }&movieArea=${movieArea}&movieType=${movieType}'
		// 	onPageClick:function(pageNumber, event){window.location="${ctx}/com/queryForum.do?pageNum="+pageNumber;}
		});
	</script>
	<%@ include file="./common/footer.jsp"%>
</body>
</html>