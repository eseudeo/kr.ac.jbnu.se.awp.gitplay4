<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants"
    pageEncoding="UTF-8"%>
<%
	String redirectUrl = Constants.JSP_MAINPAGE;
	session.removeAttribute(Constants.CURRENTUSER);
	response.sendRedirect(redirectUrl);
%>