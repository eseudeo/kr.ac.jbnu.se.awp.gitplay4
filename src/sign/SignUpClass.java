package sign;

import java.util.*;
import data.Constants;
import data.DBTable;
import data.DatabaseAccess;
import data.User;
import data.UserColumn;

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
		values.add(userInfo.getEmail());
		
		condition = new StringBuffer("select ")
				.append(UserColumn.ID).append(" from ")
				.append(DBTable.USER_MANAGEMENT).append(" where ")
				.append(UserColumn.ID).append(" = ?").toString();
		userList = dba.getData(condition, value);
		if(userList != null) {
			if(userList.size() > 0)
			return false;
		}
		condition = new StringBuffer("insert into ")
				.append(DBTable.USER_MANAGEMENT).append("(")
				.append(UserColumn.ID).append(",")
				.append(UserColumn.PASSWORD).append(",")
				.append(UserColumn.BIRTHDAY).append(",")
				.append(UserColumn.USERNAME).append(",")
				.append(UserColumn.EMAIL).append(") values(?,?,?,?,?)").toString();
		if(dba.setData(condition, values)) {
			condition = new StringBuffer("insert into ")
					.append(DBTable.PROFILE).append("(")
					.append(UserColumn.ID).append(") values(?)").toString();
			values.clear();
			values.add(userInfo.getId());
			return dba.setData(condition, values);
		}
		return false;
	}
}
