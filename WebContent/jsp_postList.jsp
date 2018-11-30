<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,post.PostClass"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%
	//List<Map> view = new ArrayList<Map>();
	//WriteClass Write = new WriteClass();
	//view = Write.viewlist();
	//Map row;
%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
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

	<center>
		<table width=580 border=1 cellpadding=2 cellspacing=1>
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
				view = Post.postCount();
				for (int i = 0; i < view.size(); i++) {
					Map row = view.get(i);
			%>
			<tr>
				<td><%=row.get(Constants.POST_NUM)%></td>
				<td><a
					href="jsp_view_form.jsp?post_num=<%=row.get(Constants.POST_NUM)%>"><%=row.get(Constants.TITLE)%></a></td>
				<td><%=row.get(Constants.WRITER)%></td>
				<td><%=row.get(Constants.REG_DATE)%></td>
				<td><%=row.get(Constants.CATEGORY)%></td>
				<td><%=row.get(Constants.POST_LIKE)%></td>
				<td><%=row.get(Constants.POST_HIT)%></td>
			<%
				}
			%>


		</table>
	</center>
</body>
</html>
