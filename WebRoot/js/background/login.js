$(function(){
	$("#doLogin").click(function(){
		var validator = zcFormValidator("loginForm",function(){},function(value,key){
			alert(key+" : " + value);
		});
		$("#username").rules("remove");
		$("#password").rules("remove");
		$("#username").rules("add", {  
			required:true,
			messages : {
				required :"请输入登录名",
			}
		});
		$("#password").rules("add", {  
			required:true,
			messages : {
				required :"请输入登录密码",
			}
		});
		if(!validator.form()){
	    	return false;
		}
		var appName="${pageContext.request.contextPath}";
		var reqUrl="${pageContext.request.contextPath}/background/doLogin.html";
		var retUrl="${pageContext.request.contextPath}/background/index.jsp";
			//表单验证通过后,触发的提交
		ajaxFormSubmitPost(reqUrl,"loginForm",function(data,XMLHttpRequest){
			if(data=="0000"){
				window.location = retUrl;
			}else{
				alert("0001");
			}
			
		},function(){
			//ajax没调通
		});
//		formValidator("loginForm",function(){
//			var reqUrl="${pageContext.request.contextPath}/background/doLogin.html";
//			var retUrl="${pageContext.request.contextPath}/background/index.jsp";
//				//表单验证通过后,触发的提交
//			ajaxFormSubmitPost(reqUrl,"loginForm",function(data,XMLHttpRequest){
//				if(data=="0000"){
//					window.location = retUrl;
//				}else{
//					alert("0001");
//				}
//				
//			},function(){
//				//ajax没调通
//			});
//		});
//	});
})