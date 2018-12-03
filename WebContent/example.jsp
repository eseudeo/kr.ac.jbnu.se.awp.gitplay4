<%@ page language="java" contentType="text/html; charset=EUC-KR" import = "java.io.*,data.FtpClient"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<% 
	String fullName = request.getParameter("file");
	out.println("\\");
	File file = new File(fullName);
	String fileName = getFileName(fullName);
	FtpClient ftp = new FtpClient();
	ftp.upload(file, fileName);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%!
	private String getFileName(String fullName){
		String[] array = fullName.split("\\\\");
		int indexNum = array.length -1;
		return array[indexNum];
	}
%>