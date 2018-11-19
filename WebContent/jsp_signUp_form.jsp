<%@ page language="java" contentType="text/html; charset=UTF-8" import = "data.Constants"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form name=signUp method=post action=jsp_signUp.jsp>
아이디 : <input type=text name=id>
비밀번호 : <input type=password name=pw>
생년월일 : <select name = selectYear>
<%
	out.println(returnOptionsReverse(2017, 1930));
%>
</select>년
<select name = selectMonth>
<%
	out.println(returnOptions(1, 12));
%>
</select>월
<select name = selectDay>
<%
	out.println(returnOptions(1,31));
%>
</select>일
이름 : <input type=text name=name>
<input type=submit value="등록">
</form>
</body>
</html>
<%
	if(request.getAttribute(Constants.REDIRECTCAUSE) != null){
		out.println("<script>alert('" + request.getAttribute(Constants.REDIRECTCAUSE) + "');</script>");
		request.removeAttribute(Constants.REDIRECTCAUSE);
	}
%>
<%!
	private String returnOptions(int startNum, int endNum){
		StringBuffer count = new StringBuffer();
		do count.append("<option value=" + (startNum) + ">" + (startNum) + "</option>\n");		
		while(startNum++ <= endNum);
		return count.toString();
	}
	private String returnOptionsReverse(int endNum, int startNum){
		StringBuffer count = new StringBuffer();
		do count.append("<option value=" + (endNum) + ">" + (endNum) + "</option>\n");		
		while(endNum-- >= startNum);
		return count.toString();
	}
%>
