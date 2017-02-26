<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>快乐站点</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zlight.menu.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.zlight.menu.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body class="body">
<div class="container" id="main">
	<jsp:include page="head.jsp"/>
	<div class="row">
			<div class="row clearfix">
				<div class="col-md-1 col-sm-0 col-xs-0">
				</div>
				<div class="col-md-7 col-sm-12 col-xs-12">
					<div class="cf_l">
	                <div class="eleCenter" id="listbox">
	                <!-- 单位开始 -->
	                <c:forEach var="item" items="${articleDetails}" varStatus="status">
	                <div style="margin-top: 50px;">
	                <dl>
                	<dt>
                   	 ${status.index + 1}. ${item.description}
                    </dt>
                	<dd style="margin-top: 10px;">
	                    <img style="max-height: 400px;max-width: 400px;min-height: 250px;min-width: 300px;" src="http://localhost:8090/${item.img_url}">
                	</dd>
                	
            	   </dl>
            	   </div>
	            	  </c:forEach>
	            	   <!-- 单位完结 -->
	            	   
	       			 </div>
	   		 	</div>
	   		 	<div class="page" id="pageDiv" ajaxUrl="${pageContext.request.contextPath}/foreground/queryDetailPage.html">
				</div>
				<input type="hidden" id="shit" value="${page.pageListStr}"/>
				
				<div class="data_list comment_list">
					<div class="dataHeader">用户评论</div>
					<div class="commentDatas" id="comentList">
						<c:forEach var="comment" items="${commentList }">
							<div class="comment">
								<font>${comment.guestIp }：</font>${comment.userComment }&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${comment.createDate}" type="BOTH" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp;
							</div>
						</c:forEach>
					</div>
				<div class="page" id="commentPageDiv" ajaxUrl="${pageContext.request.contextPath}/foreground/queryCommentPage.html">
				</div>
				<input type="hidden" id="commentPageList" value="${commentPage.pageListStr}"/>
				</div>
				<div class="publish_list">
					<div class="publishBody">
						<form id="commentForm" actionUrl="${pageContext.request.contextPath}/foreground/commentSave.html" method="post">
							<input type="hidden" name="articleId" id="articleId" value="${articleId}"/>
							<div>
								<input type="hidden" value="${news.newsId }" name="newsId" id="newsId"/>
								<textarea style="width: 100%;" rows="3" name="content" id="content"></textarea>
							</div>
							<div class="publishButton">
								<button class="btn btn-primary" type="" id="saveComment">发表评论</button>
							</div>
						</form>
					</div>
				</div>
			</div>

	<!-- 中间栏结束  -->
			<div class="col-md-4 col-sm-12 col-xs-12 mt12" >
				 <div class="mala-news" style="margin-top: 100px;margin-right: -10px;">
				 <p style="font-size: 30px;margin-top: 5px;line-height: 35px;margin:0 auto;width:350px;text-align: center;">热情推荐</p>
				      <ul>
				      <li>
					      <a href=""  class="img-item">
					      <img width="130" height="90" alt="摸完下面摸上面" src="${pageContext.request.contextPath}/images/cat.gif" >
					      </a>
				        <p style="width:130px;text-align: center;"><a href="" >摸完下面摸上面ddddd等等等等等等</a></p>
				      </li>
					<li><a href=""  class="img-item"><img width="130" height="90" alt="浴室羞涩play" src="${pageContext.request.contextPath}/images/cat.gif" ></a>
				        <p style="width:130px;text-align: center;"><a href="" >浴室羞涩play</a></p>
				      </li>
					<li><a href="" class="img-item"><img width="130" height="90" alt="邪恶动态图：不作死就不会死" src="${pageContext.request.contextPath}/images/dancer.gif" ></a>
		 		        <p style="width:130px;text-align: center;"><a href="" >邪恶动态图：不作死就</a></p>
				      </li>
					<li><a href="" class="img-item"><img width="130" height="90" alt="叫你看毛片" src="${pageContext.request.contextPath}/images/dancer.gif" ></a>
				        <p style="width:130px;text-align: center;"><a href="" >叫你看毛片</a></p>
				      </li>
				<li>
					      <a href=""  class="img-item">
					      <img width="130" height="90" alt="摸完下面摸上面" src="${pageContext.request.contextPath}/images/cat.gif" >
					      </a>
				        <p style="width:130px;text-align: center;"><a href="" >摸完下面摸上面ddddd等等等等等等</a></p>
				      </li>
					<li><a href=""  class="img-item"><img width="130" height="90" alt="浴室羞涩play" src="${pageContext.request.contextPath}/images/cat.gif" ></a>
				        <p style="width:130px;text-align: center;"><a href="" >浴室羞涩play</a></p>
				      </li>
				      <li><a href="" class="img-item"><img width="130" height="90" alt="邪恶动态图：不作死就不会死" src="${pageContext.request.contextPath}/images/dancer.gif" ></a>
		 		        <p style="width:130px;text-align: center;"><a href="" >邪恶动态图：不作死就</a></p>
				      </li>
					<li><a href="" class="img-item"><img width="130" height="90" alt="叫你看毛片" src="${pageContext.request.contextPath}/images/dancer.gif" ></a>
				        <p style="width:130px;text-align: center;"><a href="" >叫你看毛片</a></p>
				      </li>
				    </ul>
				 </div>
		</div>
	</div>
</div>




	<div class="row" style="margin-top: 100px;">
		<jsp:include page="foot.jsp"/>
	</div>
</div>

<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/foreground/gifDetail.js"></script>
<script type="text/javascript">
var pageDiv = $("#pageDiv");
var htmlStr = "";
if(${page.hasPrePage}){
	htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+${page.prePage}+')">上一页</a>'
}
var ab = $("#shit").val();
var c = ab.split(",");
for(var i = 0;i< c.length;i++){
	var a =c[i];
	if(a == ${page.currPage}){
		htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')" class="on">'+a+'</a>';
	}else{
		htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')">'+a+'</a>';
	}
}
if(${page.hasNextPage}){
	htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+${page.nextPage}+')">下一页</a>';
}
pageDiv.html(htmlStr);

var commentPageDiv = $("#commentPageDiv");
var htmlStr1 = "";
if(${commentPage.hasPrePage}){
	htmlStr1 = htmlStr1 + '<a href="javascript:void(0);" onclick="getCommentAjax('+${commentPage.prePage}+')">上一页</a>'
}
var ab1 = $("#commentPageList").val();
var c1 = ab1.split(",");
for(var i = 0;i< c1.length;i++){
	var a =c1[i];
	if(a == ${commentPage.currPage}){
		htmlStr1 = htmlStr1 + '<a href="javascript:void(0);" onclick="getCommentAjax('+a+')" class="on">'+a+'</a>';
	}else{
		htmlStr1 = htmlStr1 + '<a href="javascript:void(0);" onclick="getCommentAjax('+a+')">'+a+'</a>';
	}
}
if(${commentPage.hasNextPage}){
	htmlStr1 = htmlStr1 + '<a href="javascript:void(0);" onclick="getCommentAjax('+${commentPage.nextPage}+')">下一页</a>';
}
commentPageDiv.html(htmlStr1);
</script>
</body>
</html>