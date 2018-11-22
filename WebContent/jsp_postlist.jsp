<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants, java.util.*,post.WriteClass"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	List<Map> view = new ArrayList<Map>();
String post_num="12";
WriteClass Write = new WriteClass();
view = Write.view(post_num);
Map row;
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
<table width=580 border=1 cellpadding=2 cellspacing=1 >

<!-- 입력 부분 -->
<% 
row= view.get(0); %>
<a	href="jsp_view_form.jsp?post_num=<%=row.get(Constants.POST_NUM)%>">제목 : <%=row.get(Constants.TITLE)%> / 누르면 들어감</a>


</table>
</center>
</body>
</html> 
