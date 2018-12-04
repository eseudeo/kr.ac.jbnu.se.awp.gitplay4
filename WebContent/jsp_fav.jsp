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
		String writer = request.getParameter("writer");
		boolean b = true;
		String LoginId = "newlhh"; //임시로 아이디 설정함.
		if (request.getParameter("writer") == null) { //작성자 아이디 값이 없는 경우
			writer = "";
		}

		if (writer.equals("")) { //자기 아이디인 경우
			b = false;
		}

		PostClass Post = new PostClass();
		List<Map> view = new ArrayList<Map>();

		view = Post.like_list(LoginId); //즐겨찾기 목록을 가져옴
		Map row = view.get(0);
		String[] s = row.get("f_list").toString().split(",");

		for (int i = 0; i < s.length; i++) {
			if (s[i].equals(writer)) { //이미 즐겨찾기한 경우
				b = false;

			}

		}

		if (b) {
			Post.favorite("newlhh", writer); //즐겨찾기에 추가
			out.println("즐겨찾기 리스트에 추가되었습니다.<p>");
			view = Post.like_list("newlhh");
			row = view.get(0);
			s = row.get("f_list").toString().split(",");
			for (int i = 0; i < s.length; i++) {
				out.println(
						i + 1 + ". ID : <a href=\"jsp_view_form.jsp?post_num=" + s[i] + "\">" + s[i] + "</a><p>");
			}
		} else {
			out.println("이미 즐겨찾기했거나 잘못된 접근입니다.");
			out.println("<form method=\"get\" action=\"jsp_postList.jsp\">\r\n" + "<button>뒤로가기</button>\r\n"
					+ "</form>");
		}
	%>




</body>
</html>