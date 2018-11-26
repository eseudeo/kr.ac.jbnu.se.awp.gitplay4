package data;

public enum DBTable {
	USER_MANAGEMENT,PROFILE,POST,USER_PAGE;
	@Override
	public String toString() {
		switch(this) {
			case USER_MANAGEMENT : 
				return "User_Management";
			case PROFILE :
				return "Profile";
			case POST : 
				return "Post";
			case USER_PAGE :
				return "User_Page";
			default :
				return null;
		}
	}
}
