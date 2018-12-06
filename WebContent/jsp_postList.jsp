<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,post.PostClass"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String userId = (String)request.getAttribute("userId"); %>
<head>
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<title>게시판</title>
</head>
<style>
<!--
td {
	font-size: 9pt;
}

A:link {
	font: 9pt;
	color: black;
	text-decoration: none;
	font-family: 굴림;
	font-size: 9pt;
}

A:visited {
	text-decoration: none;
	color: black;
	font-size: 9pt;
}

A:hover {
	text-decoration: underline;
	color: black;
	font-size: 9pt;
}
-->
</style>
<script type="text/javascript">
	
</script>
<body topmargin=0 leftmargin=0 text=#464646>
	<%
		if (request.getAttribute(Constants.REDIRECTCAUSE) != null) {
			String rc = (String) request.getAttribute(Constants.REDIRECTCAUSE);
			if (rc.equals("write")) {
				out.print("<script type='text/javascript'>");
				out.print("alert('등록되었습니다.'); ");
				out.print("</script>");
			} else if (rc.equals("modify")) {
				out.print("<script type='text/javascript'>");
				out.print("alert('수정되었습니다.'); ");
				out.print("</script>");
			} else if (rc.equals("delete")) {
				out.print("<script type='text/javascript'>");
				out.print("alert('삭제되었습니다.'); ");
				out.print("</script>");
			} else if (rc.equals("favorite")) {
				out.print("<script type='text/javascript'>");
				out.print("alert('즐겨찾기 추가되었습니다.'); ");
				out.print("</script>");
			} else if (rc.equals("error")) {
				out.print("<script type='text/javascript'>");
				out.print("alert('에러입니다.'); ");
				out.print("</script>");
			} 
		}
	%>
	<center>
		<table width=580 border=1 cellpadding=2 cellspacing=1>
			<tr><td colspan="7" align="center"><H1><%=userId %>님의 게시판</H1></td></tr>
			<tr>
				<td>글번호</td>
				<td>글제목</td>
				<td>작성자</td>
				<td>작성날짜</td>
				<td>분야</td>
				<td>추천수</td>
				<td>조회수</td>
			</tr>
			<%
				PostClass Post = new PostClass();
				List<Map> view = new ArrayList<Map>();
				view = Post.postList(userId);
				for (int i = 0; i < view.size(); i++) {
					Map row = view.get(i);
			%>
			<tr>
				<td><%=row.get(Constants.POST_NUM)%></td>
				<td><a
					href="jsp_view.jsp?post_num=<%=row.get(Constants.POST_NUM)%>"><%=row.get(Constants.TITLE)%></a></td>
				<td><%=row.get(Constants.WRITERID)%></td>
				<td><%=row.get(Constants.REG_DATE)%></td>
				<td><%=row.get(Constants.CATEGORY)%></td>
				<td><%=row.get(Constants.POST_LIKE)%></td>
				<td><%=row.get(Constants.POST_HIT)%></td>
				<%
					}
				%>
			
		</table>
		<a href="jsp_write_form.jsp">작성하기</a>
		<INPUT type=button value="되돌아가기"
							onclick='history.back(-1); return false;'>
	</center>
	
</body>
</html>
