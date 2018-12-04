<%@ page language="java" contentType="text/html; charset=UTF-8" import="publications.RecommendedPublication,java.util.*,data.PostColumn"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	
	RecommendedPublication rePublication = new RecommendedPublication();
	String category = request.getParameter("selectCategory");
	List<Map> publications = rePublication.getPublications(category, 9);
%>
<html>
<head>
<meta charset="UTF-8">
<title><%=category %> 페이지</title>
</head>
<body>
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
</body>
</html>