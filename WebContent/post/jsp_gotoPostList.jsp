<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants" pageEncoding="UTF-8"%>
		<jsp:useBean id="currentUser" class="data.User" scope="session" />
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String Id = currentUser.getId();
	String redirectUrl = "jsp_postList.jsp";
	request.getRequestDispatcher(redirectUrl).forward(request, response);
%>
<script>
	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>