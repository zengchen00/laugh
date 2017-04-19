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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<style>
body{
overflow-x:hidden;
}
.indicate {
    text-align: center;
     padding: 4em 0;
}
span.glyphicon.glyphicon-map-marker {
    font-size: 2em;
    border-radius: 60px;
    border: 2px solid#3b3772;
    padding: 1em;
	color:#3b3772;
}
span.glyphicon.glyphicon-map-marker:hover {
    border: 2px dotted #04af82;
}
span.glyphicon.glyphicon-earphone {
    font-size: 2em;
    border-radius: 60px;
    border: 2px solid #3b3772;
    padding: 1em;
    color:#3b3772;
}
span.glyphicon.glyphicon-earphone:hover {
    border: 2px dotted #04af82;
}
span.glyphicon.glyphicon-envelope {
    font-size: 2em;
    border-radius: 60px;
    border: 2px solid#3b3772;
    padding: 1em;
    color:#3b3772;
}
span.glyphicon.glyphicon-envelope:hover {
    border: 2px dotted #04af82;
}
span.glyphicon.glyphicon-send {
    font-size: 2em;
    border-radius: 60px;
    border: 2px solid#3b3772;
    padding: 1em;
	color:#3b3772;
}
span.glyphicon.glyphicon-send:hover {
    border: 2px dotted #04af82;
}
.indicate-grid {
    float: left;
    width: 25%;
}
.indicate-grid p{
    font-size: 0.92em;
}
.indicate-grid:nth-child(1) {
    margin-top: 1em;
}
.indicate-grid:nth-child(2) {
    margin-top: 1em;
}
.indicate-grid:nth-child(3) {
    margin-top: 1em;
}
.indicate-grid:nth-child(4) {
    margin-top: 1em;
}

.indicate-grid p {
  font-size: 1em;
  color: #999;
  margin-top: 2em;
}
.indicate-grid p a {
    color: #999;
    text-decoration: none;
}


.why-choose {
/*     padding: 4em 0; */
    text-align: center;
}
.why-choose h3 {
     font-size: 3.5em;
    font-family: 'DancingScript-Regular';
    color: #3b3772;
}
.choose-grid h4{
 font-size: 1.5em;
/*   color: #04af82; */
  text-transform: capitalize;
}
.choose-grid p{
	font-size:1em;
	line-height:1.8em;
	color:#999;
	margin:1em 0 0
}
.choose-grids {
  margin-top: 3em;
}
.ss{
width:250px;
height:200px;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="row">
  <div class="col-xs-0 col-md-1"></div>
  <div class="col-xs-12 col-md-10" style="padding: 0px 30px;">
			<div class="" data-animate-effect="fadeInLeft">
<!-- 				<h2 style="margin-left: 186px">我们的小队伍</h2> -->
				<h2>我们的小队伍</h2>
				<div class="row" style="margin-top:40px;">
<!-- 					<div class="col-md-2"></div> -->
					<div class="col-md-4 ">
						<img src="../images/small.jpg" alt="站长大人" class="img-responsive ss">
						<h3>小手好冰凉</h3>
						<h4>开发，运维</h4>
						<p style="line-height: 1.6;font-size: 16px;">
							我是一个程序员，很早就想做一个自己的网站，直到现在才诞生了这个网站，网站的主题的构想、页面的设计、
							页面样式编辑、后台程序的编写、数据库的设计、域名的购买、服务器的租赁，直到网站运行环境的配置安装，
							网站建设的每一步都是难关，毕竟我只会写后台代码，但是不放弃，每天做一点，网站迟早会建成的，
							不积跬步无以至千里，不积小流无以成江海！
						</p>
					</div>
					<div class="col-md-4">
						<img src="../images/big.jpg" alt="可怜小编" class="img-responsive ss">
						<h3>张大</h3>
						<h4>运营，财务</h4>
						<p style="line-height: 1.6;font-size: 16px;">
							别看本汪牙齿稀疏，胡子残缺，但是本汪学富五车，天文地理无所不知，数术药理
							无不精通，说是有经天纬地之才也不为过，但是万丈高楼平地而起，一屋不扫何以扫天下，
							这个网站的运营不做好怎能拯救世界？欢迎大家给本汪提意见，有好笑的笑话，图片也可以提供给我，
							本汪会发布在这个网站。
						</p>
					</div>
					<div class="col-md-4">
					<img src="../images/wx.png" alt="可怜小编" class="img-responsive ss">
						<h3>微信群</h3>
						<h4>笑友</h4>
						<p style="line-height: 1.6;font-size: 16px;">
							加入我们，每天分享搞笑图片，传播快乐，第一时间了解网站最新资讯。
						</p>
					</div>
<!-- 					<div class="col-md-1"></div> -->
				</div>
			</div>
			
			<div class="why-choose">
<!-- 					<div class="container"> -->
						<h2>本网站存在的意义 ?</h2>
						<div class="choose-grids">
							<div class="row">
								<div class="col-md-4 choose-grid">
									<h4>1. 保卫世界的和平</h4>
									<p>
										
									</p>
								</div>
								<div class="col-md-4 choose-grid">
									<h4>2. 传播欢笑传播爱</h4>
									<p>
									去年某一天，本站长在网页上看了几篇gif动态图，非常好笑，
									但是独乐乐不如众乐乐，很想让更多的人看到这些好笑的图片，
									让更多的人都开心，但是它们都是一页一张图片，看的太不尽兴，
									翻页都是整个网页刷新，实在太慢，所以我想做一个让大家看的尽兴
									的网站
									</p>
								</div>
								<div class="col-md-4 choose-grid">
									<h4>3. faucibus risus</h4>
									<p>Lorem ipsum dolor sit amet, consectetuer adipiscing ellente ssed 
									dololiquam congu fermentum nisl. Mauris asan nulla vel diam. Sed in
									 lacus ut enim adipiscing aliquetulla venenat pede mi, aliquet sit 
									 amet, euismod in, auctor ut.</p>
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
<!-- 					</div>	 -->
				</div>

			<div class="indicate">
					<div class="container">
						<div class="indicate-grids">
							<div class="col-md-3 indicate-grid">
								<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
								<p>星光大道 8888号</p>
							</div>
							<div class="col-md-3 indicate-grid">
								<span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>
								<p>电话 :  +188 8888 8888</p>
							</div>
							<div class="col-md-3 indicate-grid">
								<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
								<p>E-mail : <a href="mailto:zengchenlong2008@163.com"> zengchenlong2008@163.com</a></p>
							</div>
							<div class="col-md-3 indicate-grid">
								<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
								<p>FAX :  +888 8888 8888</p>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
	   
</div>
  <div class="col-xs-0 col-md-1"></div>
</div>

</body>
</html>