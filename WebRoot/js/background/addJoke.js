$(function(){
	var um = UM.getEditor('myEditor');
	
	$("#saveContent").click(function(){
		var content = um.getContent();
		var title = $("#jokeTitle").val();
		var period = $("#period").val();
		if(isEmpty(title)){
			alert("标题没填");
			return;
		}
		if(isEmpty(period)){
			alert("期数没填");
			return;
		}
		if(isEmpty(content)){
			alert("没内容");
			return;
		}
		var url = $("#saveContent").attr("ajaxUrl");
		var data = new jsonData();
		data.put("period",period);
		data.put("title",title);
		data.put("content",content);
		var dataJson = data.toJson();
		myAjax(url,dataJson,function(data){
			if(data.success){
				alert(data.msg);
			}else{
				alert(data.msg);
			}
		},function(){},function(){},true);
	});
})