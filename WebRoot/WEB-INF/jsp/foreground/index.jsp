<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>快乐站点</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zlight.menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.zlight.menu.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script>
		$(document).ready(function(){
			$('#zlight-nav').zlightMenu();
		});
</script>
</head>
<body class="body">
<div class="container" id="main">
		<div class="row">
			<div class="col-lg-12">
				<img alt="" src="${pageContext.request.contextPath}/images/logo_back.png">
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<nav class="navbar navbar-default" role="navigation">
					  <div class="container-fluid">
					    <div class="navbar-header">
					      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					      </button>
					      <a style="margin-left: 0.3rem;" class="navbar-brand" href="#">首页</a>
					    </div>
					
					    <div class="collapse navbar-collapse" style="background-color: #2FAF4A;border: solid 1px #238A25;border-radius:10px;" id="bs-example-navbar-collapse-1">
					      <ul class="nav navbar-nav">
					      	
					        <li class="navli"><a style="margin-left: 5px;" class="navbar-brand" href="#">搞笑动态图</a></li>
					        <li class="navli"><a style="margin-left: 5px;" class="navbar-brand" href="#">笑话</a></li>
					      </ul>
					      
					      <ul class="nav navbar-nav navbar-right">
					        <li><a class="navbar-brand" href="#">关于我们</a></li>
					      </ul>
					    </div>
					  </div>
				</nav>
			</div>
		</div>
		<div class="row">
		<div class="row clearfix">
						<div class="col-md-1 col-sm-0 col-xs-0">
						</div>
						<div class="col-md-8 col-sm-12 col-xs-12">
						<div style="margin-top: 1rem;border: 1px solid #238A25;">
								<div class="mk fs20">
									<strong>最新gif图集</strong>
									<span style="float: right;"><a class="ia"><strong>更多..</strong></a></span>
								</div>
								<table style="width:100%;text-align: center;">
									<tr>
										<td style="margin-right: 5px;">
											<h5><strong>我是不会屈服的！</strong></h5>
											<img src="${pageContext.request.contextPath}/images/cat.gif" alt="猫" class="img-thumbnail">
										</td>
										<td style="margin-right: 5px;">
											<h5>活的还不如一只猫！</h5>
											<img src="${pageContext.request.contextPath}/images/cat.gif" alt="猫" class="img-thumbnail">
										</td>
										<td>
											<h5>地地道道的？</h5>
											<img src="${pageContext.request.contextPath}/images/cat.gif" alt="猫" class="img-thumbnail">
										</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="col-md-3 col-sm-12 col-xs-12">
							<div style="margin-top: 1rem;border: 1px solid #238A25;">
								<div style="" class="mk fs20">
									<strong>最新笑话</strong>
									<span style="float: right;"><a class="ia"><strong>更多..</strong></a></span>
								</div>
								<ul style="list-style-type:none;padding: 4px;">
									<li>
									<img src="${pageContext.request.contextPath}/images/d01.gif" width="8" height="10" border="0">
										<a class="ia">星期一上班</a>
									</li>
									<li>
									<img src="${pageContext.request.contextPath}/images/d01.gif" width="8" height="10" border="0">
										<a class="ia">星期二上班</a>
									</li>
									<li>
									<img src="${pageContext.request.contextPath}/images/d01.gif" width="8" height="10" border="0">
										<a class="ia">星期二上班</a>
									</li>
									<li>
									<img src="${pageContext.request.contextPath}/images/d01.gif" width="8" height="10" border="0">
										<a class="ia">星期二上班</a>
									</li>
								</ul>
							</div>
						</div>
				</div>
				</div>
		
</div>
</body>
</html>