package post;

import java.util.*;
import data.Constants;
import data.DatabaseAccess;
import data.User;

public class WriteClass {
	private DatabaseAccess dba;
	
	public WriteClass() {
		dba = DatabaseAccess.getInstance();
	}
	
	public boolean write(String title, String date, String category, String content, String post_img, String post_ipt, String post_like, String post_num, String post_hit, String post_like_user) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		values.add(title);
		values.add(date);
		values.add(category);
		values.add(content);
		values.add(post_ipt);
		values.add(post_like);
		values.add(post_num);
		values.add(post_hit);
		values.add(post_like_user);

		

		
		condition = new StringBuffer("insert into ")
				.append(Constants.DB_TABLE_POST).append("(")
				.append(Constants.TITLE).append(",")
				.append(Constants.DATE).append(",")
				.append(Constants.CATEGORY).append(",")
				.append(Constants.CONTENT).append(",")
				.append(Constants.POST_IPT).append(",")
				.append(Constants.POST_LIKE).append(",")
				.append(Constants.POST_NUM).append(",")
				.append(Constants.POST_HIT).append(",")
				.append(Constants.POST_LIKE_USER).append(") values(?,?,?,?,?,?,?,?,?)").toString();

			dba.setData(condition, values);
			return true;
	}
	
	public List<Map> view(String post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("select * from ")
				.append(Constants.DB_TABLE_POST).append(" where ")
				.append(Constants.POST_NUM).append(" = ?").toString();
		values.add(post_num);
		return dba.getData(condition,values);
	}
	
	public List<Map> getDate(String Post_num) {
		List values = new ArrayList();
		String condition = new StringBuffer("select from_unixtime(unix_timestamp(")
				.append(Constants.DATE).append(", '%Y-%m-%d' ) FROM '")
				.append(Constants.DB_TABLE_POST).toString();
		return dba.getData(condition,values);
	}
	
	
}
