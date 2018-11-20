<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.User,article.WriteClass,data.Constants,java.sql.Date"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
	String redirectCause = "";
	String redirectUrl = Constants.JSP_WRITE_FORM;
	String subject,writer;
	subject = request.getParameter(Constants.SUBJECT);
	writer = request.getParameter(Constants.WRITER);



		WriteClass Write = new WriteClass();
		if(!(Write.write(subject, writer))){
			redirectCause = "아이디가 중복되거나 연결이 좋지 않습니다";
			redirectUrl = Constants.JSP_SIGNUP_FORM;
		}else{
			redirectCause = "님 회원가입을 축하드립니다";
			redirectUrl = Constants.JSP_WRITE_FORM;
		}
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
<%!
	private boolean checkId(String id) {
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
	}
%>
