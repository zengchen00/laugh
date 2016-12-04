package cn.zc.first.common;



public class Page {
	private int numPerPage;//每页多少条数据
	private int totalRecord;//总记录数
	private int totalPage = 1;//总共多少页
	private int currPage = 1;//当前页
	private boolean hasNextPage = false;//是否有下一页
	private boolean hasPrePage = false;//是否有上一页
	private boolean hasNextMore = false;//是否有更多下一页
	private boolean hasPreMore = false;//是否有更多上一页
	private int nextMore;
	private int preMore;
	private int nextPage;
	private int prePage;
	private int[] pageList;
	private String pageListStr;
	private int startPage;
	
	public void init(){
		//初始化 总页数
		if(totalRecord%numPerPage==0){
			totalPage = totalRecord/numPerPage;
		}else{
			totalPage = totalRecord/numPerPage + 1;
		}
		//初始化 上一页，下一页状态
		if(currPage==1){//如果当前页是第一页，没有上一页
			hasPrePage = false;
		}else if(currPage>1){//如果当前页大于第一页，有上一页
			hasPrePage = true;
			prePage = currPage-1;
		}
		if(totalPage>currPage){//如果总页数大于当前页，有下一页
			hasNextPage = true;
			nextPage = currPage+1;
		}else if(totalPage==currPage){//如果总页数等于当前页，没有下一页
			hasNextPage = false;
		}
		if(currPage==1 && totalPage==1){//如果只有一页
			hasPrePage = false;
			hasNextPage = false;
		}
		//初始化页数列表
		if(totalPage <=7){
			pageList = new int[totalPage];
			for (int i = 0; i < totalPage; i++) {
				pageList[i]=i+1;
			}
		}else{
			pageList = new int[7];
			if( currPage > 4){
				if(totalPage-currPage>2){
					for (int i = 0; i < 7; i++) {
						pageList[i] = currPage-3+i;
					}
				}else{
					for (int i = 6; i >= 0; i--) {
						pageList[i] = totalPage-6+i;
					}
				}
			}else{
				for (int i = 0; i < 7; i++) {
					pageList[i]=i+1;
				}
			}
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < pageList.length; i++) {
			if(i==pageList.length-1){
				sb.append(pageList[i]);
			}else{
				sb.append(pageList[i]+",");
			}
		}
		pageListStr = sb.toString();
		//初始化开始位置
		startPage = (currPage-1)*numPerPage;
	}
	
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public boolean isHasNextPage() {
		return hasNextPage;
	}
	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}
	public boolean isHasPrePage() {
		return hasPrePage;
	}
	public void setHasPrePage(boolean hasPrePage) {
		this.hasPrePage = hasPrePage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPrePage() {
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public boolean isHasNextMore() {
		return hasNextMore;
	}

	public void setHasNextMore(boolean hasNextMore) {
		this.hasNextMore = hasNextMore;
	}

	public boolean isHasPreMore() {
		return hasPreMore;
	}

	public void setHasPreMore(boolean hasPreMore) {
		this.hasPreMore = hasPreMore;
	}

	public int getNextMore() {
		return nextMore;
	}

	public void setNextMore(int nextMore) {
		this.nextMore = nextMore;
	}

	public int getPreMore() {
		return preMore;
	}

	public void setPreMore(int preMore) {
		this.preMore = preMore;
	}

	public int[] getPageList() {
		return pageList;
	}

	public void setPageList(int[] pageList) {
		this.pageList = pageList;
	}

	public String getPageListStr() {
		return pageListStr;
	}

	public void setPageListStr(String pageListStr) {
		this.pageListStr = pageListStr;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
}
