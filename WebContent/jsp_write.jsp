<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.User,post.WriteClass,data.Constants,java.sql.Date"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String redirectCause = "";
	String redirectUrl = Constants.JSP_WRITE_FORM;
	
	
	String month = request.getParameter("selectMonth");
	String day = request.getParameter("selectDay");
	String date;
	String title, category, content, post_img, post_ipt, post_like, post_num, post_hit, post_like_user;
	title = request.getParameter(Constants.TITLE);
	category = "1";
//			request.getParameter(Constants.CATEGORY);
	content = request.getParameter(Constants.CONTENT);
	post_img = "1";
//			request.getParameter(Constants.POST_IMG);
	post_ipt = "1";
//			request.getParameter(Constants.POST_IPT);
	post_like = "1";
//			request.getParameter(Constants.POST_LIKE);
	post_num = "1";
//			request.getParameter(Constants.POST_NUM);
	post_hit = "1";
//			request.getParameter(Constants.POST_HIT);
	post_like_user = "1";
//			request.getParameter(Constants.POST_LIKE_USER);
if(Integer.valueOf(month) < 10) month = "0" + month;
	if(Integer.valueOf(day) < 10) day = "0" + day;
	date = new StringBuffer(request.getParameter("selectYear")).append("-")
	.append(month).append("-")
	.append(day).toString();

		WriteClass Write = new WriteClass();
		Write.write(title,content);
		//Write.write(title, category, content, post_img, post_ipt, post_like, post_num, post_hit, post_like_user);
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
