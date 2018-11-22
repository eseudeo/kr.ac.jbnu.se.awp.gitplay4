<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants, java.util.*,post.WriteClass"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<Map> view = new ArrayList<Map>();

String post_num="8";
WriteClass Write = new WriteClass();
view = Write.view(post_num);
Map row;
row= view.get(0);
%>
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
    <script type="text/javascript">
    function Delete()
    {
        if(confirm("정말 삭제하시겠습니까?") == true)
        {
        	
        	location.href = 'jsp_Delete.jsp?post_num=<%=post_num%>';
        }
    }
    </script>
<body topmargin=0 leftmargin=0 text=#464646>

<center>

<img src="jbnu_logo.jpg" class="border border-dark rounded" width="100%" height="100">

<BR>
<div class="pos-f-t">
  <div class="collapse" id="navbarToggleExternalContent">
    <div class="bg-dark p-4">
      <h5 class="text-white h4">Collapsed content</h5>
      <span class="text-muted">Toggleable via the navbar brand.</span>	
    </div>
  </div>
  <nav class="navbar navbar-dark bg-dark">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </nav>
</div>
<hr>
<!-- 입력된 값을 다음 페이지로 넘기기 위해 FORM을 만든다. -->
<table width=580 border=1 cellpadding=2 cellspacing=1 >

<!-- 입력 부분 -->
<tr align="center"><H3>글 쓰기</H3></tr>
<tr>
<td width=100 align=left >제 목</td>
<td align=center colspan="4"><%= row.get(Constants.TITLE) %>
</td>
<td width=100 colspan="2">작성날짜</td>
<td width=100 colspan="2"><%= row.get(Constants.REG_DATE) %></td>
</tr>
<tr>
<td width=100>날짜</td>
<td>
<select name ="selectYear">
<%
	out.println(returnOptionsReverse(2018, 1929, 2016));
%>
</select>년
<select name ="selectMonth">
<%
	out.println(returnOptions(1, 12, 12));
%>
</select>월
<select name ="selectDay">
<%
	out.println(returnOptions(1,31, 28));
%>
</select>일
</td>
<td width=100 align=center >분 야 : <%= row.get(Constants.CATEGORY) %></td>
<td>
<select name="category">
  <option>정치</option>
  <option>경제</option>
  <option>사회</option>
  <option>교육</option>
</select>
</td>
<td width=200 align=center colspan="3" >중요도 : <%= row.get(Constants.POST_IPT) %></td>
<td align=center >
<select name="post_ipt">
  <option>1</option>
  <option>2</option>
  <option>3</option>
  <option>4</option>
  <option>5</option>
  
</select>
</td>
<tr>
<td width=100 align=left >내용</td>
<td align=left colspan="7" width=200 height=300 align="right"><%= row.get(Constants.CONTENT) %></td>
</tr>
<tr>
<td width=100 align=left >사진 첨부</td>
<td align=left colspan="7" >
<input type="file" id="customFile" name="post_img"></td>
</tr>
<tr>
<td colspan=10 align=center>
<INPUT type=submit value="수정하기">
&nbsp;&nbsp;
<INPUT type=button value="삭제하기" onclick="Delete();">
&nbsp;&nbsp;
<INPUT type=button value="되돌아가기" onclick="history.back(-1)">
</td>
</tr>

<!-- 입력 부분 끝 -->
</table>
</center>
</body>
</html> 

<%!private String returnOptions(int startNum, int endNum, int selectNum){
		StringBuffer count = new StringBuffer();
		for(int i=startNum;startNum<=endNum;startNum++) {
			if(startNum == selectNum) {
				count.append("<option value=" + (startNum) + " selected=\"selected\" >" + (startNum) + "</option>\n");

			}
			count.append("<option value=" + (startNum) + ">" + (startNum) + "</option>\n");
		}
		return count.toString();
	}
	private String returnOptionsReverse(int endNum, int startNum, int selectNum){
		StringBuffer count = new StringBuffer();
		for(int i=endNum;endNum >= startNum;endNum--) {
			if(endNum == selectNum) {
				count.append("<option value=" + (endNum) + " selected=\"selected\" >" + (endNum) + "</option>\n");

			}
			count.append("<option value=" + (endNum) + ">" + (endNum) + "</option>\n");
		}
		return count.toString();
	}%>