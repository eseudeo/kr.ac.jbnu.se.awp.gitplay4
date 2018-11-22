<%@ page language="java" contentType="text/html; charset=UTF-8" import = "post.WriteClass,data.Constants"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
    <script type="text/javascript">
    function Back()
    {
        	location.href = 'jsp_signIn_form.jsp';
    }
    </script>
<body>
<%
	String post_num=request.getParameter(Constants.POST_NUM);
WriteClass Write = new WriteClass();
		Write.delete(post_num);
		%>
		
		<INPUT type=button value="뒤로가기" onclick="Back();">
		
		
		
		
</body>
</html>