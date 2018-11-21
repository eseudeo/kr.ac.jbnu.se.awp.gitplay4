package article;

import java.util.*;
import data.Constants;
import data.DatabaseAccess;
import data.User;

public class WriteClass {
	private DatabaseAccess dba;
	
	public WriteClass() {
		dba = DatabaseAccess.getInstance();
	}
	
	public boolean write(String title, String category, String content, String post_img, String post_ipt, String post_like,
							String post_num, String post_hit, String post_like_user) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		
		values.add(title);
		values.add(category);
		values.add(content);
		values.add(post_img);
		values.add(post_ipt);
		values.add(post_like);
		values.add(post_num);
		values.add(post_hit);
		values.add(post_like_user);
		
		condition = new StringBuffer("insert into ")
				.append(Constants.DB_TABLE_ARTICLE).append("(")
				.append(Constants.TITLE).append(",")
				.append(Constants.CATEGORY).append(",")
				.append(Constants.CONTENT).append(",")
				.append(Constants.POST_IMG).append(",")
				.append(Constants.POST_IPT).append(",")
				.append(Constants.POST_LIKE).append(",")
				.append(Constants.POST_NUM).append(",")
				.append(Constants.POST_HIT).append(",")
				.append(Constants.POST_LIKE_USER).append(") values(?,?,?,?,?,?,?,?,?)").toString();

			dba.setData(condition, values);
			return true;
	}
}
