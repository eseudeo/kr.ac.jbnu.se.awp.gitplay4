package data;

import java.util.Date;

public class Post {


	private String title;
	private String content;
	private String category;
	private String post_img;
	private int post_ipt;
	private String post_like;
	private int post_num;
	private int post_hit;
	private String post_like_user;
	private Date date;
	
	public Post(String title, String content, String category, String post_img, int post_ipt, String post_like,
			int post_num, int post_hit, String post_like_user, Date date) {
		super();
		this.title = title;
		this.content = content;
		this.category = category;
		this.post_img = post_img;
		this.post_ipt = post_ipt;
		this.post_like = post_like;
		this.post_num = post_num;
		this.post_hit = post_hit;
		this.post_like_user = post_like_user;
		this.date = date;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getPost_img() {
		return post_img;
	}

	public void setPost_img(String post_img) {
		this.post_img = post_img;
	}

	public int getPost_ipt() {
		return post_ipt;
	}

	public void setPost_ipt(int post_ipt) {
		this.post_ipt = post_ipt;
	}

	public String getPost_like() {
		return post_like;
	}

	public void setPost_like(String post_like) {
		this.post_like = post_like;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public int getPost_hit() {
		return post_hit;
	}

	public void setPost_hit(int post_hit) {
		this.post_hit = post_hit;
	}

	public String getPost_like_user() {
		return post_like_user;
	}

	public void setPost_like_user(String post_like_user) {
		this.post_like_user = post_like_user;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
}
