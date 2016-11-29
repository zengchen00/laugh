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
}
