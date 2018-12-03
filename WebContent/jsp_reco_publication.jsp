<%@ page language="java" contentType="text/html; charset=UTF-8" import="publications.RecommendedPublication,data.Constants,data.Category,java.util.*,data.PostColumn"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	RecommendedPublication rePublication = new RecommendedPublication();
	Category[] categories = Category.values();
	String category;
	if(request.getParameter("selectCategory") == null)
		category = categories[0].toString();
	else
		category = request.getParameter("selectCategory");
	List<Map> publications = rePublication.getPublications(category, 3);
%>
<html>
<head>
<script type="text/javascript">
	function reload() {
		location.reload();
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name=category method=post action=jsp_reco_publication_category.jsp>
<select name = selectCategory>
<%
		StringBuffer count = new StringBuffer();
		int i = 0;
		do count.append("<option value=" + (categories[i].toString()) + ">" + (categories[i].toString()) + "</option>\n");		
		while(i++ <= categories.length);
		out.println(count);
%>
</select>
<input type="button" value="선택" onClick="reload()">
<% 	
	int indexNum = 0;
	while(indexNum < publications.size()){
		Map index = publications.get(indexNum++);
		out.println("<tr>" + 
					"<td>" + index.get(PostColumn.POST_IMG).toString() + "</td>" +
					"<td><a href=jsp_reco_publication_category.jsp?post_num=" + index.get(PostColumn.POST_NUM) + ">" + index.get(PostColumn.TITLE) + "</a></td>" + 
					"<td>" + index.get(PostColumn.CONTENT).toString().substring(0, 15) + "</td>");
	}
%>
<input type="submit" value="더보기">
</form></body>
</html>