<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="post.PostClass,data.Constants,java.sql.Date"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.File, com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.util.Enumeration"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");

%>

<%
	String redirectCause = "";
	String redirectUrl = Constants.JSP_WRITE_FORM;
	
	String writer = "newlhh";
	
	String uploadPath=request.getRealPath("/upload");
	
	int size = 10*1024*1024;
	String post_img="";
	String origfilename="";
	
	MultipartRequest multi=new MultipartRequest(request,
			uploadPath,
			size, 
			"UTF-8",
new DefaultFileRenamePolicy());

	
	Enumeration files=multi.getFileNames();
	
	String file1 =(String)files.nextElement();
	post_img=multi.getFilesystemName(file1);
	origfilename= multi.getOriginalFileName(file1);
	
	
	String month = multi.getParameter("selectMonth");
	String day = multi.getParameter("selectDay");
	String date;
	String title, category, content, post_ipt;
	title = multi.getParameter(Constants.TITLE);
	category = multi.getParameter(Constants.CATEGORY);
	content = multi.getParameter(Constants.CONTENT);


	//if(!fileName.endsWith(".jpg")) {
	//	File file = new File(directory + fileRealName);
	//	file.delete();
	//	out.write("업로드가 불가능한 확장자입니다.");
	//}else {
	//	new 
	//}
	

	
	post_ipt = multi.getParameter(Constants.POST_IPT);
	
if(Integer.valueOf(month) < 10) month = "0" + month;
	if(Integer.valueOf(day) < 10) day = "0" + day;
	date = new StringBuffer(multi.getParameter("selectYear")).append("-")
	.append(month).append("-")
	.append(day).toString();

		PostClass Write = new PostClass();
		//Write.write(title,content);
		Write.write(title, writer, Date.valueOf(date), category, content, uploadPath+"/"+post_img, post_ipt);
		
		
		//if(!(Write.write(title, category, content, post_img, post_ipt, post_like, post_num, post_hit, post_like_user))){
		//	redirectCause = "아이디가 중복되거나 연결이 좋지 않습니다";
		//	redirectUrl = Constants.JSP_SIGNUP_FORM;
		//}else{
		//	redirectCause = "님 회원가입을 축하드립니다";
		//	redirectUrl = Constants.JSP_WRITE_FORM;
		//}
	request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
	request.getRequestDispatcher(redirectUrl).forward(request, response);
%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<H2>회원가입 성공</H2>
</body>
</html>
<%!private boolean checkId(String id) {
		if(id.length() < 3 || id.length() >= 20) return false;
		else return true;
	}
	private boolean checkPw(String password)	{
		if((password.length() < 6) || (password.length() >= 20)) return false;
		else return true;
	}
	private boolean checkUsername(String username) {
		if(username.length() > 21) return false;
		else return true;
	}
	private boolean checkHasSpace(String id, String pw, String name){
		if((id.contains(" ")) || (pw.contains(" ")) || (name.contains(" "))) return true;
		else return false;
	}
	private boolean checkIsEmpty(String id, String pw, String name) {
		if((id.equals("")) || (pw.equals("")) || (name.equals("")))	return true;
		else return false;
	}%>
