var pageNation = function(page){
	var pageStr = '';
	if(page.hasPrePage){
		pageStr = pageStr + '<li onclick="getOthers(1)"><a>&laquo;</a></li>';
	}else{
		pageStr = pageStr + '<li class="disabled"><a>&laquo;</a></li>';
	}
	var ab = page.pageListStr;
	var c = ab.split(",");
	for(var i = 0;i< c.length;i++){
		var a =c[i];
		if(a == page.currPage){
			pageStr = pageStr + '<li onclick="getOthers('+ a +')" class="active"><a>'+ a +'</a></li>';
		}else{
			pageStr = pageStr + '<li onclick="getOthers('+ a +')"><a>'+ a +'</a></li>';
		}
	}
	if(page.hasNextPage){
		pageStr = pageStr + '<li onclick="getOthers('+ page.totalPage +')"><a>&raquo;</a></li>';
	}else{
		pageStr = pageStr + '<li class="disabled"><a>&raquo;</a></li>';
	}
	$("#pageUl").html(pageStr);
}


function getOthers(pageNum){
	var url = $("#serverPath").attr("ajaxUrl")+"/foreground/queryDetailPage.html";
	var data = new jsonData();
	data.put("pageNum",pageNum);
	data.put("articleId",$("#articleId").val());
	var dataJson = data.toJson();
	myAjax(url,dataJson,function(data){
		var articleDetails = data.articleDetails;
		var innerHtml = "";
		var startIndex = (data.page.currPage - 1)*data.page.numPerPage + 1;
		for (var i = 0; i < articleDetails.length; i++) {
			var item = articleDetails[i];
	        if(i == 0){
	        	innerHtml = innerHtml + '<dt>';
	        }else{
	        	innerHtml = innerHtml + '<dt style="margin-top: 100px;">';
	        }
			innerHtml = innerHtml + '<h4>'+(i+1)+'.'+item.description+'</h4></dt>';
			innerHtml = innerHtml + '<dd style="margin-top: 20px;text-align: center;">';
			innerHtml = innerHtml + '<img style="max-height: 400px;max-width: 21rem;min-height: 250px;min-width: 18rem;" src="http://localhost:8090//'+item.img_url+'" >';
			innerHtml = innerHtml + '</dd>';
		}
		$("#dlMian").html(innerHtml);
		$('html, body').animate({scrollTop:0}, '100');
		pageNation(data.page);
	},function(){},function(){},true);
}

$(function(){
	if(screen.width < 769){
		$("#dlMian img").each(function(){
		    $(this).prop("style","max-height: 400px;max-width: 21rem;min-height: 250px;min-width: 18rem;");
		  });
		
	}
})