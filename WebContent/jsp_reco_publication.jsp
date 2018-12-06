<%@ page language="java" contentType="text/html; charset=UTF-8" import="publications.RecommendedPublication,data.Constants,data.Category,java.util.*,data.PostColumn"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	RecommendedPublication rePublication = new RecommendedPublication();
	int i = 0;
	Category[] categories = Category.values();
	String category;
	if(request.getParameter(Constants.CATEGORY) == null)
		category = categories[0].toString();
	else{
		category = request.getParameter(Constants.CATEGORY).toString();
	}
	List<Map> publications = rePublication.getPublications(category, 3);
%>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name=category method=post action=jsp_reco_publication_category.jsp>
	<input name=<%=Constants.CATEGORY %> type=hidden value=<%=category %> />
<%
		while(i < categories.length){
%>
			<input type = "button" name=<%=categories[i].toString() %>  value=<%=categories[i++].toString() %> onClick="reload(this.value)"/>
<%			
		}
%>
	<input type="submit" value="더보기">
</form></body>
</html>
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
<script>
		function reload(x) {
			var target = x;
			var url = 'jsp_reco_publication.jsp?selected=' + target;
			window.location.href = url;
		}
</script>