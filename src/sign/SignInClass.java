package sign;

import java.util.*;
import java.sql.Date;
import data.Constants;
import data.DBTable;
import data.DatabaseAccess;
import data.User;
import data.UserColumn;

public class SignInClass {
	private DatabaseAccess dba;
	private User currentUser;
	
	public SignInClass() {
		dba = DatabaseAccess.getInstance();
	}
	public boolean signIn(String id, String password) {
		List<Map> userList = new ArrayList<Map>();
		List values = new ArrayList();
		String condition = new StringBuffer("select * from ")
				.append(DBTable.USER_MANAGEMENT).append(" where ")
				.append(UserColumn.ID).append(" = ?").toString();
		String s = UserColumn.ID.toString();
		values.add(id);
		if((userList = dba.getData(condition,values)) == null) {
			return false;
		}else {
			for(int count = 0; count < userList.size(); count++) {
				Map row = userList.get(count);
				if(password.equals(row.get(UserColumn.PASSWORD.toString()))){
					List favoriteMembers = new ArrayList();
					if(row.get(UserColumn.FAVORITEMEMBERS) != null) {
						favoriteMembers = splitComma(row.get(UserColumn.FAVORITEMEMBERS).toString());
					}
					User tmp = new User(Integer.parseInt(row.get(UserColumn.USERNUMBER.toString()).toString()),row.get(UserColumn.ID.toString()).toString(), row.get(UserColumn.PASSWORD.toString()).toString(), 
							(Date)row.get(UserColumn.BIRTHDAY.toString()), row.get(UserColumn.USERNAME.toString()).toString(), row.get(UserColumn.EMAIL.toString()).toString(),favoriteMembers);
					currentUser = tmp;
					return true;
				}
			}
			return false;
		}
	}
	public User getCurrentUser() {
		return currentUser;
	}
	private List splitComma(String original) {
		String[] members = original.split(",");
		return Arrays.asList(members);
	}
}
