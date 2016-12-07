<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<%@ page import="com.entity.*"%>

<%
	UserInfo checkMLogin = (UserInfo)session.getAttribute("mUsers");
	if(checkMLogin == null){
		response.sendRedirect("err.htm");
		return;
	}
 %>
