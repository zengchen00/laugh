<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理台首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:include page="../head.jsp"/>
	<div class="row" style="margin-top: 4rem;">
		<div class="col-md-3">
			<ul class="list-group">
			  <li class="list-group-item">
			    <strong>gif管理</strong>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			   <a href="${pageContext.request.contextPath}/background/addGif.html">新增gif文章</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="${pageContext.request.contextPath}/background/readyGif.html">待上线gif文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="${pageContext.request.contextPath}/background/onlineGif.html" style="color:#68228B;">在线gif文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="${pageContext.request.contextPath}/background/deleteGif.html">已删除gif文章列表</a>
			  </li>
		<!-- *****搞笑图片*****			   -->
			  <li class="list-group-item">
			    <strong>搞笑图片管理</strong>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			   <a href="#">新增搞笑图片文章</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">待上线搞笑图片文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">在线搞笑图片文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">已删除搞笑图片文章列表</a>
			  </li>
	    <!-- *****段子*****			   -->
			  <li class="list-group-item">
			    <strong>段子管理</strong>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			   <a href="#">新增段子</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">待上线段子文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">在线段子文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">已删除段子文章列表</a>
			  </li>
			</ul>
		</div>
		<div class="col-md-9">
			<table id="table" class="table table-striped table-condensed">
			  <tr>
			  	<td class="eleCenter" style="width:10%">
					 序号
				</td>
				<td style="width:20%" class="eleCenter">
				期数
				</td>
				<td style="width:40%" class="eleCenter">
				标题
				</td>
				<td style="width:30%" class="eleCenter">
				操作
				</td>
			  </tr>
			  <c:forEach items="${articles}" var="item" varStatus="status">
			  <tr>
				  	<td class="eleCenter" style="width:10%">
				  	${status.index +1}
					</td>
					<td style="width:20%" class="eleCenter">
					${item.indexNum}
					</td>
					<td style="width:40%" class="eleCenter">
					${item.description}
					</td>
					<td style="width:30%" class="eleCenter">
					<button type="button" class="btn btn-primary" onclick="preview(${item.id})">预览</button>
					<button id="online" data-toggle="modal" data-target="#myModal" type="button" class="btn btn-primary" onclick="downTip(${item.id})">下线</button>
					<button type="button" class="btn btn-primary" onclick="deleteTip(${item.id})">删除</button>
					</td>
			  </tr>
			  </c:forEach>
			</table>
		</div>
	</div>
</div>

<div id="confirmDiv" style="display:none">
	<div class="mask" ></div>
			<div class="pop alert alert-dismissable" style="width: 260px;background-color:#F7F9F7;margin-top: 2.5rem;">
				 <button id="closeTip" type="button" class="close">×</button>
				<span id="tipContent" class="fs20" style="text-align:center;width: 100%;display:block;margin-top: 2rem;">确定删除吗？</span><br>
				<button id="confirm" style="margin-left: 15%;" type="button" class="btn">确定</button>
		     	<button id="cancle" type="button" class="btn" style="float: right;margin-right: 15%;">取消</button>
			</div>
</div>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

function preview(articleId){
	console.log("预览："+articleId);
}

function downTip(articleId){
	var url = "${pageContext.request.contextPath}/background/downArticle.html";
	$("#tipContent").text("确定下线吗？");
	$("#confirmDiv").show();
	$("#confirm").unbind("click").click(function(){
		var data = new jsonData();
		data.put("articleId",articleId);
		var dataJson = data.toJson();
		myAjax(url,dataJson,function(data){
			if(data=="0000"){
				window.location = "${pageContext.request.contextPath}/background/onlineGif.html";
			}else{
				$("#confirmDiv").hide();
				alert("下线出错，请联系曾总");
			}
		},function(){},function(){},true);
	});
}

function deleteTip(articleId){
	var url = "${pageContext.request.contextPath}/background/deleteArticle.html";
	$("#tipContent").text("确定删除吗？");
	$("#confirmDiv").show();
	$("#confirm").unbind("click").click(function(){
		var data = new jsonData();
		data.put("articleId",articleId);
		var dataJson = data.toJson();
		myAjax(url,dataJson,function(data){
			if(data=="0000"){
				window.location = "${pageContext.request.contextPath}/background/onlineGif.html";
			}else{
				$("#confirmDiv").hide();
				alert("删除出错，请联系曾总");
			}
		},function(){},function(){},true);
	});
}

$(document).ready(function(e) {
	$("#closeTip,#cancle").click(function(){
		$("#confirmDiv").hide();
	});
});
</script>
</body>
</html>