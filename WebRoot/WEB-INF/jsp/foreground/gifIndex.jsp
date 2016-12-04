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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/waibu.css">
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
                   	 <a href="" target="_blank">搞笑gif第${item.indexNum}期 ${item.description}</a>
                    </dt>
                	<dd class="gallery">
                		<div>
	                    <a href="" target="_blank">
	                    	<img src="http://localhost:8090/${item.imgUrl}"  width="165" height="110" alt="搞笑gif第${item.indexNum}期 ${item.description}">
	                    </a>
	                    </div>
	                    <p class="text">搞笑gif第${item.indexNum}期 ${item.description} 欢乐不止，高能不断，本期搞笑gif将为大家带来更多更好玩的动态图，各位小伙伴，请坐<a href="" target="_blank">[详细]</a></p>
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
			innerHtml = innerHtml + '<a href="" target="_blank">搞笑gif第'+item.indexNum+'期 '+item.description+'</a>';
			innerHtml = innerHtml + '</dt><dd class="gallery"><div> <a href="" target="_blank">';
			innerHtml = innerHtml + '<img src="http://localhost:8090/'+item.imgUrl+'"  width="165" height="110" alt="搞笑gif第'+item.indexNum+'期 '+item.description+'">';
			innerHtml = innerHtml + '</a></div><p class="text">搞笑gif第'+item.indexNum+'期 '+item.description+' 欢乐不止，高能不断，本期搞笑gif将为大家带来更多更好玩的动态图，各位小伙伴，请坐<a href="" target="_blank">[详细]</a></p>';
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			<div class="col-md-3 col-sm-12 col-xs-12">
			<div class="cfbox mtop13">
            <a class="tit">搞笑GIF最热资讯</a>
            <ul>
                                <li><span>[2016-11-29]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/110764.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/110764.html%27" tppabs="http://www.yxbao.com/xw/110764.html" target="_blank">游戏堡搞笑gif第71期 谁想学摄影？</a></li>
                                <li><span>[2016-11-23]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/110249.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/110249.html%27" tppabs="http://www.yxbao.com/xw/110249.html" target="_blank">游戏堡搞笑gif第70期 洗完澡摸香香</a></li>
                                <li><span>[2016-11-16]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/109670.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/109670.html%27" tppabs="http://www.yxbao.com/xw/109670.html" target="_blank">游戏堡搞笑gif第69期 如何分辨妹纸的真假胸</a></li>
                                <li><span>[2016-10-13]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/107006.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/107006.html%27" tppabs="http://www.yxbao.com/xw/107006.html" target="_blank">游戏堡搞笑gif第66期 大胸妹子穿衣的烦恼</a></li>
                                <li><span>[2016-11-09]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/109030.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/109030.html%27" tppabs="http://www.yxbao.com/xw/109030.html" target="_blank">游戏堡搞笑gif第68期 太太你这样我会分心的！</a></li>
                                <li><span>[2016-09-27]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/106411.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/106411.html%27" tppabs="http://www.yxbao.com/xw/106411.html" target="_blank">游戏堡搞笑gif第65期 这样摸来摸去很容易出事</a></li>
                                <li><span>[2015-06-25]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/88665.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/88665.html%27" tppabs="http://www.yxbao.com/xw/88665.html" target="_blank">看完内裤都脱了：盘点日了狗的羞羞福利gif动态图！</a></li>
                                <li><span>[2016-09-12]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/105497.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/105497.html%27" tppabs="http://www.yxbao.com/xw/105497.html" target="_blank">游戏堡搞笑gif第64期 脱裤子后入来互相伤害</a></li>
                                <li><span>[2016-10-31]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/108188.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/108188.html%27" tppabs="http://www.yxbao.com/xw/108188.html" target="_blank">游戏堡搞笑gif第67期 我机智地丢了支笔！</a></li>
                                <li><span>[2016-08-30]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/104577.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/104577.html%27" tppabs="http://www.yxbao.com/xw/104577.html" target="_blank">游戏堡搞笑gif第63期 女性泳装这么设计的意义是什么</a></li>
                                <li><span>[2016-08-18]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/103878.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/103878.html%27" tppabs="http://www.yxbao.com/xw/103878.html" target="_blank">游戏堡搞笑gif第62期 这样抖腿很健身啊</a></li>
                                <li><span>[2016-07-22]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/102619.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/102619.html%27" tppabs="http://www.yxbao.com/xw/102619.html" target="_blank">游戏堡搞笑gif第59期 妹子躲在被窝里干嘛</a></li>
                                <li><span>[2016-08-12]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/103507.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/103507.html%27" tppabs="http://www.yxbao.com/xw/103507.html" target="_blank">游戏堡搞笑gif第61期 这是引力波？！感觉被吸进去了</a></li>
                                <li><span>[2016-08-05]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/103225.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/103225.html%27" tppabs="http://www.yxbao.com/xw/103225.html" target="_blank">游戏堡搞笑gif第60期 现在的妹子居然中空…​太不自重了</a></li>
                                <li><span>[2016-06-23]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/100924.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/100924.html%27" tppabs="http://www.yxbao.com/xw/100924.html" target="_blank">游戏堡搞笑gif第55期 没什么意思，我看了四十多次就关了</a></li>
                                <li><span>[2013-03-05]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/30971.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/30971.html%27" tppabs="http://www.yxbao.com/xw/30971.html" target="_blank">搞笑gif图集第一期 游戏堡让你乐翻天</a></li>
                                <li><span>[2013-06-24]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/43224.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/43224.html%27" tppabs="http://www.yxbao.com/xw/43224.html" target="_blank">动态巨乳肥臀你受的了吗?美女GIF动图大合集(图)</a></li>
                                <li><span>[2016-07-14]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/102100.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/102100.html%27" tppabs="http://www.yxbao.com/xw/102100.html" target="_blank">游戏堡搞笑gif第58期 这神遮挡真想一脚踢飞！</a></li>
                                <li><span>[2016-07-07]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/101727.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/101727.html%27" tppabs="http://www.yxbao.com/xw/101727.html" target="_blank">游戏堡搞笑gif第57期 此乃胸兆也</a></li>
                                <li><span>[2016-06-16]</span>▪<a href="javascript:if(confirm(%27http://www.yxbao.com/xw/100455.html  \n\nThis file was not retrieved by Teleport Ultra, because it is addressed on a domain or path outside the boundaries set for its Starting Address.  \n\nDo you want to open it from the server?%27))window.location=%27http://www.yxbao.com/xw/100455.html%27" tppabs="http://www.yxbao.com/xw/100455.html" target="_blank">游戏堡搞笑gif第54期 叫兽我也要学画画</a></li>
                            </ul>
        </div>
				</div>
			</div>
	</div>
</div>
</body>
</html>