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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="row">
  <div class="col-xs-0 col-md-1"></div>
  <div class="col-xs-12 col-md-8" style="padding: 0px 30px;">
	  <div class="panel panel-info" >
	    <div class="panel-body">
	    <c:forEach var="item" items="${jokes}" varStatus="status">
		     <div class="panel panel-info">
				<div class="panel-heading">第${item.periods}期&nbsp;&nbsp;&nbsp;${item.title}</div>
				<div class="panel-body" style="height:150px;overflow:hidden;">
				${item.content}
				‍‍‍‍</div>
				<div class="panel-footer" style="opacity:0.99;">
					<a href="${pageContext.request.contextPath}/foreground/jokeDetail.html?id=${item.id}">查看全文</a>
				</div>
			</div>
		 </c:forEach>
  		</div>
		  <div style="border-bottom-right-radius:3px;border-bottom-left-radius:3px;text-align: center;">
			<ul class="pagination">
				<c:if test="${page.hasPrePage}">
			   		<li><a href="${pageContext.request.contextPath}/foreground/jokeIndex.html?pageNum=1">&laquo;</a></li>
			   	</c:if>
			   	<c:if test="${!page.hasPrePage}">
			   		<li class="disabled"><a href="#">&laquo;</a></li>
			   	</c:if>
			   	
				<c:forEach var="item" items="${page.pageList}" varStatus="status">
				   <c:if test="${page.currPage == item}">
					  	<li  class="active"><a href="${pageContext.request.contextPath}/foreground/jokeIndex.html?pageNum=${item}">${item}</a></li>
				   </c:if>
				   <c:if test="${page.currPage != item}">
					  	<li><a href="${pageContext.request.contextPath}/foreground/jokeIndex.html?pageNum=${item}">${item}</a></li>
				   </c:if>
				 </c:forEach>
				   
				<c:if test="${page.hasNextPage}">
			   		<li><a href="${pageContext.request.contextPath}/foreground/jokeIndex.html?pageNum=${page.totalPage}">&raquo;</a></li>
			   	</c:if>
			   	<c:if test="${!page.hasNextPage}">
			   		<li class="disabled"><a href="#">&raquo;</a></li>
			   	</c:if>
			</ul>
		</div>
	</div>
</div>

  <div class="col-xs-12 col-md-3">
	 <div class="panel panel-info" style="margin-right: 30px;">
		<div class="panel-heading">点击排行榜</div>
		<div class="panel-body cfbox">
				<ul>
					 <c:forEach var="item" items="${jokeRank}" varStatus="status">
	                   <li><span>[${item.open}]</span>▪<a href="${pageContext.request.contextPath}/foreground/jokeDetail.html?id=${item.id}" target="_blank">第${item.periods}期 ${item.title}</a></li>
	                 </c:forEach>
                </ul>
		</div>
	</div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/foreground/jokeIndex.js"></script>
</body>
</html>