<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String[] s = (String[]) request.getAttribute("f_list");
	String msg = (String) request.getAttribute("redirectCause");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("<script type='text/javascript'>");
		out.print("alert('" + msg + "');");
		out.print("</script>");
		for (int i = 0; i < s.length; i++) {
			out.println(i + 1 + ". ID : <a href=\"jsp_view_form.jsp?post_num=" + s[i] + "\">" + s[i] + "</a><p>");
		}
		//request.setAttribute("f_list", null);
	%>
</body>
</html>