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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
<body>
<div class="container" id="main">
<!-- 		<div class="row"> -->
<!-- 			<div class="col-lg-12"> -->
<%-- 				<img alt="" src="${pageContext.request.contextPath}/images/logo_back.png"> --%>
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="row">
			<div class="col-lg-12">
				<nav id="zlight-nav">
					<ul id="zlight-main-nav">
						<li class="zlight-active"><a href="#">搞笑gif图</a></li>
						<li class="zlight-dropdown">
							<a href="#">笑话段子 <i class="icon-angle-down"></i></a>
							<ul class="zlight-submenu">
								<li><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
							</ul>
						</li>
						<li><a href="#">Portfolio</a></li>
						<li class="zlight-dropdown">
							<a href="#">Pages <i class="icon-angle-down"></i></a>
							<ul class="zlight-submenu">
								<li><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
								<li class="zlight-dropdown">
									<a href="#">Dropdown <i class="icon-angle-right"></i></a>
									<ul class="zlight-submenu">
										<li><a href="#">Link 1</a></li>
										<li><a href="#">Link 2</a></li>
										<li><a href="#">Link 3</a></li>
										<li class="zlight-dropdown">
											<a href="#">Dropdown <i class="icon-angle-right"></i></a>
											<ul class="zlight-submenu">
												<li><a href="#">Link 1</a></li>
												<li><a href="#">Link 2</a></li>
												<li><a href="#">Link 3</a></li>
												<li><a href="#">Link 4</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><a href="#">Link 5</a></li>
							</ul>
						</li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">About</a></li>
					</ul>
					<!-- MOBILE NAV -->
					<div id="zlight-mobile-nav">
						<span>Menu</span>
						<i class="icon-reorder zlight-icon"></i>
						<select></select>
					</div>
				</nav> <!-- nav close -->

			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 prev-con">
				<h5>Default</h5>
				<a href="index.html" class="prev"><img src="${pageContext.request.contextPath}/images/1.jpg" alt="preview" class="img-responsive"></a>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6 prev-con">
				<h5>Custom</h5>
				<a href="prev1.html" class="prev"><img src="${pageContext.request.contextPath}/images/2.jpg" alt="preview" class="img-responsive"></a>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<h4 class="zlight-hhh">jQuery页面滚动顶部悬浮导航</h4>
			</div>
		</div>

		<div class="row" style="margin-bottom:900px;">
			<div class="col-lg-12">
				<p>Z Light Menu is the simple responsive navigation plugin, 
				working with media queries, which can be easy transformed for 
				mobile devices.</p>
				<p><h4 style="margin-top:30px;">Features:</h4>
					<ul>
						<li>Responsive</li>
						<li>Simple to Use</li>
						<li>Cross Browsers</li>
						<li>Fully customizable</li>
						<li>Retina ready (Font Awesome integrated)</li>
						<li>Min version: 5kb</li>
					</ul>
				</p><p>Scroll down (don&#39;t forget to remove the frame)</p>
				<div style="text-align:center;clear:both"><br>
				<p>适用浏览器：FireFox、Chrome、Safari、Opera、傲游、搜狗. 不支持IE8、360、世界之窗。</p>
				<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
			</div>
			</div>
		</div>

	</div> <!-- main close -->

	</div> <!-- container close -->
</body>
</html>