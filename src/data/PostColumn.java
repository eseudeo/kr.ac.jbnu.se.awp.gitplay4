package data;

public enum PostColumn {
	TITLE,ID,REG_DATE,DATE,CATEGORY,CONTENT,POST_IMG,POST_IPT,POST_LIKE,POST_NUM,POST_HIT,POST_LIKE_USER;
	
	@Override
	public String toString() {
		switch(this) {
			case TITLE :
				return "title";
			case ID :
				return "id";
			case REG_DATE :
				return "reg_date";
			case DATE :
				return "date";
			case CATEGORY :
				return "category";
			case CONTENT :
				return "content";
			case POST_IMG :
				return "post_img";
			case POST_IPT :
				return "post_ipt";
			case POST_LIKE :
				return "post_like";
			case POST_NUM :
				return "post_num";
			case POST_HIT :
				return "post_hit";
			case POST_LIKE_USER :
				return "post_like_user";
			default : 
				return null;
		}
	}
}
