<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>글쓰기</title>
</head>
<style>
<!--
td { font-size : 9pt; }
A:link { font : 9pt; color : black; text-decoration : none; font-family : 굴림; font-size : 9pt; }
A:visited { text-decoration : none; color : black; font-size : 9pt; }
A:hover { text-decoration : underline; color : black; font-size : 9pt; }

-->
    </style>
<body topmargin=0 leftmargin=0 text=#464646>

<center>

<img src="jbnu_logo.jpg" class="border border-dark rounded" width="100%" height="100">

<BR>

<hr>
<font><B>글 쓰 기</B></font>
<!-- 입력된 값을 다음 페이지로 넘기기 위해 FORM을 만든다. -->
<form action="jsp_write.jsp" method=post enctype="multipart/form-data">

<table width=580 border=1 cellpadding=2 cellspacing=1 bgcolor=#999999>

<!-- 입력 부분 -->
<tr>

<td width=100 align=left >제 목</td>
<td align=center colspan="5">
<INPUT type=text name=title size="70%">
</td>
</tr>
<tr>
<td width=100>날짜</td>
<td>
<select name = selectYear>
<%
	out.println(returnOptionsReverse(2018, 1929));
%>
</select>년
<select name = selectMonth>
<%
	out.println(returnOptions(1, 11));
%>
</select>월
<select name = selectDay>
<%
	out.println(returnOptions(1,30));
%>
</select>일
</td>

<td width=100 align=center >분 야</td>
<td>
<select>
  <option>정치</option>
  <option>경제</option>
  <option>사회</option>
  <option>교육</option>
</select>
</td>
<td width=100 align=center >중요도</td>
<td align=center >
<select>
  <option>1</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
  
</select>
</td>
<tr>
<td width=100 align=left >내용</td>
<td align=left colspan="5" >
<TEXTAREA name=comment cols=75 rows=15></TEXTAREA>
</td>
</tr>
<tr>
<td width=100 align=left >사진 첨부</td>
<td align=left colspan="5" >
<input type="file" id="customFile"></td>
</tr>
<tr>
<td colspan=10 align=center>
<INPUT type=submit value="글 쓰기">
&nbsp;&nbsp;
<INPUT type=reset value="다시 쓰기">
&nbsp;&nbsp;
<INPUT type=button value="되돌아가기" onclick="history.back(-1)">
</td>
</tr>

<!-- 입력 부분 끝 -->
</table>
</form>
</center>
</body>
</html> 
<%!
	private String returnOptions(int startNum, int endNum){
		StringBuffer count = new StringBuffer();
		do count.append("<option value=" + (startNum) + ">" + (startNum) + "</option>\n");		
		while(startNum++ <= endNum);
		return count.toString();
	}
	private String returnOptionsReverse(int endNum, int startNum){
		StringBuffer count = new StringBuffer();
		do count.append("<option value=" + (endNum) + ">" + (endNum) + "</option>\n");		
		while(endNum-- >= startNum);
		return count.toString();
	}
%>
