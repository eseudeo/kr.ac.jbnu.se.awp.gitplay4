<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="sign.SignInClass, data.User, data.Constants, java.util.*,post.PostClass"
	pageEncoding="UTF-8"%>
	<jsp:useBean id="currentUser" class="data.User" scope="session" />
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>

		<%
			SignInClass signIn = new SignInClass();
		%>
		로그인 ID : <%= currentUser.getId() %>
		<table width=580 border=1 cellpadding=2 cellspacing=1>
			<tr>
				<td align="center"><H1>유저목록</H1></td>
			</tr>
			<tr>
				<td>유저 아이디</td>
			</tr>

			<%
				PostClass Post = new PostClass();
				List<Map> view = new ArrayList<Map>();
				view = Post.userList();
				for (int i = 0; i < view.size(); i++) {
					Map row = view.get(i);
					if (row.get(Constants.USERINFO_ID).equals(currentUser.getId())) {
						continue;
					}
				%>
				<tr>
				<td><a
					href="jsp_gotoPostList.jsp?userId=<%=row.get(Constants.USERINFO_ID)%>"><%=row.get(Constants.USERINFO_ID)%></a></td>
				<%
					}
				%>
			</tr>
		</table>
		<a
					href="jsp_gotoPostList.jsp?userId=<%=currentUser.getId()%>">자기 게시글 보기</a>
	</center>
</body>
</html>