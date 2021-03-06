<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,post.PostClass"
	pageEncoding="UTF-8"%>
			<jsp:useBean id="currentUser" class="data.User" scope="session" />
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Map row = (Map)request.getAttribute("post");

	
	String post_num = request.getParameter("post_num");
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
				<td width=100 colspan="1" align=center><%=row.get(Constants.WRITERID)%><input
					type="button" value="즐겨찾기"
					onclick="goUrl('jsp_loadFavorite.jsp?writerId=<%=row.get(Constants.WRITERID)%>')"></td>

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
			
				<!-- 세션 아이디와 글 작성자 아이디를 비교해서 수정 삭제 버튼의 유무를 결정 -->
				<%
					String id = currentUser.getId();
					//session.invalidate();
					if (id != null) {
						if (id.equals(row.get(Constants.WRITERID))) {
				%>
				<td colspan=10 align=center><INPUT type=submit value="수정하기"
					onclick="goUrl('jsp_modify_form.jsp?post_num=<%=post_num%>');">
					&nbsp;&nbsp; <INPUT type=button value="삭제하기" onclick="Delete();">
					&nbsp;&nbsp; <INPUT type=button value="되돌아가기"
					onclick='history.back(-1); return false;'></td>
				<%
					} else {
						%>
						<td colspan=10 align=center><INPUT type=button value="되돌아가기"
							onclick='history.back(-1); return false;'></td>
						<%
					}
					}
				%>

			</tr>

			<!-- 입력 부분 끝 -->
		</table>
	</center>
</body>
</html>