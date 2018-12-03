package post;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import data.Constants;
import data.DatabaseAccess;
import data.DBTable;
import data.PostColumn;

public class PostClass {
	private DatabaseAccess dba;

	public PostClass() {
		dba = DatabaseAccess.getInstance();
	}

	//게시판 글 등록
	public boolean write(String title, String writer, Date date, String category, String content, String post_img, String post_ipt) {
		List values = new ArrayList();
		String condition = new StringBuffer("insert into ")
				.append(DBTable.POST).append("(")
				.append(PostColumn.TITLE).append(",")
				.append(PostColumn.ID).append(",")
				.append(PostColumn.DATE).append(",")
				.append(PostColumn.CATEGORY).append(",")
				.append(PostColumn.CONTENT).append(",")
				.append(PostColumn.POST_IMG).append(",")
				.append(PostColumn.POST_IPT).append(") values(?,?,?,?,?,?,?)").toString();
		
		values.add(title);
		values.add(writer);
		values.add(date);
		values.add(category);
		values.add(content);
		values.add(post_img);
		values.add(post_ipt);
		
		return dba.setData(condition, values);
	}
	
	public boolean modify(String title, String writer, Date date, String category, String content, String post_img, String post_ipt, String post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("update ")
				.append(DBTable.POST).append(" set ")
				.append(PostColumn.TITLE).append(" = ").append("?, ")
				.append(PostColumn.ID).append(" = ").append("?, ")
				.append(PostColumn.DATE).append(" = ").append("?, ")
				.append(PostColumn.CATEGORY).append(" = ").append("?, ")
				.append(PostColumn.CONTENT).append(" = ").append("?, ")
				.append(PostColumn.POST_IMG).append(" = ").append("?, ")
				.append(PostColumn.POST_IPT).append(" = ").append("?")
				.append(" where ").append(PostColumn.POST_NUM).append(" = ").append(" ? ").toString();
		
		values.add(title);
		values.add(writer);
		values.add(date);
		values.add(category);
		values.add(content);
		values.add(post_img);
		values.add(post_ipt);
		values.add(post_num);

		return dba.setData(condition, values);
	}

	//게시판 글 보기
	public List<Map> view(String post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" where ")
				.append(PostColumn.POST_NUM).append(" = ?").toString();
		values.add(post_num);
		return dba.getData(condition,values);
	}

	//게시판 글 삭제
	public boolean delete(String post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("delete from ")
				.append(DBTable.POST).append(" where ")
				.append(PostColumn.POST_NUM).append(" = ?").toString();
		values.add(post_num);
		return dba.setData(condition, values);
	}

	//게시판 글 목록 -> 글번호 역순
	public List<Map> postCount() {
		String condition = new StringBuffer("select * from ")
				.append(DBTable.POST).append(" order by ").append(PostColumn.POST_NUM).append(" DESC").toString();
		return dba.getData(condition);
	}

	//date를 불러오는 메소드 - 안쓰임
	public List<Map> getDate(String Post_num) {
		String condition = new StringBuffer("select from_unixtime(unix_timestamp(")
				.append(Constants.DATE).append(", '%Y-%m-%d' ) FROM '")
				.append(DBTable.POST).toString();
		return dba.getData(condition);
	}
}	
//	public boolean favorite(String id, String post_num) {
//		List values = new ArrayList();
//		String condition = new StringBuffer("insert into ")
//				.append(Constants.DB_TABLE_FOVORLITE).append("(")
//				.append(Constants.USERINFO_ID).append(",")
//				.append(Constants.POST_NUM).append(") values(?,?)").toString();
//		values.add(id);
//		values.add(post_num);
//		return dba.setData(condition, values);
//	}