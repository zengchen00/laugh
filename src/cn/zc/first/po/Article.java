package cn.zc.first.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Article implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String description;
	private String imgUrl;
	private int type;
	private String userName;
	private Date modifyDate;
	private Date createDate;
	private int state;
	private List<ArticleDetail> articleDetails;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public List<ArticleDetail> getArticleDetails() {
		return articleDetails;
	}
	public void setArticleDetails(List<ArticleDetail> articleDetails) {
		this.articleDetails = articleDetails;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
