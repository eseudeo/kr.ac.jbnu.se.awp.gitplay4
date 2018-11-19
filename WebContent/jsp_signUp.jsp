<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.User,sign.SignUpClass,data.Constants,java.sql.Date"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<%
	String redirectCause = "";
	String redirectUrl = Constants.JSP_SIGNUP_FORM;
	String id,password,dob,username;
	String month = request.getParameter("selectMonth");
	String day = request.getParameter("selectDay");
	id = request.getParameter(Constants.USERINFO_ID);
	password = request.getParameter(Constants.USERINFO_PASSWORD);
	username = request.getParameter(Constants.USERINFO_USERNAME);
	if(Integer.valueOf(month) < 10) month = "0" + month;
	if(Integer.valueOf(day) < 10) day = "0" + day;
	dob = new StringBuffer(request.getParameter("selectYear")).append("-")
			.append(month).append("-")
			.append(day).toString();
	
	if(checkIsEmpty(id, password, username)) redirectCause = "빈칸을 채워주세요";
	else if(checkHasSpace(id, password, username)) redirectCause = "띄어쓰기는 허용되지 않습니다";
	else if(!(checkId(id))) redirectCause = "아이디는 3자이상 20자 이하로 만들어주세요";
	else if(!(checkPw(password))) redirectCause = "비밀번호는 6자 이상 20자 이하로 만들어주세요";
	else if(!(checkUsername(username))) redirectCause = "이름이 너무 깁니다";
	else {
		SignUpClass signUp = new SignUpClass();
		if(!(signUp.signUp(new User(id, password, Date.valueOf(dob), username)))){
			redirectCause = "아이디가 중복되거나 연결이 좋지 않습니다";
			redirectUrl = Constants.JSP_SIGNUP_FORM;
		}else{
			redirectCause = username + "님 회원가입을 축하드립니다";
			redirectUrl = Constants.JSP_SIGNIN_FORM;
		}
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
