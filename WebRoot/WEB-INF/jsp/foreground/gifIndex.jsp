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
	    <div class="panel-body">
		 <dl class="index-recommends">
		  <c:forEach var="item" items="${articles}" varStatus="status">
		      <dd class="">
		        <a href="${pageContext.request.contextPath}/foreground/gifDetail.html?id=${item.id}" >
		          <img alt="${item.description}" src="http://118.89.143.115:8090//${item.imgUrl}">
		          <div class="index-recommend-title">
		            <span>【${item.description}】</span>
		          </div>
		          <i class="badge "></i>
				</a>      
			</dd>
		 </c:forEach>
		</dl>
   		</div>
 	 	<div style="border-bottom-right-radius:3px;border-bottom-left-radius:3px;text-align: center;">
			<ul class="pagination">
				<c:if test="${page.hasPrePage}">
			   		<li><a href="${pageContext.request.contextPath}/foreground/gifIndex.html?pageNum=1">&laquo;</a></li>
			   	</c:if>
			   	<c:if test="${!page.hasPrePage}">
			   		<li class="disabled"><a>&laquo;</a></li>
			   	</c:if>
			   	
				<c:forEach var="item" items="${page.pageList}" varStatus="status">
				   <c:if test="${page.currPage == item}">
					  	<li  class="active"><a href="${pageContext.request.contextPath}/foreground/gifIndex.html?pageNum=${item}">${item}</a></li>
				   </c:if>
				   <c:if test="${page.currPage != item}">
					  	<li><a href="${pageContext.request.contextPath}/foreground/gifIndex.html?pageNum=${item}">${item}</a></li>
				   </c:if>
				 </c:forEach>
				   
				<c:if test="${page.hasNextPage}">
			   		<li><a href="${pageContext.request.contextPath}/foreground/gifIndex.html?pageNum=${page.totalPage}">&raquo;</a></li>
			   	</c:if>
			   	<c:if test="${!page.hasNextPage}">
			   		<li class="disabled"><a>&raquo;</a></li>
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
					<c:forEach var="item" items="${articleRanking}" varStatus="status">
                   		<li><span>[${item.open}]</span>▪<a href="${pageContext.request.contextPath}/foreground/gifDetail.html?id=${item.id}">第${item.periods}期 ${item.description}</a></li>
                    </c:forEach>
                </ul>
		</div>
	</div>
  </div>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>