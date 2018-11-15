package data;

import java.util.ArrayList;
import java.util.List;

public class User {
	private int user_num;
	private String id;
	private String pw;
	private String bday;
	private String name;
	private List f_list;
	
	public User() {
		this("" ,"" ,"" ,"");
	}
	public User(String id, String pw, String bday, String name) {
		this(id,pw,bday,name,new ArrayList());
	}
	public User(String id, String pw, String bday, String name, List f_list) {
		this(0, id, pw, bday, name, f_list);
	}
	public User(int user_num, String id, String pw, String bday, String name, List f_list) {
		this.user_num = user_num;
		this.id = id;
		this.pw = pw;
		this.bday = bday;
		this.name = name;
		this.f_list = f_list; // 얕은 복사 문제점이 될수 있다. 지금은 놔두자
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
	public String getBday() {
		return bday;
	}
	public void setBday(String bday) {
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
}
