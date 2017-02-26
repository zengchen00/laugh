package cn.zc.first.po;

import java.io.Serializable;
import java.util.Date;

public class ArticleVo implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public ArticleVo(){
	}
	
	public ArticleVo(int id,int state,String userName,Date modifyDate){
		this.id=id;
		this.state=state;
		this.userName=userName;
		this.modifyDate=modifyDate;
	}
	
	private int id;
	private int state;
	private String userName;
	private Date modifyDate;
	private int fromLimit;
	private int endLimit;
	private String orderBy;
	private String orderType;
	private int open;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getFromLimit() {
		return fromLimit;
	}

	public void setFromLimit(int fromLimit) {
		this.fromLimit = fromLimit;
	}

	public int getEndLimit() {
		return endLimit;
	}

	public void setEndLimit(int endLimit) {
		this.endLimit = endLimit;
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

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

}
