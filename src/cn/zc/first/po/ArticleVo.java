package cn.zc.first.po;

import java.io.Serializable;

import cn.zc.first.common.Page;

public class ArticleVo extends Article implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private Page page;
	
	private String orderBy;
	
	private String orderType;
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
}
