<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,post.PostClass" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String redirectCause = "";
		String redirectUrl = "";
		
		String writer = request.getParameter("writer");
		boolean b = true; // 성공 여부 확인하기 위해
		String LoginId = "newlhh"; //임시로 아이디 설정함.

		if (request.getParameter("writer") == null) { //작성자 아이디 값이 없는 경우
			writer = "";
			redirectCause = "잘못된 접근입니다.";
			b= false;
		}

		if (writer.equals(LoginId)) { //자기 아이디인 경우
			b = false;
			redirectCause = "본인의 아이디입니다.";
		}

		PostClass Post = new PostClass();
		List<Map> view = new ArrayList<Map>();

		view = Post.like_list(LoginId); //즐겨찾기 목록을 가져옴
		Map row = view.get(0);
		String[] s = row.get("f_list").toString().split(",");

		for (int i = 0; i < s.length; i++) {
			if (s[i].equals(writer)) { //이미 즐겨찾기한 경우
				b = false;
				redirectCause = "이미 즐겨찾기 했습니다.";
			}

		}

		if (b) {
			Post.favorite("newlhh", writer); //즐겨찾기에 추가
			view = Post.like_list(LoginId);
			row = view.get(0);
			s = row.get("f_list").toString().split(",");
			request.setAttribute("f_list", s);
			redirectCause = "즐겨찾기 리스트에 추가되었습니다.";
			redirectUrl = "jsp_viewFavorite.jsp";

		} else {
			redirectUrl = "error.jsp";

		}
		request.setAttribute("redirectCause", redirectCause);
		request.getRequestDispatcher(redirectUrl).forward(request, response);
	%>




</body>
</html>