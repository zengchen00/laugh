$.validator.setDefaults({
    errorPlacement:function(error, element) {
    },
    onkeyup: false,
    onfocusout:false,
    focusInvalid: false
});

//对Date的扩展，将 Date 转化为指定格式的String   
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
//例子：   
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.format = function(fmt)   
{ //author: meizz   
var o = {   
 "M+" : this.getMonth()+1,                 //月份   
 "d+" : this.getDate(),                    //日   
 "h+" : this.getHours(),                   //小时   
 "m+" : this.getMinutes(),                 //分   
 "s+" : this.getSeconds(),                 //秒   
 "q+" : Math.floor((this.getMonth()+3)/3), //季度   
 "S"  : this.getMilliseconds()             //毫秒   
};   
if(/(y+)/.test(fmt))   
 fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
for(var k in o)   
 if(new RegExp("("+ k +")").test(fmt))   
fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
return fmt;   
}  
 
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

/*去掉左右空格*/
var trim=function(s){ //删除左右两端的空格  
    return s.replace(/(^\s*)|(\s*$)/g, "");  
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
		dataType:"json",
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
				succCallBack();
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