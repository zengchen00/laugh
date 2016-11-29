<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理台首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:include page="head.jsp"/>
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
			    <a href="#">在线gif文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">已删除gif文章列表</a>
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
			<h1>努力不一定成功！</h1>
		</div>
	</div>
</div>
</body>
</html>