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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="row">
  <div class="col-xs-0 col-md-1"></div>
  <div class="col-xs-12 col-md-10" style="padding: 0px 30px;">
	  <div class="panel panel-default" style="background: #f6f6f1;">
	    <div class="panel-heading">热门gif图集<a style="float:right;cursor: pointer;" href="${pageContext.request.contextPath}/foreground/gifIndex.html?pageNum=1">更多</a></div>
	    <div class="panel-body" style="text-align: center;">
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
	</div>
	
	
	<div class="panel panel-default" style="background: #f6f6f1;">
	    <div class="panel-heading">极品笑话<a style="float:right;cursor: pointer;" href="${pageContext.request.contextPath}/foreground/jokeIndex.html?pageNum=1">更多</a></div>
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
	</div>
</div>
  <div class="col-xs-0 col-md-1"></div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>