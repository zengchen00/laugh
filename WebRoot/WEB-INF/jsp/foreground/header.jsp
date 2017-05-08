<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <input id="serverPath" ajaxUrl="${pageContext.request.contextPath}" type="hidden">
		<nav class="navbar navbar-default navbar-fixed-top">
		<div class="navbar-header">
			<a style="text-decoration:none;" href="${pageContext.request.contextPath}/foreground/index.html">
		  　  <img alt="梨花网" style="height:50px;" src="${pageContext.request.contextPath}/images/logo.png">
		  </a>
		  　</div>
		  <div class="container">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="#"></a>
		    </div>
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li id="index"><a href="${pageContext.request.contextPath}/foreground/index.html">首页</a></li>
		        <li id="gifIndex"><a href="${pageContext.request.contextPath}/foreground/gifIndex.html?pageNum=1">搞笑gif图</a></li>
		        <li id="jokeIndex"><a href="${pageContext.request.contextPath}/foreground/jokeIndex.html?pageNum=1">极品笑话</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li id="aboutUs"><a href="${pageContext.request.contextPath}/foreground/aboutUs.html">关于我们</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<div style="height:10rem;"></div>
	<script type="text/javascript">
	var cur = ${cur};
	if("1"==cur){
		$("#index").addClass("active");
	}else if("2"==cur){
		$("#gifIndex").addClass("active");
	}else if("3"==cur){
		$("#jokeIndex").addClass("active");
	}else if("4"==cur){
		$("#aboutUs").addClass("active");
	}
	</script>
		
