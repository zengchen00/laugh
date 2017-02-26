<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<div class="col-md-3">
			<ul class="list-group">
			  <li class="list-group-item">
			    <strong>gif管理</strong>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			   <a id="addGif" href="${pageContext.request.contextPath}/background/addGif.html">新增gif文章</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a id="reGif" href="${pageContext.request.contextPath}/background/readyGif.html">待上线gif文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a id="onGif" href="${pageContext.request.contextPath}/background/onlineGif.html">在线gif文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a id="delGif" href="${pageContext.request.contextPath}/background/deleteGif.html">已删除gif文章列表</a>
			  </li>
			  
<!-- *****搞笑图片*****-->
			  <li class="list-group-item">
			    <strong>搞笑图片管理</strong>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			   <a href="#">新增搞笑图片文章</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">待上线搞笑图片文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">在线搞笑图片文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">已删除搞笑图片文章列表</a>
			  </li>
			  
<!-- *****段子*****-->
			  <li class="list-group-item">
			    <strong>段子管理</strong>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			   <a href="#">新增段子</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">待上线段子文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">在线段子文章列表</a>
			  </li>
			  <li class="list-group-item" style="text-indent: 1.5rem;">
			    <a href="#">已删除段子文章列表</a>
			  </li>
			</ul>
		</div>
		
<script type="text/javascript">
$(function(){
	var cur = ${cur} + "";
	switch (cur) {
		case "1":
			$("#addGif").css("color","#68228B");
			break;
		case "2":
			$("#reGif").css("color","#68228B");
			break;
		case "3":
			$("#onGif").css("color","#68228B");
			break;
		case "4":
			$("#delGif").css("color","#68228B");
			break;

		default:
			break;
	}
});
	
</script>