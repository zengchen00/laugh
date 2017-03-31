<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<title>上传图片</title>
<style type="text/css">
	.tablet-width {
	    height: 1000px !important;
	    margin: 0 auto;
	    padding: 175px 100px 115px 100px;
	    width: 785px;
	    margin-top: 40px;
	    margin-bottom: 40px;
	    background: url(images/bg-mob.png) no-repeat 0 0;
	}
    .tablet-width iframe {
        height: 960px !important;
    }
    
    .mobile-width {
	    height: 730px !important;
	    margin: 0 auto;
	    padding: 165px 115px 100px 100px;
	    width: 1041px;
	    margin-top: 40px;
	    background: url(images/bg-mob.png) no-repeat 0 -1249px;
	}
    .mobile-width iframe {
        height: 704px !important;
    }
    
   .mobile-width-2 {
	    height: 417px !important;
	    margin: 0 auto;
	    padding: 125px 25px 159px 25px;
	    width: 337px;
	    margin-top: 40px;
	    background: url(images/bg-mob.png) no-repeat 0 -2217px;
	}
	.mobile-width-2 iframe {
        height: 416px !important;
    }
	
	.mobile-width-3 {
	    height: 256px !important;
	    margin: 0 auto;
	    padding: 45px 115px 69px 105px;
	    width: 497px;
	    margin-top: 40px;
	    background: url(images/bg-mob.png) no-repeat -387px -2217px;
	}
    .mobile-width-3 iframe {
        height: 256px !important;
    }
</style>
</head>
<body>
<button id="one">平板竖屏</button>
<button id="two">平板横屏</button>
<button id="three">手机竖屏</button>
<button id="four">手机横屏</button>
<!-- <div id="iframe-wrap" class="tablet-width"> -->
		<div id="iframe-wrap" class="mobile-width">
<!-- <div id="iframe-wrap" class="mobile-width-3"> -->
		    <iframe id="iframe" src="${pageContext.request.contextPath}/foreground/jokeDetail.html" frameborder="0" width="100%" height="160px"> </iframe>
</div>
<script type="text/javascript">
	$("#one").click(function(){
		$("#iframe-wrap").attr("class","tablet-width");
	});
	$("#two").click(function(){
		$("#iframe-wrap").attr("class","mobile-width");
	});
	$("#three").click(function(){
		$("#iframe-wrap").attr("class","mobile-width-2");
	});
	$("#four").click(function(){
		$("#iframe-wrap").attr("class","mobile-width-3");
	});
</script>
</body>
</html>