package sign;

import java.util.*;
import java.sql.Date;
import data.Constants;
import data.DatabaseAccess;
import data.User;

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
				.append(Constants.DB_TABLE_USER_MANAGEMENT).append(" where ")
				.append(Constants.USERINFO_ID).append(" = ?").toString();
		values.add(id);
		userList = dba.getData(condition,values);
		for(int count = 0; count < userList.size(); count++) {
			Map row = userList.get(count);
			if(password.equals(row.get(Constants.USERINFO_PASSWORD))){
				List favoriteMembers = new ArrayList();
				if(row.get(Constants.USERINFO_FAVORIx`x`TEMEMBERS) != null) {
					favoriteMembers = splitComma(row.get(Constants.USERINFO_FAVORITEMEMBERS).toString());
				}
				User tmp = new User(row.get(Constants.USERINFO_ID).toString(), row.get(Constants.USERINFO_PASSWORD).toString(), 
						(Date)row.get(Constants.USERINFO_BIRTHDAY), row.get(Constants.USERINFO_USERNAME).toString(), favoriteMembers);
				currentUser = tmp;
				return true;
			}
		}
		return false;
	}
	public User getCurrentUser() {
		return currentUser;
	}
	private boolean isEmpty(String id, String password) {
		if((id != "") || (password != "")) return false;
		return true;
	}
	private List splitComma(String original) {
		String[] members = original.split(",");
		return Arrays.asList(members);
	}
}
