<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../jsp/common/head.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>${item.name } - ${appTitle }</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
	<meta name="referrer" content="no-referrer" />
	<script src="${ctx}/qiantai/static/js/jquery-1.11.3.min.js"></script>
	<link rel="stylesheet" href="${ctx}/qiantai/static/css/dilates.css">
	<link rel="stylesheet" href="${ctx}/qiantai/static/css/bootstrap.css">
    <script src="${ctx}/qiantai/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/qiantai/static/raty/lib/jquery.raty.css">
	<script src="${ctx}/qiantai/static/raty//lib/jquery.raty.js"></script>
	<script src="${ctx}/qiantai/static/raty/demo/javascripts/labs.js" type="text/javascript"></script>
	<link href="${ctx }/jplayer/skin/blue.monday/jplayer.blue.monday.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx }/jplayer/dist/jplayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript" src="${ctx }/jplayer/dist/add-on/jplayer.playlist.min.js"></script>
</head>
<body>

	<%--视频详情--%>
	<%--这是点击一个视频之后显示的视屏详情页面--%>

	<%--引入公共的头部部分--%>
	<%@ include file="./common/header.jsp"%>

	<div class="container">
		<div class="container-fluid" style="background:#fff;padding-top:15px;">
			<ol class="breadcrumb">
				<li><a href="${ctx}/">首页</a></li>
				<li><a href="${ctx}/com/list.do">视频</a></li>
				<%--显示该视频的名称--%>
				<li><span href="#">${item.name }</span></li>
			</ol>
			<div class="row">
				<div class="col-xs-9 movie-info padding-right-5" style="width:780px;">

					<%--大标题：视频的名称和年代--%>
					<h1>
						${item.name }
						<span class="year">(${item.movieYear })</span>
					</h1>


					<div class="row">
						<div class="col-xs-4 padding-right-0">

							<%--显示视频的图片信息--%>
							<a class="movie-post" href="#" style="display:block;position:relative;">
								<img class="img-thumbnail" alt="${item.name }" src="${item.imageFile1}" width="100%">
								<span class="qtag hdtag">视频</span>
							</a>

							<%--视频的图片正下方的分享视频的渠道--%>
							<div style="height:28px;">
								<div class="bdsharebuttonbox bdshare-button-style0-16" data-bd-bind="1484045781392">
								<a class="bds_more" href="#" data-cmd="more"></a>
								<a class="bds_qzone" title="分享到QQ空间" href="#" data-cmd="qzone"></a>
								<a class="bds_tsina" title="分享到新浪微博" href="#" data-cmd="tsina"></a>
								<a class="bds_tqq" title="分享到腾讯微博" href="#" data-cmd="tqq"></a>
								<a class="bds_renren" title="分享到人人网" href="#" data-cmd="renren"></a>
								<a class="bds_weixin" title="分享到微信" href="#" data-cmd="weixin"></a>
								</div>
								<script>
								window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
								</script>
							</div>
						</div>

						<%--视频图片信息右边的  表格：详细指出视频的详情信息--%>
						<div class="col-xs-8">
							<table class="table table-striped table-condensed table-bordered" style="margin-bottom:10px;font-size:12px;">
								<tbody>
									<tr>
										<td class="span2">
										<span class="info-label">主讲人</span>
										</td>
										<td>
										 ${item.daoyan } 
										</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">编者</span>
										</td>
										<td>
										 ${item.yanyuan } 
										</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">类型</span>
										</td>
										<td>
										<c:forEach items="${item.typeArray }" var="movieType">
										<a target="_blank" href="${ctx}/com/list.do?movieType=${movieType}">${movieType}</a>
										/
										</c:forEach>
										</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">地区</span>
										</td>
										<td>
										<a target="_blank" href="${ctx}/com/list.do?movieArea=${item.movieArea.id}">${item.movieArea.name }</a>
										</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">语言</span>
										</td>
										<td>${item.yuyan }</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">上映时间</span>
										</td>
										<td>${item.shangyingshijian }</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">片长</span>
										</td>
										<td>${item.shichang }</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">视频评分</span>
										</td>
										<td>
										<a class="imdb" rel="nofollow" target="_blank" href="#">${item.score }</a>
										</td>
									</tr>
									<tr>
										<td class="span2">
										<span class="info-label">评分</span>
										</td>
										<%--用js对评分进行处理--%>
										<td><span id="userScoreRaty"></span></td>
									</tr>
								</tbody>
							</table>

							<%--视频收藏按钮：点击可以将该视频收藏起来--%>
							<%--向 WebAction 类中的 /addMovieFav.do 发送请求--%>
							<div class="btn-group " role="group" aria-label="" style="margin-top:5px;">
								<a id="like_btn" class="btn btn-default btn-sm" href="${ctx }/com/addMovieFav.do?uid=${item.id}" role="button">
								<span class="glyphicon glyphicon-heart"></span>
								收藏
								</a>
							</div>
						</div>
					</div>

					<%--视频的播放模块：点击播放按钮可以播放视频--%>
					<div class="row" style="margin-top:5px;">
						<div class="col-xs-12">
							<h2>在线观看</h2>
						</div>

						<%--设置视频播放窗口的样式信息--%>
						<div class="col-xs-12 movie-introduce">
							<div id="jp_container_1" class="jp-video jp-video-360p" role="application" aria-label="media player" style="width:740px">
								<div class="jp-type-single">
									<div id="jquery_jplayer_1" class="jp-jplayer"></div>
									<div class="jp-gui">
										<div class="jp-video-play">
											<button class="jp-video-play-icon" role="button" tabindex="0">play</button>
										</div>
										<div class="jp-interface"  style="width:740px">
											<div class="jp-progress">
												<div class="jp-seek-bar">
													<div class="jp-play-bar"></div>
												</div>
											</div>

											<div class="jp-current-time" role="timer" aria-label="time">&nbsp;</div>
											<%--显示视频播放的时长--%>
											<div class="jp-duration" role="timer" aria-label="duration">&nbsp;</div>
											<div class="jp-controls-holder">
												<div class="jp-controls">
													<%--继续播放按钮--%>
													<button class="jp-play" role="button" tabindex="0">play</button>
													<%--暂停按钮--%>
													<button class="jp-stop" role="button" tabindex="0">stop</button>
												</div>
												<div class="jp-volume-controls">
													<%--静音按钮--%>
													<button class="jp-mute" role="button" tabindex="0">mute</button>
													<%--调节音量大小--%>
													<button class="jp-volume-max" role="button" tabindex="0">max volume</button>
													<div class="jp-volume-bar">
														<div class="jp-volume-bar-value"></div>
													</div>
												</div>
												<div class="jp-toggles">
													<%--重复播放一遍--%>
													<button class="jp-repeat" role="button" tabindex="0">repeat</button>
													<%--全屏进行播放--%>
													<button class="jp-full-screen" role="button" tabindex="0">full screen</button>
												</div>
											</div>
											<div class="jp-details">
												<div class="jp-title" aria-label="title">&nbsp;</div>
											</div>
										</div>
									</div>
									<div class="jp-no-solution">
										<span>Update Required</span> To play the media you will need to either update your browser to a recent version or
										update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
									</div>
								</div>
							</div>
						</div>
					</div>

					<%--视频介绍模块：介绍视频的信息--%>
					<%--该部分的内容来自于视频的简介--%>
					<div class="row" style="margin-top:5px;">
						<div class="col-xs-12">
							<h2>视频介绍</h2>
						</div>
						<div class="col-xs-12 movie-introduce">
							${item.note }
						</div>
					</div>
					 
					<div class="row">
						<div class="col-xs-12">
							<h2>精彩推荐</h2>
						</div>
						<%--精彩推荐的内容就是之前在推荐栏显示的内容--%>
						<div style="padding:0 10px;">
							<c:forEach items="${sugList }" var="itemSug">
							<div class="col-xs-2 movie-recommened">
								<a style="position:relative;display:block;" target="_blank" title="${itemSug.name }" href="${ctx}/com/getMovie.do?uid=${itemSug.id}">
								<img alt="${itemSug.name }" src="${itemSug.imageFile1 }" width="100%">
								<div class="item-hover"></div>
								</a>
								<a target="_blank" title="${itemSug.name }(${itemSug.movieYear})" href="${ctx}/com/getMovie.do?uid=${itemSug.id}">
								<h5>${itemSug.name }</h5>
								</a>
							</div>
							</c:forEach>
						</div>
					</div>


					<%--视频的评论区--%>
					<div class="row">
						<div class="col-xs-12">
							<h2>视频评论</h2>
						</div>
						<div class="c">
							<div class="row">
								<c:if test="${SESSION_BEAN.role=='SimpleUser'}">
									<div class="col-xs-12">
									<form action="${ctx }/com/addMovieComment.do">
										<input type="hidden" value="${item.id}" name="uid"/>
										<div style="margin-top:10px;margin-left: 20px">
											<textarea rows="5" cols="" placeholder="写点什么吧!" style="width:100%" name="content" required></textarea>
											<button type="submit" class="btn btn-primary btn-block">提交评论</button>
										</div>
									</form>
									</div>
								</c:if>

								<%--显示每一位评论者的评论信息--%>
								<div class="col-xs-12">
									<%--评论列表为空，那么就显示暂无评论--%>
									<c:if test="${empty commentList }">
										<div style="margin-top:10px;">
											<hr class="dline">
											<div style="border:2px dashed #CCC;margin-bottom:25px;color:#777;border-radius:5px;height:50px;line-height:50px;font-size:14px;text-align:center;font-family:'宋体'">暂无评论</div>
										</div>
									</c:if>

									<%--评论列表非空就遍历出每一个评论--%>
									<div style="margin-top:10px;margin-left: 20px">
										<ul id="pager">
										<c:forEach items="${commentList}" var="comment">
											<li>${comment.content }
											<%--判断是否为 V 用户--%>
											<br/><c:if test="${not empty comment.vtype }">(V)</c:if>
											${comment.user.userName } ${comment.addDate }
											</li>
											<hr class="dline">
										</c:forEach>
										</ul>
									</div>
								</div>

								<%--如果用户为登录：也就是游客模式：需要给出登录后才能评论的提示信息--%>
								<div class="col-xs-12">
									<c:if test="${SESSION_BEAN.role!='SimpleUser'}">
									<div class="alert-x alert-info reply-box">
										<strong>提示：</strong>
										<a href="${ctx }/reg.jsp">[注册]</a>
										/
										<a href="${ctx }/index.jsp">[登入]</a>
										之后才能评论
									</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>

				<%--网页的右侧边栏：最近更新 模块--%>
				<%--显示的内容就是之前查找的按照录入数据库的先后顺序排序的视屏信息--%>
				<div class="col-xs-3 sidebar" style="padding-left:15px;width:220px;padding-right:5px;">
					<div class="row">
						<div class="col-xs-12">
						</div>
					</div>
					<h3>最近更新</h3>
					<div class="list-group">
						<c:forEach items="${newList }" var="newItem" varStatus="newvITEM">
						<a class="list-group-item" target="_blank" href="${ctx}/com/getMovie.do?uid=${newItem.id}">

							<%--前三条更新的视频显示红色标记--%>
							<c:if test="${newvITEM.count<=3}">
							<span class="square-item-red">${newvITEM.count }</span>
							</c:if>

							<%--后三条更新的视频显示蓝色标记--%>
							<c:if test="${newvITEM.count>3}">
							<span class="square-item-blue">${newvITEM.count }</span>
							</c:if>
							${newItem.name}
						</a>
						</c:forEach>
					</div>

					<%--页面右侧边栏下方部分的  本周精选  模块--%>
					<%--精选的内容来自于  之前查找到的 精选内容--%>
					<h3>本周精选</h3>
					<div class="list-group">
						 <c:forEach items="${jingList }" var="newItem" varStatus="newvITEM">
							<a class="list-group-item" target="_blank" href="${ctx}/com/getMovie.do?uid=${newItem.id}">
								<c:if test="${newvITEM.count<=3}">
								<span class="square-item-red">${newvITEM.count }</span>
								</c:if>
								<c:if test="${newvITEM.count>3}">
								<span class="square-item-blue">${newvITEM.count }</span>
								</c:if>
								${newItem.name}
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%--使用JS对用户对视频的评分进行处理--%>
	<script type="text/javascript">
	$.fn.raty.defaults.path = '${ctx }/qiantai/static/raty/lib/images';
	var scorechecked = false;
	$(function(){

		/*jQuery操作DOM元素*/
		$('#userScoreRaty').raty(
			{ 
				score: ${item.score},
				halfShow : true,
				half: false,
				number: 10,
				/*评分的等级*/
				hints: ['烂片','烂片','烂片', '一般', '一般', '可以看看','可以看看', '好看','好看',  '非常精彩'],
				click: function(score, evt) {
					if(scorechecked){return false;}
					scorechecked = true;

					/*发送Ajax请求*/
				    $.ajax({
			     		url:"${ctx }/com/updateScore.do",
			     		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			     		type:"post",
			     		dataType:"json",
			     		data:{"uid":${item.id},"score":score,},//window.encodeURI(中文值)：对字符串进行编码
			     		success:function(json){
		     				layer.open({
		     					title : "提示信息",
		     					content : json.msg,
								/*评分成功则刷新页面*/
		     					yes: function(){	location.reload();}
		     				});
			     			scorechecked = false;
			     		},
			     		error:function(json){scorechecked = false;}
					});
				    return false;
				  }
			}
		);

		/*jQuery处理视频播放器*/
		$("#jquery_jplayer_1").jPlayer({
			ready: function () {
				$(this).jPlayer("setMedia", {
					title: "${item.name}", 
					m4v: "${ctx}/resource/${item.movieFile}",
					poster: "${item1.imageFile1}"
				});
			},
			swfPath: "${ctx}/jplayer/dist/jplayer",
			supplied: "webmv, ogv, m4v",
			size: {
				width: "740px",
				height: "480px",
				cssClass: "jp-video-360p"
			},
			useStateClassSkin: true,
			autoBlur: false,
			smoothPlayBar: true,
			keyEnabled: true,
			remainingDuration: true,
			toggleDuration: true
		});
		 
	});
	</script>
	<%@ include file="./common/footer.jsp"%>
</body>
</html>