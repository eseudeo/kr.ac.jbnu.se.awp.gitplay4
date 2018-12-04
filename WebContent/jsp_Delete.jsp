<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="post.PostClass,data.Constants" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
</script>
<body>
	<%
		String post_num = request.getParameter(Constants.POST_NUM);
		PostClass Post = new PostClass();

		String redirectCause = "";
		String redirectUrl = "";
		if (Post.delete(post_num)) {
			redirectCause = "delete";
			redirectUrl = "jsp_postList.jsp";
		} else {
			redirectCause = "error";
			redirectUrl = "jsp_postList.jsp";
		}
		request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	%>



</body>
</html>