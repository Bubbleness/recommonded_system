<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="${ctx}/css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%--后台管理上方显示用户名和时间等信息--%>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="59" background="${ctx}/images/top.gif">
				<table width="99%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="50%" align="left" style="font-size: 30px">
							<a href="${ctx}" target="_top" class="left-font01" style="font-size: 20px; margin-left: 20px">${appTitle }</a>
						</td>
						<td width="50%" align="right" style="font-size: 14px">
							<a id="nowDiv"></a>
							| 账号：${SESSION_BEAN.user.uname } | 角色：${SESSION_BEAN.user.role }
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<script>
	var date = new Date(); 
	var now = "";
	var nowdiv = document.getElementById("nowDiv");
	function show(){
	date = new Date();
	now = "";
	now = date.getFullYear()+"/";
	now = now + (date.getMonth()+1)+"/"; 
	now = now + date.getDate()+" ";
	now = now + (date.getHours()>=10?date.getHours():("0"+date.getHours()))+":";
	now = now + (date.getMinutes()>=10?date.getMinutes():("0"+date.getMinutes()))+":";
	now = now + (date.getSeconds()>=10?date.getSeconds():("0"+date.getSeconds()))+" ";
	nowdiv.innerHTML = now; 
	setTimeout("show()",1000);
	}
	show();
</script>
</body>
</html>
