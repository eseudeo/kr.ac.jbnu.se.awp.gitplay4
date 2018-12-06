<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="currentUser" class="data.User" scope="session" />

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
	<center>
		<%= currentUser.getId() %>님의 즐겨찾기 리스트
		<%
		out.print("<script type='text/javascript'>");
		out.print("alert('" + msg + "');");
		out.print("</script>");
		int num;
		for (int i = 1; i < s.length; i++) {
			if (s[i].isEmpty()) {
				continue;
			}

			out.println(i + ". ID : <a href=\"jsp_view_form.jsp?post_num=" + s[i] + "\">" + s[i] + "</a><p>");
		}

		//request.setAttribute("f_list", null);
	%>

		<INPUT type=button value="되돌아가기"
			onclick='history.back(-1); return false;'>
	</center>
</body>
</html>