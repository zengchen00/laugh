<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>快乐站点</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style type="text/css">
.vcenter {
position:absolute;
left:48%;
top:48%;
translateX(-50%);
translateY(-50%);
color:white;
font-size: 30px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="row">
  <div class="col-xs-0 col-md-1"></div>
  <div class="col-xs-12 col-md-8" style="padding: 0px 30px;">
	  <div class="panel panel-info" >
	    <div class="panel-body">
	    <input type="hidden" name="articleId" id="articleId" value="${articleId}"/>
		     <div class="panel panel-info" style="border: 0px;">
				<div class="panel-body">
				<dl id="dlMian">
					<dt>
                   	<h4>1.asdfadfsafasfasfdsadfasdf</h4> 
                    </dt>
                	<dd style="margin-top: 20px;text-align: center;">
                		<a id="a_9"  style="cursor: pointer;" href="javascript:void(0);" onclick="getGif(9)">
		                    <img id="img_9" style="max-height: 400px;max-width: 21rem;min-height: 250px;min-width: 18rem;" src="http://localhost:8090//006dzHMWgw1evyeb7ohu2g304605wx6s.jpg">
		                    <span id="span_9" class="vcenter">play</span>
	                    </a>
                	</dd>
            	</dl>
				‍‍‍‍</div>
			</div>
  		</div>

	   
	</div>
	
	

</div>
  <div class="col-xs-12 col-md-3">
	 
  </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
$(function(){
	$("#a_1").click(function(){
		getGif(9);
	});
	
})

var getGif = function(id){
	var url = $("#serverPath").attr("ajaxUrl")+"/foreground/getGif.html";
	var data = new jsonData();
	data.put("id",id);
	var dataJson = data.toJson();
	myAjax(url,dataJson,function(data){
		$("#img_"+id+"").prop("src","http://localhost:8090//"+data.url);
		$("#span_"+id+"").html("");
		$("#a_"+id+"").removeAttr("onclick");
	},function(){},function(){},true);
}

</script>
</body>
</html>