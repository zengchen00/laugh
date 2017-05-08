<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
var fullNumber = function(second){
	var secondStr = ""+second;
	if(secondStr.length == 1){
		return "0"+secondStr;
	}
	return secondStr;
}
	function setDateTime(){
			var date=new Date();
			var day=date.getDay();
			var week;
			switch(day){
			case 0:week="星期日";break;
			case 1:week="星期一";break;
			case 2:week="星期二";break;
			case 3:week="星期三";break;
			case 4:week="星期四";break;
			case 5:week="星期五";break;
			case 6:week="星期六";break;
			}
			var today=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日  "+week+" "+date.getHours()+":"+fullNumber(date.getMinutes())+":"+fullNumber(date.getSeconds());
			document.getElementById("today").innerHTML=today;
		}
		window.setInterval("setDateTime()", 1000);
</script>
</head>
<button style="display:none;" class="btn btn-md" id="alertButton"></button><!-- 提示信息要用到 -->
<input id="serverPath" ajaxUrl="${pageContext.request.contextPath}" type="hidden">
	<div class="row">
 		 <div class="col-md-12">
 		 	<img alt="梨花网" src="${pageContext.request.contextPath}/images/logo.png">
 		 	<span style="position: relative;left: 30px;top: 20px;">欢迎管理员：<font color="red">${currentUser.name}</font>
 		 	&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: black;" href="javascript:logout()">[&nbsp;安全退出&nbsp;]
 		 	<font style="float: right;position: relative;top: 20px;color: black;" id="today" class="currentDateTime"></font></span>
 		 </div>
	</div>
<script type="text/javascript">
var logout = function(){
	window.location = "${pageContext.request.contextPath}/background/logout.html";
}
</script>