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
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="row">
  <div class="col-xs-0 col-md-1"></div>
  <div class="col-xs-12 col-md-8" style="padding: 0px 30px;">
	  <div class="panel panel-info" >
	  <div class="panel-heading">${joke.title}</div>
	    <div class="panel-body">
	    ${joke.content}
  		</div>
	   <div class="panel-footer">
		   <c:if test="${empty jokePre}">
		   	 <a>上一篇：没有了</a>
		   </c:if>
		   <c:if test="${not empty jokePre}">
		   	 <a href="${pageContext.request.contextPath}/foreground/jokeDetail.html?id=${jokePre.id}">上一篇：${jokePre.title}</a>
		   </c:if>
		   
		   <c:if test="${empty jokeSuf}">
		   	<a style="float:right;">下一篇：没有了</a>
		   </c:if>
		   <c:if test="${not empty jokeSuf}">
		   	<a style="float:right;" href="${pageContext.request.contextPath}/foreground/jokeDetail.html?id=${jokeSuf.id}">下一篇：${jokeSuf.title}</a>
		   </c:if>
	   </div>
	</div>
	
	

</div>
  <div class="col-xs-12 col-md-3">
	 <div class="panel panel-info" style="margin-right: 30px;">
		<div class="panel-heading" style="text-align: center;">热情推荐</div>
		<div class="panel-body">
		
			<dl class="index-recommends">
		      <dd class="">
		        <a href="javascript: void(0);" data-href="http://baozoumanhua.com/channels/4333">
		          <img alt=" 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑" src="http://wanzao2.b0.upaiyun.com/system/post_tile/home_recommended_baomen/icons/1238/original/4E96A6DA88F20E4996DABF9B2B2C74D0.jpg">
		          <div class="index-recommend-title">
		            <span> 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑</span>
		          </div>
		          <i class="badge "></i>
				</a>      
				</dd>
				
				<dd class="">
		        <a href="javascript: void(0);" data-href="http://baozoumanhua.com/channels/4333">
		          <img alt=" 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑" src="http://wanzao2.b0.upaiyun.com/system/post_tile/home_recommended_baomen/icons/1238/original/4E96A6DA88F20E4996DABF9B2B2C74D0.jpg">
		          <div class="index-recommend-title">
		            <span> 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑</span>
		          </div>
		          <i class="badge "></i>
				</a>      
				</dd>
				
				<dd class="">
		        <a href="javascript: void(0);" data-href="http://baozoumanhua.com/channels/4333">
		          <img alt=" 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑" src="http://wanzao2.b0.upaiyun.com/system/post_tile/home_recommended_baomen/icons/1238/original/4E96A6DA88F20E4996DABF9B2B2C74D0.jpg">
		          <div class="index-recommend-title">
		            <span> 【老式暴走漫画】原始暴走画风与发生在身边的糗事，带给你几年前曾有的那份欢笑</span>
		          </div>
		          <i class="badge "></i>
				</a>      
				</dd>
				
				
	  		</dl>
  
		</div>
	</div>
  </div>
</div>

</body>
</html>