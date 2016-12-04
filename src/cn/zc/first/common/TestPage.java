package cn.zc.first.common;

public class TestPage {

	public static void main(String[] args) {
		Page page = new Page();
		page.setNumPerPage(1);
		
		page.setCurrPage(1);
		page.setTotalRecord(8);
		
		page.init(); 
		System.out.println("当前页："+ page.getCurrPage());
		System.out.print("上一页是："+ page.getPrePage()+ ",是否有上一页："+ page.isHasPrePage()+" ");
		
//		System.out.println("页码列表：");
		for (int i = 0; i < page.getPageList().length; i++) {
			if(page.getPageList()[i] == page.getCurrPage()){
				System.out.print("*"+page.getPageList()[i]+"* , ");
			}else{
				System.out.print(page.getPageList()[i]+" , ");
			}
		}
		System.out.println(page.isHasNextPage()+",下一页是："+ page.getNextPage());
		System.out.println(page.getPageListStr());
		
	}

}
