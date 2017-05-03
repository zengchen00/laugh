<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理台登录</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body style="background: #4D4D4D;">
<div style="position:fixed;left:35%;top:15%;">
	<form id="loginForm">
		<h1 style="color: white;">分享快乐后台管理台登录</h1>
		<table style="margin-left: 60px;margin-top: 80px;">
			<tr>
				<td style="color: white;">
					<label class="fs20">用户名：</label>
				</td>
				<td>
					<input id="username" name="username" class="form-control" placeholder="请输入用户名">
				</td>
				<td>
					<label style="color:#90EE90;margin-left: 2rem;" id="usernameError"></label>
				</td>
			</tr>
			<tr>
				<td style="color: white;">
					<label class="mt20 fs20"">密&nbsp;&nbsp;&nbsp;码：</label>
				</td>
				<td>
					<input id="password" name="password" class="mt20 form-control"  type="password" placeholder="请输入密码">
				</td>
				<td>
					<label class="mt20" style="color:#90EE90;margin-left: 2rem;" id="passwordError"></label>
				</td>
			</tr>
			<tr>
				<td>
				</td>
				<td>
				<input id="doLogin" class="btn btn-success mt20" style="width: 80px;float: right" type="button" value="登录">
				</td>
			</tr>
		</table>
	</form>
</div>


<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#doLogin").click(function(){
		var validator = formValidator("loginForm",function(){},function(value,key){
			$("#"+ key +"Error").text(value);
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
		var retUrl="${pageContext.request.contextPath}/background/index.html";
			//表单验证通过后,触发的提交
// 		ajaxFormSubmitPost(reqUrl,"loginForm",function(data,XMLHttpRequest){
// 			if(data=="0000"){
// 				window.location = retUrl;
// 			}else{
// 				$("#passwordError").text("用户名或者密码错误");
// 			}
			
// 		},function(data){
// 			if(data=="0000"){
// 				window.location = retUrl;
// 			}
// 			$("#passwordError").text("请求后台失败");
// 		});
			
		var data = new jsonData();
		data.put("username",$("#username").val().trim());
		data.put("password",$("#password").val().trim());
		var dataJson = data.toJson();
		myAjax(reqUrl,dataJson,function(data){
			if(data.success){
				window.location = retUrl;
			}else{
				$("#passwordError").text(data.msg);
			}
		},function(){},function(){},true);
	});
	$("#username,#password").focus(function(){
		$("#passwordError").text("");
		$("#usernameError").text("");
	});
});
</script>
</body>
</html>