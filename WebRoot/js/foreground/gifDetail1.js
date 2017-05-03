

var pageNation = function(page){
	var pageStr = '';
	if(page.hasPrePage){
		pageStr = pageStr + '<a href="javascript:void(0);" onclick="getAjax('+page.prePage+')">上一页</a>'
	}
	var ab = page.pageListStr;
	var c = ab.split(",");
	for(var i = 0;i< c.length;i++){
		var a =c[i];
		if(a == page.currPage){
			pageStr = pageStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')" class="on">'+a+'</a>';
		}else{
			pageStr = pageStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')">'+a+'</a>';
		}
	}
	if(page.hasNextPage){
		pageStr = pageStr + '<a href="javascript:void(0);" onclick="getAjax('+page.nextPage+')">下一页</a>';
	}
	$("#pageDiv").html(pageStr);
}


function getAjax(pageNum){
	var url = $("#pageDiv").attr("ajaxUrl");
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
			innerHtml = innerHtml + '<div style="margin-top: 50px;"><dl>';
			innerHtml = innerHtml + '<dt>'+(startIndex + i)+'.'+item.description+'</dt>';
			innerHtml = innerHtml + '<dd style="margin-top: 10px;">';
			innerHtml = innerHtml + '<img style="max-height: 400px;max-width: 400px;min-height: 250px;min-width: 300px;" src="http://118.89.143.115:8090//'+item.img_url+'" >';
			innerHtml = innerHtml + '</dd></dl></div>';
		}
		$("#listbox").html(innerHtml);
		$('html, body').animate({scrollTop:0}, '100');
		pageNation(data.page);
	},function(){},function(){},true);
}

var commentPageNation = function(page){
	var pageStr = '';
	if(page.hasPrePage){
		pageStr = pageStr + '<a href="javascript:void(0);" onclick="getCommentAjax('+page.prePage+')">上一页</a>'
	}
	var ab = page.pageListStr;
	var c = ab.split(",");
	for(var i = 0;i< c.length;i++){
		var a =c[i];
		if(a == page.currPage){
			pageStr = pageStr + '<a href="javascript:void(0);" onclick="getCommentAjax('+a+')" class="on">'+a+'</a>';
		}else{
			pageStr = pageStr + '<a href="javascript:void(0);" onclick="getCommentAjax('+a+')">'+a+'</a>';
		}
	}
	if(page.hasNextPage){
		pageStr = pageStr + '<a href="javascript:void(0);" onclick="getCommentAjax('+page.nextPage+')">下一页</a>';
	}
	$("#commentPageDiv").html(pageStr);
}


function getCommentAjax(pageNum){
	var url = $("#commentPageDiv").attr("ajaxUrl");
	var data = new jsonData();
	data.put("pageNum",pageNum);
	data.put("articleId",$("#articleId").val());
	var dataJson = data.toJson();
	myAjax(url,dataJson,function(data){
		var comments = data.comments;
		var innerHtml = "";
		var startIndex = (data.page.currPage - 1)*data.page.numPerPage + 1;
		for (var i = 0; i < comments.length; i++) {
			var comment = comments[i];
			var date = new Date();
			var cdate = comment.createDate;
			date.setTime(cdate.time)
			innerHtml = innerHtml + '<div class="comment">';
			innerHtml = innerHtml + '<font>'+comment.guestIp+'：</font>'+comment.userComment+'&nbsp;&nbsp;&nbsp;&nbsp;'+date.format("yyyy-MM-dd hh:mm:ss")+'&nbsp;';
			innerHtml = innerHtml + '</div>';
		}
		$("#comentList").html(innerHtml);
		commentPageNation(data.page);
	},function(){},function(){},true);
}


$(function(){
	$("#saveComment").click(function(){
		var validator = formValidator("commentForm",function(){},function(value,key){
			$("#"+ key +"Error").text(value);
		});
		$("#content").rules("remove");
		$("#content").rules("add", {  
			required:true,
			messages : {
				required :"请输入评论内容",
			}
		});
		if(!validator.form()){
	    	return false;
		}
		var reqUrl="commentSave.html";
		//表单验证通过后,触发的提交
		ajaxFormSubmitPost(reqUrl,"commentForm",function(data,XMLHttpRequest){
			if(data[0].success){
				var html = "";
				var comments = data[0].comments;
				for (var int = 0; int < comments.length; int++) {
					var comment = comments[int];
					var date = new Date();
					var cdate = comment.createDate;
					date.setTime(cdate.time)
					html = html + '<div class="comment">';
					html = html + '<font>'+comment.guestIp+'：</font>'+comment.userComment+'&nbsp;&nbsp;&nbsp;&nbsp;'+date.format("yyyy-MM-dd hh:mm:ss")+'&nbsp;';
					html = html + '</div>';
				}
				$("#comentList").html(html);
				$("#content").val("");
			}
		},function(){
			console.log("shit");
		});
	});
});