<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${ctx}/qiantai/static/layer-v3.1.1/layer/theme/default/layer.css">
<script src="${ctx}/qiantai/static/layer-v3.1.1/layer/layer.js"></script>
<script type="text/javascript">
	/*显示一些提示信息*/
	var errorMessage = "${errorMessage}"
	if (errorMessage != "") {
		showMyMessage("提示信息",errorMessage);
	}
	function showMyMessage(title,message){
		layer.open({
			title : title,
			content : message
		});
	}
</script>
<%
	session.removeAttribute("errorMessage");
%>