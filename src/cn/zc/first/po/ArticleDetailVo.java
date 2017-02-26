package cn.zc.first.po;

import java.io.Serializable;

import cn.zc.first.common.Page;

public class ArticleDetailVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public ArticleDetailVo(){
		
	}
	
	private Page page;
	private int id;
	private int articleId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
}
