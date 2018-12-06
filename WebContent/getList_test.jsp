<%@ page language="java" contentType="text/html; charset=UTF-8" import="data.Constants, java.util.*,post.PostClass"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
		<table width=580 border=1 cellpadding=2 cellspacing=1>
			<tr><td align="center"><H1>유저목록</H1></td></tr>
			<tr>
				<td>유저 아이디</td>
			</tr>
			
			<%
				PostClass Post = new PostClass();
				List<Map> view = new ArrayList<Map>();
				view = Post.userList();
				for (int i = 0; i < view.size(); i++) {
					Map row = view.get(i);
			%>
			<tr>
				<td><a
					href="jsp_gotoPostList.jsp?userId=<%=row.get(Constants.USERINFO_ID)%>"><%=row.get(Constants.USERINFO_ID)%></a></td>
				<%
					}
				%>
			
		</table>
		<a href="jsp_write_form.jsp">작성하기</a>
	</center>
</body>
</html>