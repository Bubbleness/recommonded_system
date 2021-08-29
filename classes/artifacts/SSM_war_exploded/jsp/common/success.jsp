<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<link rel="stylesheet" href="${ctx}/js/layer-v3.1.1/layer/theme/default/layer.css">
<script src="${ctx}/js/jquery-1.7.2.js"></script>
<script src="${ctx}/js/layer-v3.1.1/layer/layer.js"></script>
<script>
var errorMessage = "${ActionMessage}"
if (errorMessage != "") {
	layer.open({
		title : '操作成功',
		content : errorMessage,
		yes: function(index, layero){
			layer.close(index); 
			var url = "${ForwardUrlKey}";
			if(url!=""){
				window.location.href="${ctx}/"+url;
			}else{
				window.history.go(-1);
			}
		}
	});
}
</script>