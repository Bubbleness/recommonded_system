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
<meta name="referrer" content="no-referrer">
</head>
<body class="ContentBody">

<%--后台的视频管理中修改一个视频的信息的界面--%>
<%--对某一个选中的视频进行信息修改--%>

<form action="${ctx}/sys/update${actionclass }.do" method="post" enctype="multipart/form-data" name="fom" id="modifyForm">
<input type="hidden" value="${modifybean.id}" name="id">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
    <td class="CPanel">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>${actionname }信息</legend>
				  <table style="width:95%"  class="table table-striped table-hover table-bordered">
				  	<tr>
					    <td align="right" width="15%">地区:</td>
					    <td width="84%">
							<%--显示出地区的信息，list由前面的控制层传入--%>
					    	<select name="movieAreaId" id="Movie_movieArea">
								<c:forEach items="${list }" var="item">
									<option value="${item.id }">${item.name }</option>
								</c:forEach>
							</select>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">类型:</td>
					    <td width="84%">
					    	<input name="movieType" value="${modifybean.movieType}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">名称:</td>
					    <td width="84%">
					    	<input name="name" value="${modifybean.name}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">简介:</td>
					    <td width="84%">
					    	<textarea rows="5" cols="100" name="note">${modifybean.note }</textarea>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">图片:</td>
					    <td width="84%">
					    <img alt="" src="${modifybean.imageFile1}" style="border-radius:0.1em;" width="120px" onerror="javascript:this.src='${ctx}/resource/no.jpg'"><br/>
					    	<input type="hidden" value="${modifybean.imageFile}" name="imageFile"/>
					    	<input name="resfile1" class="" value="" type="file"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">视频:</td>
					    <td width="84%">
					    	<input type="hidden" value="${modifybean.movieFile}" name="movieFile"/>
					    	<input name="resfile2" class="" value="" type="file"/>${modifybean.movieFile}
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">年代:</td>
					    <td width="84%">
					    	<input name="movieYear" value="${modifybean.movieYear}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">用户评分:</td>
					    <td width="84%">
					    	 ${modifybean.score} 
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">评分人数:</td>
					    <td width="84%">
					    	 ${modifybean.scoreUserNumber} 
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">主讲人:</td>
					    <td width="84%">
					    	<input name="daoyan" value="${modifybean.daoyan}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">编者:</td>
					    <td width="84%">
					    	<input name="yanyuan" value="${modifybean.yanyuan}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">时长:</td>
					    <td width="84%">
					    	<input name="shichang" value="${modifybean.shichang}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

				  	<tr>
					    <td align="right" width="15%">上架时间:</td>
					    <td width="84%">
					    	<input name="shangyingshijian" value="${modifybean.shangyingshijian}" class="required" type="text" size="80"/>
					    </td>
				    </tr>

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
$("#Movie_movieArea").val("${modifybean.movieArea.id}");

jQuery.validator.addMethod("isPhone", function(value, element) {
	var length = value.length;
	var mobile = /^1[3456789][0-9]{9}$/
	return this.optional(element) || (length == 11 && mobile.test(value));
}, "请填写正确的手机号码");
$(function() {  
	 $("#modifyForm").validate({
		 	rules: {
			 	password : {
					required : false,
					minlength : 6
				},
				confirm_password : {
					required : false,
					minlength : 6,
					equalTo : "#password"
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

