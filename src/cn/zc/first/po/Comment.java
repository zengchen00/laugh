package cn.zc.first.po;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int id;
	
	private String userComment;
	
	private String articleId;
	
	private String guestIp;
	
	private Date createDate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getArticleId() {
		return articleId;
	}
	public void setArticleId(String articleId) {
		this.articleId = articleId;
	}
	public String getGuestIp() {
		return guestIp;
	}
	public void setGuestIp(String guestIp) {
		this.guestIp = guestIp;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUserComment() {
		return userComment;
	}
	public void setUserComment(String userComment) {
		this.userComment = userComment;
	}
}
