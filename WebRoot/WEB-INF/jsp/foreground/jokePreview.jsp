<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>梨花网</title>
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
	    <div class="panel-body" style="background-color:#f6f6f1;">
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
	 
  </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>