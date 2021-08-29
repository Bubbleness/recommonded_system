<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html">
<title></title>
<link href="${ctx}/css/list.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/css.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.7.2.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx }/js/date/jquery.ui.all.css" />
<script type="text/javascript" src="${ctx }/js/date/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="${ctx }/js/date/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${ctx }/js/date/jquery.ui.datepicker-zh-CN.js"></script>
<meta name="referrer" content="no-referrer">
</head>
<body>

<%--管理员后台管理下的视屏管理下的界面--%>
<%--显示出当前系统中的全部的视频课程信息--%>

<form name="queryForm" id="queryForm" method="post" action="${ctx}/sys/query${actionclass}.do">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <%--ctx 表示类路径下面--%>
          <td height="62" background="${ctx}/images/nav04.gif">
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  	<td width="538">
					名称:<input name="s_" type="text" size="12" class=""/>
					<input name="Submit4" type="submit" class="right-button02" value="查 询" />
				</td>
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20">
	             	<input name="Submit" type="button" onclick="todelete()" class="right-button08" value="批量删除" />
	              	<input name="Submit2" type="button" class="right-button08" value="添加${actionname }" onclick="toAdd();"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table style="margin-top: 10px" width="100%"  class="table table-striped table-hover table-bordered">
                  <tr>
					    <th width="2%" align="center" height="30"><input type="checkbox" id="delcheckbox" onclick="delcheckbox1()"/></th>
	                   	<th width="60"></th>
	                   	<th width="60">地区</th>
	                   	<th width="100">类型</th>
	                   	<th width="100">名称</th>
	                   	<th width="60">年代</th>
	                   	<th width="100">主讲人</th>
	                   	<th width="100">上映时间</th>
	                   	<th width="60">语言</th>
	                   	<th width="60">用户评分</th>
	                   	<th width="60">评分人数</th>

						<th width="7%">操作</th>
				 </tr>
                  <%--遍历出当前页里面的所有内容--%>
                  <c:forEach items="${SESSION_PAGE.list}" var="item">
	                  <tr>
					    <td><input type="checkbox" name="delid" value="${item.id }"/></td>
	                   		<td>
	                   		<img alt="" src="${item.imageFile1}" style="border-radius:0.1em;" width="50px" onerror="javascript:this.src='${ctx}/resource/no.jpg'"><br/>
	                   		</td>
	                   		<td>${item.movieArea.name}</td>
	                   		<td>${item.movieType}</td>
	                   		<td>${item.name}</td>
	                   		<td>${item.movieYear}</td>
	                   		<td>${item.daoyan}</td>
	                   		<td>${item.shangyingshijian}</td>
	                   		<td>${item.yuyan}</td>
	                   		<td>${item.score}</td>
	                   		<td>${item.scoreUserNumber}</td>

               			<td>
                    		<a href="${ctx}/sys/get${actionclass}.do?uid=${item.id}">编辑</a> | 
							<a href="javascript:;" onclick="dodelete('${item.id}')">删除</a>
						</td>
	                  </tr>
				  </c:forEach>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="${ctx}/images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="40%">共 <span class="right-text09">${SESSION_PAGE.totalPage}</span> 页 | 第 <span class="right-text09">${SESSION_PAGE.currentPageNumber}</span> 页</td>
                <td width="49%" align="right">
                [
                <a href="${ctx}/sys/query${actionclass}.do?pageNum=1" class="right-font08">首页</a> | 
                <c:if test="${SESSION_PAGE.currentPageNumber>1}">
                <a href="${ctx}/sys/query${actionclass}.do?pageNum=${SESSION_PAGE.currentPageNumber-1}" class="right-font08">上一页</a> | 
                </c:if>
                <c:if test="${SESSION_PAGE.currentPageNumber<SESSION_PAGE.totalPage}">
                <a href="${ctx}/sys/query${actionclass}.do?pageNum=${SESSION_PAGE.currentPageNumber+1}" class="right-font08">下一页</a> | 
                </c:if>
                <a href="${ctx}/sys/query${actionclass}.do?pageNum=${SESSION_PAGE.totalPage}" class="right-font08">末页</a>
                ] 转至：</td>
                <td width="9%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="10%"><input name="pageNum" type="text" class="right-textfield03" size="1" style="height:20px"/></td>
                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value="" style="margin-top: 6px"/>
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<SCRIPT type="text/JavaScript">
function delcheckbox1(){
    /*单选框全部选中*/
	if($("#delcheckbox").attr("checked")=="checked"){
		selectAll();
	}else{
		unselectAll();
	}
}
/*全部选中*/
function selectAll(){
	var obj = document.queryForm.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}
/*全部不选中*/
function unselectAll(){
	var obj = document.queryForm.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

/*批量删除：产生删除的信息，以传递给后端进行操作*/
function todelete(){
	var ids = "";
	var obj = document.queryForm.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true){
				ids += obj[i].value+",";
			} 
			 
		}
	}
	if(ids==""){
		alert("请选择要删除的行");
		return;
	}else{
		ids = ids.substring(0, ids.length-1);
	}
	dodelete(ids);
}

/*进行删除*/
function dodelete(ids){
	if(window.confirm("确定要删除选中的信息")){
		window.location.href="${ctx}/sys/delete${actionclass}.do?ids="+ids;
	}
}

/*进行添加*/
function toAdd(){
	window.location.href="${ctx}/sys/add2${actionclass}.do";
}
$(function(){
	$(".date").each(function() {
		$(this).datepicker({changeYear: true,changeMonth: true,});
	});
});
</SCRIPT>
</body>
</html>
<%@ include file="./common/clear.jsp"%>
