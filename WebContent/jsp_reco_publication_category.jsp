<%@ page language="java" contentType="text/html; charset=UTF-8" import="publications.RecommendedPublication,java.util.*,data.PostColumn,data.Constants"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%	

	RecommendedPublication rePublication = new RecommendedPublication();
	String category = request.getParameter(Constants.CATEGORY);
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
		String content = index.get(PostColumn.CONTENT.toString()).toString();
		int length = ((content.length() > 20) ? 15 : content.length());
		out.println("<tr>" + 
					"<td>" + index.get(PostColumn.POST_IMG.toString()).toString() + "</td>" +
					"<td><a href=jsp_reco_publication_category.jsp?post_num=" + index.get(PostColumn.POST_NUM.toString()) + ">" + index.get(PostColumn.TITLE.toString()) + "</a></td>" + 
					"<td>" + index.get(PostColumn.CONTENT.toString()).toString().substring(0, length ) + "</td>");
	}
%>
</body>
</html>