<%@ page language="java" contentType="text/html; charset=UTF-8" import = "sign.SignInClass,data.Constants,data.User"
    pageEncoding="UTF-8"%>
<jsp:useBean id="currentUser" class="data.User" scope="page" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<%
	String redirectCause = "";
	String redirectUrl = Constants.JSP_SIGNIN_FORM;
	String id,password;
	SignInClass signIn = new SignInClass();
	id = request.getParameter(Constants.USERINFO_ID);
	password = request.getParameter(Constants.USERINFO_PASSWORD);
	if(isEmpty(id,password)) {
		redirectCause = "빈칸을 작성하세요";
	}else if(!signIn.signIn(id,password)){
		redirectCause = "아이디나 비밀번호를 확인해주세요";
	}
%>
<html>
<head>
<meta charset="UTF-8">
<%
	if(signIn.getCurrentUser() != null) {
		session.setAttribute(Constants.CURRENTUSER, signIn.getCurrentUser());
		currentUser = (User)session.getAttribute(Constants.CURRENTUSER);
		out.println( currentUser.getId() + "님 안녕하세요");
	}else {
		request.setAttribute(Constants.REDIRECTCAUSE, redirectCause);
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	}
%>	
<title>로그인</title>
</head>
<body>
<form name=signOut method=post action=jsp_signOut.jsp>
<input type="submit" value="로그아웃" onclick="alert('로그아웃했습니다');" />
</form>
</body>
</html>
<%!
	private boolean isEmpty(String id, String password) {
		if((id != "") || (password != "")) return false;
		return true;
	}
%>