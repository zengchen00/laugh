package cn.zc.first.po;

import java.io.Serializable;

import cn.zc.first.common.Page;

public class CommentVo extends Comment implements Serializable{
	
	private static final long serialVersionUID = -1537497892736335907L;
	
	private Page page;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}
