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
<%--添加一部视频课程的具体添加信息页面--%>
<%-- ${ctx}/sys/add${actionclass}.do 请求发送到 MovieAction类的 /addMovie.do--%>
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

					<%--备注： 表格的value="${modifybean.*}" 表示在表格的文本框中显示出该视频的对应信息
						这个属性在添加视频时没有用，因为添加的视频除了地区可以选择，其他都是空的
						这个属性只有在对一个视频信息进行修改时候才有用，可以显示出视频的全部信息
					--%>

					<%--选择地区信息--%>
					<tr>
					    <td align="right" width="15%">地区:</td>
					    <td width="84%">

					    	<select name="movieAreaId" id="Movie_movieArea">
								<%--在进入该页面前发送了/add2Movie.do请求，首先后台遍历出所有地区信息，保存在list中--%>
								<%--遍历出所有的地区信息，list从Action里面传过来--%>
								<c:forEach items="${list }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select>
					    </td>
				    </tr>

					<%--选择视频类型：value属性在添加视频时没有用（为空）--%>
				  	<tr>
					    <td align="right" width="15%">类型:</td>
					    <td width="84%">
					    	<input name="movieType" value="${modifybean.movieType}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

					<%--选择视频名称：value属性在添加视频时没有用（为空）--%>
				  	<tr>
					    <td align="right" width="15%">名称:</td>
					    <td width="84%">
					    	<input name="name" value="${modifybean.name}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

					<%--选择视频简介：value属性在添加视频时没有用（为空）--%>
				  	<tr>
					    <td align="right" width="15%">简介:</td>
					    <td width="84%">
					    	<textarea rows="5" cols="100" name="note">${modifybean.note }</textarea>
					    </td>
				    </tr>

					<%--选择视频图片：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">图片:</td>
					    <td width="84%">
					    	<input type="hidden" value="${modifybean.imageFile}" name="imageFile"/>
					    	<input name="resfile1" class="required" value="" type="file"/>
					    </td>
				    </tr>

					<%--选择上传的视频：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">视频:</td>
					    <td width="84%">
					    	<input type="hidden" value="${modifybean.movieFile}" name="movieFile"/>
					    	<input name="resfile2" class="required" value="" type="file"/>
					    </td>
				    </tr>

					<%--选择视频年代：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">年代:</td>
					    <td width="84%">
					    	<input name="movieYear" value="${modifybean.movieYear}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

					<%--选择视频主讲人：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">主讲人:</td>
					    <td width="84%">
					    	<input name="daoyan" value="${modifybean.daoyan}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

					<%--选择视频编者：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">编者:</td>
					    <td width="84%">
					    	<input name="yanyuan" value="${modifybean.yanyuan}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

					<%--选择视频时长：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">时长:</td>
					    <td width="84%">
					    	<input name="shichang" value="${modifybean.shichang}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

					<%--选择视频上映时间：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">上映时间:</td>
					    <td width="84%">
					    	<input name="shangyingshijian" value="${modifybean.shangyingshijian}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

					<%--选择视频语言：value属性在添加视频时没有用（为空）--%>
					<tr>
					    <td align="right" width="15%">语言:</td>
					    <td width="84%">
					    	<input name="yuyan" value="${modifybean.yuyan}" class="required" type="text" size="80"/>
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

