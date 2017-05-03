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
	    <input type="hidden" name="articleId" id="articleId" value="${articleId}"/>
		     <div class="panel panel-info" style="border: 0px;">
				<div class="panel-body">
				<dl id="dlMian">
				<c:forEach var="item" items="${articleDetails}" varStatus="status">
					<c:if test="${status.index == 0}">
						<dt>
						<h4>${status.index + 1}.${item.description}</h4> 
						<dd style="margin-top: 20px;text-align: center;">
						 <a id="a_${item.id}"  style="cursor: pointer;text-decoration:none" href="javascript:void(0);">
		                    <img id="img_${item.id}" style="max-height: 400px;max-width: 21rem;min-height: 250px;min-width: 18rem;" src="http://118.89.143.115:8090//${item.img_url}">
		                    <div id="span_${item.id}" class="vcenter" style="opacity:0.01;">play</div>
	                    </a>
					</c:if>
					<c:if test="${status.index != 0}">
	                	<dt style="margin-top: 100px;">
	                	<h4>${status.index + 1}.${item.description}</h4> 
	                	<dd style="margin-top: 20px;text-align: center;">
	                    <a id="a_${item.id}"  style="cursor: pointer;text-decoration:none" href="javascript:void(0);" onclick="getGif(${item.id})">
		                    <img id="img_${item.id}" style="max-height: 400px;max-width: 21rem;min-height: 250px;min-width: 18rem;" src="http://118.89.143.115:8090//${item.img_url_des}">
		                    <div id="span_${item.id}" class="vcenter">play</div>
	                    </a>
	                </c:if>
	                </dd>
                    </dt>
                </c:forEach>
            	</dl>
				‍‍‍‍</div>
			</div>
  		</div>
  <div style="border-bottom-right-radius:3px;border-bottom-left-radius:3px;text-align: center;">
	   <ul class="pagination pageul" id="pageUl">
				<c:if test="${page.hasPrePage}">
			   		<li onclick="getOthers(1)"><a>&laquo;</a></li>
			   	</c:if>
			   	<c:if test="${!page.hasPrePage}">
			   		<li class="disabled"><a>&laquo;</a></li>
			   	</c:if>
			   	
				<c:forEach var="item" items="${page.pageList}" varStatus="status">
				   <c:if test="${page.currPage == item}">
					  	<li onclick="getOthers(${item})" class="active"><a>${item}</a></li>
				   </c:if>
				   <c:if test="${page.currPage != item}">
					  	<li onclick="getOthers(${item})"><a>${item}</a></li>
				   </c:if>
				 </c:forEach>
				   
				<c:if test="${page.hasNextPage}">
			   		<li onclick="getOthers(${page.totalPage})"><a>&raquo;</a></li>
			   	</c:if>
			   	<c:if test="${!page.hasNextPage}">
			   		<li class="disabled"><a>&raquo;</a></li>
			   	</c:if>
			</ul>
</div>
	   
	</div>
	
	

</div>
  <div class="col-xs-12 col-md-3">
	
  </div>
</div>
<jsp:include page="footer.jsp"/>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/foreground/gifDetail.js"></script>
</body>
</html>