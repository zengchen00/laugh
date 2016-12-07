<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="row">
			<div class="col-lg-12">
				<img alt="" src="${pageContext.request.contextPath}/images/logo_back.png">
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<nav class="navbar navbar-default" role="navigation">
					  <div class="container-fluid">
					    <div class="navbar-header cur">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					      <a id="indexA" style="margin-left: 0.3rem;" class="navbar-brand fs25" href="${pageContext.request.contextPath}/foreground/index.html">首页</a>
					    </div>
					
					    <div class="collapse navbar-collapse"  style="" id="bs-example-navbar-collapse-1">
					      <ul class="nav navbar-nav">
					        <li class="navli"><a id="gifA" style="margin-left: 5px;" class="navbar-brand fs25" href="${pageContext.request.contextPath}/foreground/gif.html">搞笑动态图</a></li>
					        <li class="navli"><a id="laughA" style="margin-left: 5px;" class="navbar-brand fs25" href="#" target="_blank">笑话</a></li>
					      </ul>
					      
					      <ul class="nav navbar-nav navbar-right">
					        <li><a id="aboutA" class="navbar-brand fs25" href="#">关于我们</a></li>
					      </ul>
					    </div>
					  </div>
					  <hr class="dhr"/>
				</nav>
			</div>
		</div>
	<script type="text/javascript">
	var cur = ${cur};
	if("1"==cur){
		$("#indexA").css("color","#000310");
	}else if("2"==cur){
		$("#gifA").css("color","#000310");
	}else if("3"==cur){
		$("#laughA").css("color","#000310");
	}else if("4"==cur){
		$("#aboutA").css("color","#000310");
	}
	console.log(cur);
	</script>
		
