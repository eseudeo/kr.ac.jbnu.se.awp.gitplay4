<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String Id = request.getParameter("userId");
	request.setAttribute("userId", Id);
	request.getRequestDispatcher("jsp_postList.jsp").forward(request, response);
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