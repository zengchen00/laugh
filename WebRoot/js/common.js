$.validator.setDefaults({
    errorPlacement:function(error, element) {
    },
    onkeyup: false,
    onfocusout:false,
    focusInvalid: false
});

 
var jsonData=function(){
	
	this.data = new Object();
	
	this.put = function(key, value) {     
	    this.data[key] = value;     
	};
	
	this.getData = function() {     
	    return this.data;     
	};
	/* 重写toString*/    
    this.toJson = function(){     
        return JSON.stringify(this.data);     
    };
}

/*判断空*/
var isEmpty = function (o) {
	
	if (typeof(o) == "undefined" || o == null) {
		return true;
	}
	
	if (o.length <= 0) {
		return true;
	}
	if (typeof(o) == 'string' && (o == '' || trim(o) == '')) {
		return true;
	}
	return false;
};

function formValidator(formId,submitCallback,showErrorCallback){
	var valid = $("#" + formId).validate({
		focusCleanup:true,
		focusInvalid:false,
		// suc方法
		success : function(label) {
		},
		ignore:".ignore",
		// 替换位置
		// 成功校验回调函数
		submitHandler : submitCallback,
		invalidHandler: function(form, validator) {
	        $.each(validator.invalid,function(key,value){
	        	showErrorCallback(value,key);
	            return false;
	        });
	    }
	});
	return valid;
}

//post表单提交
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

/*整体封装ajax*/
var myAjax=function(url,dataJson,succCallBack,errorCallBack,preCallBack,bizErrorCallBack,isAsync){
	$.ajax({
		type : "POST",  
		contentType : "application/json",  
		url : url,
		timeout:30000,  
		data :dataJson,
		async: isAsync,
		dataType : 'json',
		xhrFields: {
            withCredentials: true
		},
    	crossDomain: true,
		beforeSend: function(){
			if (!isEmpty(preCallBack)){
				return preCallBack();
			} else {
				return true;
			}
		},
		success : function(data) {
			succCallBack(data);
		},
		error:function(XMLHttpRequest){
			
			if(XMLHttpRequest.readyState == 4){
				succCallBack(data);
			}
			if (!isEmpty(errorCallBack)){
				errorCallBack();
			}
		},
		complete: function(XMLHttpRequest,status){
			if(status=='timeout'){
				alert("请求超时，请稍后再试!");
			}
		}
	});
};