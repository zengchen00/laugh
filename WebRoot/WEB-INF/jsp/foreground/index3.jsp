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
.pop-book2{
	float: left;
	font-size: 14px;
	line-height: 1.1;
	margin: 0 0 2% 56.5px;
	text-align: center;
	width: 100px;}
.pop-book2 img{
	box-shadow: 1px 2px 2px rgba(0, 0, 0, 0.3);
	display: block;
	margin: 0 auto 1em;}
.pop-book2 h2{
	color: #985d3e;
	font-weight:normal;
	font-size:16px;
	line-height:1.5em;
	max-height: 3em;
	overflow: hidden;}
.pop-book2 span{
	display: block;
	color: #999;
	font-size:14px;
	line-height:1.5em;
	min-height: 1.5em;
	max-height: 3em;
	overflow: hidden;
	}
	
	.index-recommends{overflow:hidden;margin-bottom:15px}
	.index-recommends dd{position:relative;float:left;width:244px;height:220px;margin-right:20px;border-radius:4px;overflow:hidden}
	.index-recommends a:hover span{color:#fea701}
	.index-recommends img{display:block;width:100%;height:100%;-webkit-transition:all 0.3s linear 0s;-moz-transition:all 0.3s linear 0s;-o-transition:all 0.3s linear 0s;transition:all 0.3s linear 0s;background:url(http://bjmhasset.b0.upaiyun.com/assets/level3/resources/default-bg-4bd196ce6a34aaac560bb56be6cf5058.png) no-repeat center center;background-color:#e7e7e7;background-size:contain}
	.index-recommends img:hover{-webkit-transform:scale(1.05);-moz-transform:scale(1.05);-o-transform:scale(1.05);transform:scale(1.05)}
	.index-recommend-title{position:absolute;bottom:0;right:0;left:0;height:35px;line-height:35px;padding:0 10px;font-size:14px;color:#fff;background:url(http://bjmhasset.b0.upaiyun.com/assets/level3/resources/black_opactiy6-04957f3df9f2c13f78d205758329d8ce.png)}
	.index-recommend-title span{display:block;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
	.weiboshow{margin-top:10px}
	
	.jokeshow{
	white-space:nowrap;overflow:hidden;text-overflow:ellipsis;
	}
</style>
</head>
<body>
		<nav class="navbar navbar-default navbar-fixed-top">
<!-- 		<div class="navbar-header"> -->
<%-- 		  　  <img style="height:50px;" src="${pageContext.request.contextPath}/images/logo.png"> --%>
<!-- 		  　</div> -->
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
		        <li class="active"><a href="#">网站首页</a></li>
		        <li><a href="#">搞笑gif图</a></li>
		        <li><a href="#">极品笑话</a></li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="#">关于我们</a></li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<div style="height:5rem;"></div>
<div class="row">
  <div class="col-xs-0 col-md-1"></div>
  <div class="col-xs-12 col-md-10" style="padding: 0px 30px;">
	  <div class="panel panel-default" style="background: #f6f6f1;">
	    <div class="panel-heading">热门gif图集<a style="float:right;">更多</a></div>
	    <div class="panel-body" style="text-align: center;">
	   
			
  <dl class="index-recommends">
      <dd class="">
        <a href="javascript: void(0);" data-href="http://baozoumanhua.com/channels/4333">
          <img alt=" 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑" src="http://wanzao2.b0.upaiyun.com/system/post_tile/home_recommended_baomen/icons/1238/original/4E96A6DA88F20E4996DABF9B2B2C74D0.jpg">
          <div class="index-recommend-title">
            <span> 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑</span>
          </div>
          <i class="badge "></i>
</a>      </dd>
      <dd class="">
        <a href="javascript: void(0);" data-href="http://baozoumanhua.com/channels/7015">
          <img alt="【不要脸的故事】 不要脸的故事 没有鸡汤，只有砒霜。" src="http://wanzao2.b0.upaiyun.com/system/post_tile/home_recommended_funny_pics/icons/1237/original/%E8%B6%A3%E5%9B%BE%E7%BD%91%E7%AB%99%E6%A2%97%E5%9B%BE.jpg">
          <div class="index-recommend-title">
            <span>【不要脸的故事】 不要脸的故事 没有鸡汤，只有砒霜。</span>
          </div>
          <i class="badge "></i>
</a>      </dd>
      <dd class="">
        <a href="javascript: void(0);" data-href="http://baozoumanhua.com/video_channels/6577">
          <img alt="【暴走看啥片第三季】纸巾老撕陪你看片儿啦！每周一部经典电影，外送无节操吐槽，自备可乐爆米花您咧～ " src="http://wanzao2.b0.upaiyun.com/system/post_tile/home_recommended_videos/icons/1241/original/%E8%A7%86%E9%A2%91%E7%BD%91%E7%AB%99%E6%A2%97%E5%9B%BE.jpg">
          <div class="index-recommend-title">
            <span>【暴走看啥片第三季】纸巾老撕陪你看片儿啦！每周一部经典电影，外送无节操吐槽，自备可乐爆米花您咧～ </span>
          </div>
          <i class="badge "></i>
</a>      </dd>
      <dd class="nomargin">
        <a href="javascript: void(0);" data-href="http://uri6.com/NjQ3ea">
          <img alt="龙之谷 暴漫专属安卓下载！" src="http://wanzao2.b0.upaiyun.com/system/post_tile/home_recommended_texts/icons/1240/original/2017.03.24__%E9%BE%99%E4%B9%8B%E8%B0%B7_banner%E5%9B%BE286x230.jpg">
          <div class="index-recommend-title">
            <span>龙之谷 暴漫专属安卓下载！</span>
          </div>
          <i class="badge badge-text"></i>
</a>      </dd>
  </dl>
  
  
  
  
  
  
	    </div>
	   
	</div>
	
	
	<div class="panel panel-default" style="background: #f6f6f1;">
	    <div class="panel-heading">极品笑话<a style="float:right;">更多</a></div>
	    <div class="panel-body">
	    
	   <div class="panel panel-info">
	<div class="panel-heading">想想竟然有点激动呢<span style="float:right;">第23期</span></div>
	<div class="panel-body" style="height:150px;overflow:hidden">
	
<h3 style="border: 0px; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; white-space: normal;"><a href="http://undefined" style="border: none; padding: 0px; margin: 0px; color: rgb(22, 56, 124); font-family: 宋体;">想想竟然有点激动呢</a></h3><div id="endtext" style="border: none; padding: 0px; margin: 5px 5px 20px; outline: 0px; font-size: 18px; font-family: 宋体; overflow: hidden; clear: both; word-break: break-all; line-height: 1.6em; color: rgb(51, 51, 51); white-space: normal;">‍‍‍‍　　三岁的儿子从幼儿园回来气呼呼的对我说：“爸爸，老师一点都不好，总是凶我，中午还不拍拍我睡觉。”<br/>　　我：“老师不可能像妈妈一样照顾那么多人的，你要听话。”<br/>　　儿子：“让老师和妈妈换换就好了，妈妈每天在幼儿园陪我，老师在家陪爸爸睡觉。”<br/>　　想想竟然有点激动呢。‍‍‍‍</div><p><br/></p>
	
	
	
	‍‍‍‍</div>
	<div class="panel-footer" style="opacity:0.99;"><a>查看全文</a></div>
</div>
   <div class="panel panel-info">
	<div class="panel-heading">想想竟然有点激动呢<span style="float:right;">第23期</span></div>
	<div class="panel-body" style="height:150px;overflow:hidden">
	
<h3 style="border: 0px; padding: 0px; margin: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; white-space: normal;"><a href="http://undefined" style="border: none; padding: 0px; margin: 0px; color: rgb(22, 56, 124); font-family: 宋体;">想想竟然有点激动呢</a></h3><div id="endtext" style="border: none; padding: 0px; margin: 5px 5px 20px; outline: 0px; font-size: 18px; font-family: 宋体; overflow: hidden; clear: both; word-break: break-all; line-height: 1.6em; color: rgb(51, 51, 51); white-space: normal;">‍‍‍‍　　三岁的儿子从幼儿园回来气呼呼的对我说：“爸爸，老师一点都不好，总是凶我，中午还不拍拍我睡觉。”<br/>　　我：“老师不可能像妈妈一样照顾那么多人的，你要听话。”<br/>　　儿子：“让老师和妈妈换换就好了，妈妈每天在幼儿园陪我，老师在家陪爸爸睡觉。”<br/>　　想想竟然有点激动呢。‍‍‍‍</div><p><br/></p>
	
	
	
	‍‍‍‍</div>
	<div class="panel-footer" style="opacity:0.99;"><a>查看全文</a></div>
</div>
	        
	       
	    </div>
	   
	</div>
</div>
  <div class="col-xs-0 col-md-1"></div>
</div>

</body>
</html>