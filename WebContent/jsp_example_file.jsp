<%@ page language="java" contentType="text/html; charset=UTF-8" import = "java.io.File,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*"
    pageEncoding="UTF-8"%>
<%
	
	String dir = application.getRealPath("");
	dir += "Upload";
	out.println("경로:"+dir +"<br>");

	int max = 10 * 1024 * 1024;
	request.setCharacterEncoding("utf-8");
	try{
	MultipartRequest m = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy()); 
	String name = m.getParameter("file");
	out.println("이름:"+name+"<br>");

	String fileName = request.getParameter("file");
	out.println(fileName);
	}catch(Exception e){
		System.out.println(e);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
