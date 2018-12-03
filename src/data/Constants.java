package data;
public class Constants {
	public static String JDBC_DRIVER  = "com.mysql.jdbc.Driver";
	public static String DB_NAME = "pofo";
	public static String DB_URL = "jdbc:mysql://localhost:3306/" + DB_NAME + "?serverTimezone=UTC";
	public static String DB_USER = "root";
	public static String DB_PASSWORD = "1234";
	public static String DB_TABLE_USER_MANAGEMENT = "user_management";
	public static String DB_TABLE_USER_PROFILE = "profile";	
	
	//게시판 관련 CONSTANTS
	public static String DB_TABLE_POST = "post";	
	public static String TITLE = "title";	
	public static String WRITER = "writer";
	public static String REG_DATE = "reg_date";	
	public static String DATE = "date";	
	public static String CATEGORY = "category";	
	public static String CONTENT = "content";
	public static String POST_IMG = "post_img";	
	public static String POST_IPT = "post_ipt";	
	public static String POST_LIKE = "post_like";	
	public static String POST_NUM = "post_num";	
	public static String POST_HIT = "post_hit";	
	public static String POST_LIKE_USER = "post_like_user";	
	
	//즐겨찾기 관련 CONSTANTS
	public static String DB_TABLE_FOVORLITE = "favorite";
	
	public static String USERINTO_USERNUMBER = "user_num";
	public static String USERINFO_ID = "id";
	public static String USERINFO_PASSWORD = "pw";
	public static String USERINFO_BIRTHDAY = "bday";
	public static String USERINFO_USERNAME = "name";
	public static String USERINFO_FAVORITEMEMBERS = "f_list";
	public static String CURRENTUSER = "currentUser";
	public static String JSP_MAINPAGE = "jsp_signIn_form.jsp";
	public static String JSP_SIGNIN_FORM = "jsp_signIn_form.jsp";
	public static String JSP_SIGNUP_FORM = "jsp_signUp_form.jsp";
	public static String JSP_WRITE_FORM = "jsp_write_form.jsp";
	public static String REDIRECTCAUSE = "redirectCause";
}
