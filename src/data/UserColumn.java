package data;

public enum UserColumn {
	ID,PASSWORD,BIRTHDAY,USERNAME,FAVORITEMEMBERS,EMAIL,USERNUMBER;
	
	@Override
	public String toString() {
		switch(this) {
			case ID :
				return "id";
			case PASSWORD :
				return "pw";
			case BIRTHDAY :
				return "bday";
			case USERNAME :
				return "name";
			case FAVORITEMEMBERS :
				return "f_list";
			case EMAIL :
				return "email";
			case USERNUMBER :
				return "user_num";
			default : 
				return null;
		}
	}
}
