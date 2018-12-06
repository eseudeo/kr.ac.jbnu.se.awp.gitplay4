<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,post.PostClass"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<Map> view = new ArrayList<Map>();

	int post_num = Integer.parseInt(request.getParameter(Constants.POST_NUM));
	PostClass Post = new PostClass();
	Post.hit(post_num);
	view = Post.view(post_num);
	Map row;
	row = view.get(0);
	request.setAttribute("post", row);
	
	String redirectCause = "post view";
	String redirectUrl = "jsp_view_form.jsp?post_num=" + row.get(Constants.POST_NUM);
	
	request.setAttribute("redirectCause", redirectCause);
	request.getRequestDispatcher(redirectUrl).forward(request, response);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

</body>
</html>