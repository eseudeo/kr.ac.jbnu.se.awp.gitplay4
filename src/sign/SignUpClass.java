package sign;

import java.util.*;
import data.Constants;
import data.DatabaseAccess;
import data.User;

public class SignUpClass {
	private DatabaseAccess dba;
	
	public SignUpClass() {
		dba = DatabaseAccess.getInstance();
	}
	
	public boolean signUp(User userInfo) {
		List value = new ArrayList();
		List values = new ArrayList();
		List userList = new ArrayList();
		String condition = "";
		String result = "";
		Map now;
		
		 value.add(userInfo.getId());
		
		values.add(userInfo.getId());
		values.add(userInfo.getPw());
		values.add(userInfo.getBday());
		values.add(userInfo.getName());
		
		condition = new StringBuffer("select ")
				.append(Constants.USERINFO_ID).append(" from ")
				.append(Constants.DB_TABLE_USER_MANAGEMENT).append(" where ")
				.append(Constants.USERINFO_ID).append(" = ?").toString();
		userList = dba.getData(condition, value);
		if(userList != null) {
			if(userList.size() > 0)
			return false;
		}
		condition = new StringBuffer("insert into ")
				.append(Constants.DB_TABLE_USER_MANAGEMENT).append("(")
				.append(Constants.USERINFO_ID).append(",")
				.append(Constants.USERINFO_PASSWORD).append(",")
				.append(Constants.USERINFO_BIRTHDAY).append(",")
				.append(Constants.USERINFO_USERNAME).append(") values(?,?,?,?)").toString();
		if(dba.setData(condition, values)) {
			condition = new StringBuffer("insert into ")
					.append(Constants.DB_TABLE_USER_PROFILE).append("(")
					.append(Constants.USERINFO_ID).append(") values(?)").toString();
			values.clear();
			values.add(userInfo.getId());
			dba.setData(condition, values);
			return true;
		}
		return false;
	}
}
