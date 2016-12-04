
	var pageDiv = $("#pageDiv");
	var htmlStr = "";
	if(${page.hasPrePage}){
		htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+${page.prePage}+')">上一页</a>'
	}
	var ab = $("#shit").val();
	var c = ab.split(",");
	for(var i = 0;i< c.length;i++){
		var a =c[i];
		if(a == ${page.currPage}){
			htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')" class="on">'+a+'</a>';
		}else{
			htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')">'+a+'</a>';
		}
		
	}
	if(${page.hasNextPage}){
		htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+${page.nextPage}+')">下一页</a>'
	}
	pageDiv.html(htmlStr);