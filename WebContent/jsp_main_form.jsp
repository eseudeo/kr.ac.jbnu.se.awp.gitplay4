<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
</head>
<body>
   <h1>POFO</h1>
   
   <form name=login>
      <fieldset style="width: 10%">
         <input type="button" value="로그인" onclick="openPage('jsp_signIn_form.jsp')">
      </fieldset>
   </form>
   
   <script type="text/javascript">
      function openPage(pageURL) {
         window.location.href = pageURL;
      }
   </script>
   
   <form name=search>
   <fieldset>
      <select name="category">
         <option value="total">전체</option>
         <option value="title">제목</option>
         <option value="date">날짜</option>
         <option value="id">작성자</option>
      </select>
      
      <input type="text" placeholder="검색어를 입력해주세요"> 
      <input type="submit" value="검색"> 
      <input type="button" value="상세검색" onclick="openPage('jsp_search_detail_form.jsp')">
   </fieldset>   
   </form>
</body>

</html>