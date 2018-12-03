<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants,data.User"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String redirectUrl = Constants.JSP_SIGNIN_SUCCESS;
	if(session.getAttribute(Constants.CURRENTUSER) != null){
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form name=signIn method=post action=jsp_signIn_success.jsp>
아이디 : <input type=text name=id>
비밀번호 : <input type=password name=pw>
<input type=submit value="로그인">
</form>
<form name = signUp method = post action = jsp_signUp_form.jsp>
<input type = submit value = "회원가입">
</form>
</body>
</html>
<%
	if(request.getAttribute(Constants.REDIRECTCAUSE) != null){
		out.println("<script>alert('" + request.getAttribute(Constants.REDIRECTCAUSE) + "');</script>");
		request.removeAttribute(Constants.REDIRECTCAUSE);
	}
%>
