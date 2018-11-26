package data;

import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class User {
	private int user_num;
	private String id;
	private String pw;
	private Date bday;
	private String name;
	private String email;
	private List f_list;

	
	public User() {
		this("" ,"" ,new Date(0,1,1),"","");
	}
	public User(String id, String pw, Date bday, String name, String email) {
		this(id,pw,bday,name,email,new ArrayList());
	}

	public User(String id, String pw, Date bday, String name, String email, List f_list) {
		this(0, id, pw, bday, name, email, f_list);
	}
	public User(int user_num, String id, String pw, Date bday, String name, String email, List f_list) {
		this.user_num = user_num;
		this.id = id;
		this.pw = pw;
		this.bday = bday;
		this.name = name;
		this.f_list = f_list; // 얕은 복사 문제점이 될수 있다. 지금은 놔두자
		this.email = email;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getBday() {
		return bday;
	}
	public void setBday(Date bday) {
		this.bday = bday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List getF_list() {
		return f_list;
	}
	public void setF_list(List f_list) {
		this.f_list = f_list;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
