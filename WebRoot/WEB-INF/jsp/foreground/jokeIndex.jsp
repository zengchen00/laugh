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
<%-- 				<a href="javascript:void(0);" onclick="getJokeDetail(${item.id})">查看全文</a> --%>
				</div>
			</div>
		 </c:forEach>
			
			
  
  		</div>
  <div style="border-bottom-right-radius:3px;border-bottom-left-radius:3px;text-align: center;">
	<ul class="pagination">
	   <li><a href="#">&laquo;</a></li>
	   <li><a href="#">1</a></li>
	   <li><a href="#">2</a></li>
	   <li><a href="#">3</a></li>
	   <li><a href="#">4</a></li>
	   <li><a href="#">5</a></li>
	   <li><a href="#">&raquo;</a></li>
	</ul>
</div>
	   
	</div>
	
	

</div>
  <div class="col-xs-12 col-md-3">
	 <div class="panel panel-info" style="margin-right: 30px;">
		<div class="panel-heading">点击排行榜</div>
		<div class="panel-body cfbox">
				<ul>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                   <li><span>[10]</span>▪<a href="" target="_blank">第1期 滴答滴答滴答滴答的</a></li>
                </ul>
		</div>
	</div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/foreground/jokeIndex.js"></script>
</body>
</html>