<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="data.Constants, java.util.*,post.PostClass"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<Map> view = new ArrayList<Map>();

	int post_num = Integer.parseInt(request.getParameter(Constants.POST_NUM));
	PostClass Write = new PostClass();
	view = Write.view(post_num);
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
<title>글 수정하기</title>
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
		<form action="jsp_modify.jsp?post_num=<%=post_num %>" method=post
			enctype="multipart/form-data">

			<table width=580 border=0 cellpadding=2 cellspacing=1>


				<!-- 입력 부분 -->
				<tr>
					<img src="img/pofo_banner.jpg" class="border border-dark rounded"
						width="100%" height="100">
				</tr>
				<hr>
				<tr align="center">
					<H3>글 수정하기</H3>
				</tr>
				<tr>
					<td width=100 align=left>제 목</td>
					<td align=center colspan="5"><INPUT type=text name="title"
						size="70%" value="<%=row.get(Constants.TITLE)%>"></td>
					<td><input type="hidden" name="post_num"
						value="<%=row.get(Constants.POST_NUM)%>"></td>
				</tr>
				<tr>
					<td width=100>날짜</td>
					<td><select name="selectYear">
							<%
								out.println(returnOptionsReverse(2018, 1929,
										Integer.valueOf(row.get(Constants.DATE).toString().substring(0, 4))));
							%>
					</select>년 <select name="selectMonth">
							<%
								out.println(returnOptions(1, 12, Integer.valueOf(row.get(Constants.DATE).toString().substring(5, 7))));
							%>
					</select>월 <select name="selectDay">
							<%
								out.println(returnOptions(1, 31, Integer.valueOf(row.get(Constants.DATE).toString().substring(8, 10))));
							%>
					</select>일</td>

					<td width=100 align=center>분 야</td>
					<td><select name="category">
							<option value="정치"
								<%if (row.get(Constants.CATEGORY).equals("politics")) {%>
								selected="selected" <%}%>>정치</option>
							<option value="경제"
								<%if (row.get(Constants.CATEGORY).equals("economy")) {%>
								selected="selected" <%}%>>경제</option>
							<option value="사회"
								<%if (row.get(Constants.CATEGORY).equals("society")) {%>
								selected="selected" <%}%>>사회</option>
							<option value="교육"
								<%if (row.get(Constants.CATEGORY).equals("education")) {%>
								selected="selected" <%}%>>교육</option>
					</select></td>
					<td width=100 align=center>중요도</td>
					<td align=center><select name="post_ipt">
							<option value="1"
								<%if (row.get(Constants.POST_IPT).equals(1)) {%>
								selected="selected" <%}%>>1</option>
							<option value="2"
								<%if (row.get(Constants.POST_IPT).equals(2)) {%>
								selected="selected" <%}%>>2</option>
							<option value="3"
								<%if (row.get(Constants.POST_IPT).equals(3)) {%>
								selected="selected" <%}%>>3</option>
							<option value="4"
								<%if (row.get(Constants.POST_IPT).equals(4)) {%>
								selected="selected" <%}%>>4</option>
							<option value="5"
								<%if (row.get(Constants.POST_IPT).equals(5)) {%>
								selected="selected" <%}%>>5</option>

					</select></td>
				<tr>
					<td width=100 align=left>내용</td>
					<td align=left colspan="5"><TEXTAREA name="content" cols=75
							rows=15><%=row.get(Constants.CONTENT)%></TEXTAREA></td>
				</tr>


				<tr>
					<td width=100 align=left>사진 첨부</td>
					<td align=left colspan="5"><input type="file" name="post_img"
						value="<%=row.get(Constants.POST_IMG)%>"></td>
				</tr>
				<tr>
					<td colspan=10 align=center><INPUT type=submit value="수정하기">
						&nbsp;&nbsp; <INPUT type=reset value="다시 쓰기"> &nbsp;&nbsp;
						<INPUT type=button value="되돌아가기" onclick="goUrl('jsp_postList.jsp')">
					</td>
				</tr>

				<!-- 입력 부분 끝 -->
			</table>
		</form>
	</center>
</body>
</html>

<%!private String returnOptions(int startNum, int endNum, int selectNum) {
		StringBuffer count = new StringBuffer();
		for (int i = startNum; startNum <= endNum; startNum++) {
			if (startNum == selectNum) {
				count.append("<option value=" + (startNum) + " selected=\"selected\" >" + (startNum) + "</option>\n");

			}
			count.append("<option value=" + (startNum) + ">" + (startNum) + "</option>\n");
		}
		return count.toString();
	}

	private String returnOptionsReverse(int endNum, int startNum, int selectNum) {
		StringBuffer count = new StringBuffer();
		do {
			if (endNum == selectNum) {
				count.append("<option value=" + (endNum) + " selected=\"selected\" >" + (endNum) + "</option>\n");
				continue;

			}
			count.append("<option value=" + (endNum) + ">" + (endNum) + "</option>\n");
		}

		while (endNum-- >= startNum);
		return count.toString();
	}%>
