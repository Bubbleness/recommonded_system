<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>${appTitle }</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(${ctx}/images/left.gif);
}
-->
</style>
<link href="${ctx}/css/css.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="${ctx}/images/ico05.gif";//图片ico04为白色的正方形
	for(var i=1;i<30;i++){
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1) {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="${ctx}/images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}
function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="${ctx}/images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="${ctx}/images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="${ctx}/images/ico04.gif";
	}
}
</SCRIPT>
<body>
<%--管理员界面的左边栏部分--%>
<%--用户个人界面左侧边栏部分--%>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="${ctx}/images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="${ctx}/images/ico02.gif" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好: <span class="left-font02">${SESSION_BEAN.user.userName}</span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="${ctx}/com/logout.do" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		<%int menuindex = 1; %>
		<!--  任务系统开始    -->
	<c:if test="${SESSION_BEAN.role=='SysUser'}">
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="${ctx}/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >系统管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryMovie.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">视频管理</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryMovieCommentAll.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">评论管理</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryMovieArea.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">地区管理</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryMovieType.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">分类管理</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryMovieHot.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">滚动图片管理</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/querySysUser.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">管理员管理</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/querySimpleUser.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">用户管理</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryApplyAll.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">申请审核</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/com/update2Password.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">修改密码</a></td>
				</tr>
      	</table>
     </c:if>
	<c:if test="${SESSION_BEAN.role=='SimpleUser'}">
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="${ctx}/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >系统管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryMovieFav.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">我的收藏</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryMovieComment.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">我的评论</a></td>
				</tr>
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/sys/queryApply.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">我的申请</a></td>
				</tr>
				 
				<tr style="height: 25px">
				  <td width="9%" height="20" ><img id="xiaotu<%=(menuindex) %>" src="${ctx}/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="${ctx}/com/update2Password.do" target="mainFrame" class="left-font03" onClick="tupian('<%=(menuindex++) %>');">修改密码</a></td>
				</tr>
      	</table>
     </c:if>
		<!--  任务系统结束    -->
	  </TD>
  </tr>
</table>
<script type="text/javascript">
list('8');
</script>
</body>
</html>