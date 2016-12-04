var data=function (){	
    this.data = new Object();
    
    this.put = function(key, value) {     
        this.data[key] = value;     
    }; 
    this.get = function(key) {     
        return this.data[key];     
    };     
                 
    this.toJson = function(){     
        return JSON.stringify(this.data);     
    };     
}

var REQUEST_TYPE = "POST";
var CONTENT_TYPE = "application/json";
var POST_TIMEOUT = 30000;
//普通post提交表单;
function ajaxFormSubmitPost(url, form, sucCallBack, errCallBack) {
	$.ajax({
		type : "POST",
		url : url,
		cache : false,
		timeout : 30000,
		data : $("#" + form).serialize(),
		success : sucCallBack,
		error : errCallBack,
		beforeSend:function(){
		},
		complete:function(){
		},
	});
}