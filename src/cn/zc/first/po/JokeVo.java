package cn.zc.first.po;

import java.io.Serializable;

import cn.zc.first.common.Page;

public class JokeVo extends Joke implements Serializable{
	
	private static final long serialVersionUID = -1537497892736335908L;
	
	private Page page;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}
}
