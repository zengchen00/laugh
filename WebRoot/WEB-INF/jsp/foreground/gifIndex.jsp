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
				<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="cf_l">
                <div class="listbox" id="listbox">
                <!-- 单位开始 -->
                <c:forEach var="item" items="${articles}" varStatus="status">
                   <dl>
                	<dt>
                   	 <a href="" target="_blank">第${item.indexNum}期 ${item.description}</a>
                    </dt>
                	<dd class="gallery">
                		<div>
	                    <a href="" target="_blank">
	                    	<img src="http://localhost:8090/${item.imgUrl}"  width="165" height="110" alt="搞笑gif第${item.indexNum}期 ${item.description}">
	                    </a>
	                    </div>
	                    <p class="text">搞笑GIF第${item.indexNum}期 ${item.description} 欢乐不止，高能不断，本期搞笑GIF将为大家带来更多更好玩的动态图，各位小伙伴，请坐<a href="" target="_blank">[详细]</a></p>
	                    <p>
	                                                                  阅读(${item.open})
	                        &nbsp;&nbsp;&nbsp;&nbsp;来源：播欢乐
	                        &nbsp;&nbsp;&nbsp;&nbsp;编辑：${item.userName}
	                    </p>
                	</dd>
            	   </dl>
            	   </c:forEach>
            	   <!-- 单位完结 -->
        <div class="page" id="pageDiv">
        </div>
        <input type="hidden" id="shit" value="${page.pageListStr}"/>
        </div>
    </div>
	</div>
<script type="text/javascript">
var pageNation = function(page,htmlStr){
	htmlStr = htmlStr + ' <div class="page" id="pageDiv">';
	if(page.hasPrePage){
		htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+page.prePage+')">上一页</a>'
	}
	var ab = page.pageListStr;
	var c = ab.split(",");
	for(var i = 0;i< c.length;i++){
		var a =c[i];
		if(a == page.currPage){
			htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')" class="on">'+a+'</a>';
		}else{
			htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+a+')">'+a+'</a>';
		}
	}
	if(page.hasNextPage){
		htmlStr = htmlStr + '<a href="javascript:void(0);" onclick="getAjax('+page.nextPage+')">下一页</a>';
	}
	htmlStr = htmlStr + '</div>';
	$("#listbox").html(htmlStr);
}

function getAjax(pageNum){
	console.log("go to " + pageNum);
	var url = "${pageContext.request.contextPath}/foreground/queryCurrPage.html";
	var data = new jsonData();
	data.put("cp",pageNum);
	var dataJson = data.toJson();
	myAjax(url,dataJson,function(data){
		var articles = data.articles;
		var innerHtml = "";
		for (var i = 0; i < articles.length; i++) {
			var item = articles[i];
			innerHtml = innerHtml + '<dl><dt>';
			innerHtml = innerHtml + '<a href="" target="_blank">第'+item.indexNum+'期 '+item.description+'</a>';
			innerHtml = innerHtml + '</dt><dd class="gallery"><div> <a href="" target="_blank">';
			innerHtml = innerHtml + '<img src="http://localhost:8090/'+item.imgUrl+'"  width="165" height="110" alt="搞笑gif第'+item.indexNum+'期 '+item.description+'">';
			innerHtml = innerHtml + '</a></div><p class="text">搞笑GIF第'+item.indexNum+'期 '+item.description+' 欢乐不止，高能不断，本期搞笑GIF将为大家带来更多更好玩的动态图，各位小伙伴，请坐<a href="" target="_blank">[详细]</a></p>';
			innerHtml = innerHtml + '<p>阅读('+item.open+')';
			innerHtml = innerHtml + '&nbsp;&nbsp;&nbsp;&nbsp;来源：播欢乐';
			innerHtml = innerHtml + '&nbsp;&nbsp;&nbsp;&nbsp;编辑：'+item.userName;
			innerHtml = innerHtml + '</p></dd></dl>';
		}
		pageNation(data.page,innerHtml);
	},function(){},function(){},true);
}

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
</script>
	<!-- 中间栏结束  -->
	<div class="col-md-3 col-sm-12 col-xs-12 mt12" >
		<div class="cfbox">
            <a class="tit" style='text-decoration:none;'>点击排行榜</a>
            	<ul>
            	<c:forEach var="item" items="${articleRanking}" varStatus="status">
                   <li><span>[${item.createDateStr}]</span>▪<a href="" target="_blank">第${item.indexNum}期 ${item.description}</a></li>
                </c:forEach>
                </ul>
        </div>
	</div>
</div>
</div>
	<div class="row">
		<jsp:include page="foot.jsp"/>
	</div>
</div>
</body>
</html>