package cn.zc.first.po;

import java.io.Serializable;

public class ArticleType implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	public ArticleType (int id, String typeName) {
		this.id=id;
		this.typeName=typeName;
	}
	
	private int id;
	
	private String typeName;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
