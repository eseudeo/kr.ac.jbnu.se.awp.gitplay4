<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,post.PostClass"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<Map> view = new ArrayList<Map>();

	String post_num = request.getParameter(Constants.POST_NUM);
	PostClass Post = new PostClass();
	Post.hit(post_num);
	view = Post.view(post_num);
	Map row;
	row = view.get(0);
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
<title>글보기</title>

<script type="text/javascript">
	function goUrl(url) {
		location.href = url;
	}
    function Delete()
    {
        if(confirm("정말 삭제하시겠습니까?") == true)
        {
        	
        	location.href = 'jsp_Delete.jsp?post_num=<%=post_num%>';
		}
	}
</script>
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

<body topmargin=0 leftmargin=0 text=#464646>

	<center>
		<!-- 입력된 값을 다음 페이지로 넘기기 위해 FORM을 만든다. -->
		<table width=580 border=1 cellpadding=2 cellspacing=1>

			<!-- 입력 부분 -->
			<tr align="center">
				<td colspan="9"><img src="img/pofo_banner.jpg"
					class="border border-dark rounded" width="100%" height="100">
				</td>

			</tr>
			<tr>
				<td colspan="9"></td>
			</tr>
			<tr>

				<td width=100 align=left>제 목</td>
				<td align=center colspan="7"><%=row.get(Constants.TITLE)%></td>
				<td><input type="hidden" name="post_num"
					value="<%=row.get(Constants.POST_NUM)%>"></td>

			</tr>
			<tr>
				<td width=100 colspan="1">작성자</td>
				<td width=100 colspan="1" align=center><%=row.get(Constants.WRITER)%><input
					type="button" value="즐겨찾기"
					onclick="goUrl('jsp_fav.jsp?writer=<%=row.get(Constants.WRITER)%>')"></td>

				<td width=100 colspan="1">작성날짜</td>
				<td width=100 colspan="4" align=center><%=row.get(Constants.REG_DATE).toString().substring(0, 10)%></td>
				<td width=100 colspan="1">추천수</td>
				<td width=100 colspan="1" align=center><H4><%=row.get(Constants.POST_LIKE)%></H4>
					<input type="button" value="추천하기"></td>
			</tr>
			<tr>
				<td width=100>날짜</td>
				<td colspan="5" align=center><%=row.get(Constants.DATE)%></td>
				<td width=100 align=center>분 야 : <%=row.get(Constants.CATEGORY)%></td>
				<td width=200 align=center colspan="2">중요도 : <%=row.get(Constants.POST_IPT)%></td>
			<tr>
				<td width=100 align=left>내용</td>
				<td align=left colspan="8" width=200 height=300 align="right"><%=row.get(Constants.CONTENT)%></td>
			</tr>
			<tr>
				<td width=100 align=left>사진</td>
				<td align=left colspan="8"><img
					src="<%=row.get(Constants.POST_IMG)%>"
					class="border border-dark rounded" width="100%" height="100"></td>
			</tr>
			<tr>
				<%
					session.setAttribute("login", "newlhh");
					//session.invalidate();
					if (session.getAttribute("login") != null) {
						if (session.getAttribute("login").equals(row.get(Constants.WRITER))) {
				%>
				<td colspan=10 align=center><INPUT type=submit value="수정하기"
					onclick="goUrl('jsp_modify_form.jsp?post_num=<%=post_num%>');">
					&nbsp;&nbsp; <INPUT type=button value="삭제하기" onclick="Delete();">
					&nbsp;&nbsp; <INPUT type=button value="되돌아가기"
					onclick="goUrl('jsp_postList.jsp')"></td>
				<%
					}
					} else {
				%>
				<td colspan=10 align=center><INPUT type=button value="되돌아가기"
					onclick="goUrl('jsp_postList.jsp')"></td>
				<%
					}
				%>

			</tr>

			<!-- 입력 부분 끝 -->
		</table>
	</center>
</body>
</html>