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
	
	public boolean write(String subject, String writer) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		
		values.add(subject);
		values.add(writer);
		
		condition = new StringBuffer("insert into ")
				.append(Constants.DB_TABLE_ARTICLE).append("(")
				.append(Constants.SUBJECT).append(",")
				.append(Constants.WRITER).append(") values(?,?)").toString();

			dba.setData(condition, values);
			return true;
	}
}
