package data;

import java.util.Date;

public class Post {
	private String title;
	private String content;
	private String category;
	private String post_img;
	private String post_ipt;
	private String post_like;
	private String post_num;
	private String post_hit;
	private String post_like_user;
	private Date date;
	
	public Post(String subject, String content) {
		this.title = subject;
		this.content = content;
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

	public String getPost_ipt() {
		return post_ipt;
	}

	public void setPost_ipt(String post_ipt) {
		this.post_ipt = post_ipt;
	}

	public String getPost_like() {
		return post_like;
	}

	public void setPost_like(String post_like) {
		this.post_like = post_like;
	}

	public String getPost_num() {
		return post_num;
	}

	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}

	public String getPost_hit() {
		return post_hit;
	}

	public void setPost_hit(String post_hit) {
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
