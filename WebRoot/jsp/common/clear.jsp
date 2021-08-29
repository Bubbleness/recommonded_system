<%@ page pageEncoding="UTF-8" %>
<%
com.ssm.util.Page p = (com.ssm.util.Page)session.getAttribute("SESSION_PAGE"); 
if(p!=null)p.getList().clear();
%> 