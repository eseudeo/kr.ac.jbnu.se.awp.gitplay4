package post;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import data.Constants;
import data.DatabaseAccess;

public class PostClass {
	private DatabaseAccess dba;

	public PostClass() {
		dba = DatabaseAccess.getInstance();
	}

	//게시판 글 등록
	public boolean write(String title, String writer, Date date, String category, String content, String post_img, String post_ipt) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		values.add(title);
		values.add(writer);
		values.add(date);
		values.add(category);
		values.add(content);
		values.add(post_img);
		values.add(post_ipt);




		condition = new StringBuffer("insert into ")
				.append(Constants.DB_TABLE_POST).append("(")
				.append(Constants.TITLE).append(",")
				.append(Constants.WRITER).append(",")
				.append(Constants.DATE).append(",")
				.append(Constants.CATEGORY).append(",")
				.append(Constants.CONTENT).append(",")
				.append(Constants.POST_IMG).append(",")
				.append(Constants.POST_IPT).append(") values(?,?,?,?,?,?,?)").toString();

		dba.setData(condition, values);
		return true;
	}
	
	public boolean modify(String title, String writer, Date date, String category, String content, String post_img, String post_ipt, String post_num) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		values.add(title);
		values.add(writer);
		values.add(date);
		values.add(category);
		values.add(content);
		values.add(post_img);
		values.add(post_ipt);
		values.add(post_num);




		condition = new StringBuffer("update ")
				.append(Constants.DB_TABLE_POST).append(" set ")
				.append(Constants.TITLE).append(" = ").append("?, ")
				.append(Constants.WRITER).append(" = ").append("?, ")
				.append(Constants.DATE).append(" = ").append("?, ")
				.append(Constants.CATEGORY).append(" = ").append("?, ")
				.append(Constants.CONTENT).append(" = ").append("?, ")
				.append(Constants.POST_IMG).append(" = ").append("?, ")
				.append(Constants.POST_IPT).append(" = ").append("?")
				.append(" where ").append(Constants.POST_NUM).append(" = ").append(" ? ").toString();

		dba.setData(condition, values);
		return true;
	}

	//게시판 글 보기
	public List<Map> view(String post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("select * from ")
				.append(Constants.DB_TABLE_POST).append(" where ")
				.append(Constants.POST_NUM).append(" = ?").toString();
		values.add(post_num);
		return dba.getData(condition,values);
	}

	//게시판 글 삭제
	public boolean delete(String post_num) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		values.add(post_num);




		condition = new StringBuffer("delete from ")
				.append(Constants.DB_TABLE_POST).append(" where ")
				.append(Constants.POST_NUM).append(" = ?").toString();

		dba.setData(condition, values);
		return true;
	}

	//게시판 글 목록 -> 글번호 역순
	public List<Map> postCount() {
		List values = new ArrayList();
		String condition = new StringBuffer("select * from ")
				.append(Constants.DB_TABLE_POST).append(" order by ").append(Constants.POST_NUM).append(" DESC").toString();
		return dba.getData(condition,values);
	}

	//date를 불러오는 메소드 - 안쓰임
	public List<Map> getDate(String Post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("select from_unixtime(unix_timestamp(")
				.append(Constants.DATE).append(", '%Y-%m-%d' ) FROM '")
				.append(Constants.DB_TABLE_POST).toString();
		return dba.getData(condition,values);
	}
	
	public boolean favorite(String id, String post_num) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		values.add(id);
		values.add(post_num);




		condition = new StringBuffer("insert into ")
				.append(Constants.DB_TABLE_FOVORLITE).append("(")
				.append(Constants.USERINFO_ID).append(",")
				.append(Constants.POST_NUM).append(") values(?,?)").toString();

		dba.setData(condition, values);
		return true;
	}






}
