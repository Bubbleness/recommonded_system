<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./common/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html">
<link rel="stylesheet" rev="stylesheet" href="${ctx}/css/style.css" type="text/css" media="all" />
<link rel="stylesheet" rev="stylesheet" href="${ctx}/css/btn.css" type="text/css" media="all" />
<link href="${ctx}/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="${ctx}/js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="${ctx}/js/jquery.validate.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="${ctx }/js/date/jquery.ui.all.css" />
<script type="text/javascript" src="${ctx }/js/date/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript" src="${ctx }/js/date/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="${ctx }/js/date/jquery.ui.datepicker-zh-CN.js"></script>
<link href="${ctx }/js/kindeditor_4.1.11/themes/default/default.css" rel="stylesheet">
<script src="${ctx }/js/kindeditor_4.1.11/kindeditor-all.js"></script>
<script src="${ctx }/js/kindeditor_4.1.11/lang/zh-CN.js"></script>
</head>
<body class="ContentBody">

<%--添加网站首页的轮播图信息界面--%>

<form action="${ctx}/sys/add${actionclass}.do" method="post" enctype="multipart/form-data" name="fom" id="modifyForm">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加${actionname } </legend>
				  <table style="width:95%"  class="table table-striped table-hover table-bordered">
				  	<tr>
					    <td align="right" width="15%">名称:</td>
					    <td width="84%">
					    	<input name="name" value="${modifybean.name}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">图片:</td>
					    <td width="84%">
					    	<input type="hidden" value="${modifybean.imgFile}" name="imgFile"/>
					    	<input name="resfile" class="required" value="" type="file"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">链接:</td>
					    <td width="84%">
					    	<input name="murl" value="${modifybean.murl}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	 
				  </table>
				</fieldset>
				</TD>
			</TR>
		</TABLE>
	 </td>
  </tr>
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="submit" name="Submit" value="保存" class="button blue medium"/>　
			<input type="button" name="Submit2" value="返回" class="button blue medium" onclick="window.history.go(-1);"/></TD>
		</TR>
		</TABLE>
	 </td>
  </tr>
  </table> 
</div>
</form>
<script  type="text/javascript">
jQuery.validator.addMethod("isPhone", function(value, element) {
    	var length = value.length;
    	var mobile = /^1[3456789][0-9]{9}$/
    	return this.optional(element) || (length == 11 && mobile.test(value));
   }, "请填写正确的手机号码");
$(function() {  
	 $("#modifyForm").validate({
		 	rules: {
			 	password : {
					required : true,
					minlength : 6
				},
				confirm_password : {
					required : true,
					minlength : 6,
					equalTo : "#password"
				},
				userPhone:{
					isPhone:true
				}
				
		 	},
			messages : {
				password : {
					required : "请输入密码",
					minlength : jQuery.format("密码不能小于{0}个字 符")
				},
				confirm_password : {
					required : "请输入确认密码",
					minlength : "确认密码不能小于5个字符",
					equalTo : "两次输入密码不一致"
				}
			}
		});
		$(".date").each(function() {
			$(this).datepicker({changeYear: true,changeMonth: true,});
		});
	});
</script>
</body>
</html>
