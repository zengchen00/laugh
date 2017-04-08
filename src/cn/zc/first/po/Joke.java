package cn.zc.first.po;

import java.io.Serializable;
import java.util.Date;

public class Joke implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String author;
	private String title;
	private String content;
	private Date modifyDate;
	private Date createDate;
	private String modifyDateStr;
	private String createDateStr;
	private int state;
	private int open;
	private int periods;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
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
	public String getModifyDateStr() {
		return modifyDateStr;
	}
	public void setModifyDateStr(String modifyDateStr) {
		this.modifyDateStr = modifyDateStr;
	}
	public String getCreateDateStr() {
		return createDateStr;
	}
	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getOpen() {
		return open;
	}
	public void setOpen(int open) {
		this.open = open;
	}
	public int getPeriods() {
		return periods;
	}
	public void setPeriods(int periods) {
		this.periods = periods;
	}
	
	@Override
	public String toString() {
		return "Joke [id=" + id + ", author=" + author + ", title=" + title + ", content=" + content + ", modifyDate="
				+ modifyDate + ", createDate=" + createDate + ", modifyDateStr=" + modifyDateStr + ", createDateStr="
				+ createDateStr + ", state=" + state + ", open=" + open + ", periods=" + periods + "]";
	}
}
