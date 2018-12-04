<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="post.PostClass,data.Constants" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String writer = request.getParameter("writer");
		String post_num = request.getParameter("post_num");
		session.setAttribute("userId", "newlhh");
		String id = (String) session.getAttribute("userId");
		PostClass Post = new PostClass();
		Post.favorite(id, post_num);

		String redirectCause = "favorite";
		String redirectUrl = "jsp_postList.jsp";
		request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	%>
</body>
</html>