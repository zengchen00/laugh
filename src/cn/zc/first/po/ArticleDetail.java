package cn.zc.first.po;

import java.io.Serializable;
import java.util.Date;

public class ArticleDetail implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int id;
	private String description;
	private Article article;
	private String img_url;
	private String img_url_des;
	private Date createDate;
	private Date modifyDate;
	
	public ArticleDetail(){
		
	}
	
	public ArticleDetail(Article article,String decription,String img_url,String img_url_des){
		this.article = article;
		this.description=decription;
		this.img_url=img_url;
		this.img_url_des=img_url_des;
		this.createDate=new Date();
		this.modifyDate=new Date();
	}
	
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
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getImg_url_des() {
		return img_url_des;
	}

	public void setImg_url_des(String img_url_des) {
		this.img_url_des = img_url_des;
	}

	@Override
	public String toString() {
		return "ArticleDetail [id=" + id + ", description=" + description + ", article=" + article + ", img_url="
				+ img_url + ", img_url_des=" + img_url_des + ", createDate=" + createDate + ", modifyDate="
				+ modifyDate + "]";
	}

}
