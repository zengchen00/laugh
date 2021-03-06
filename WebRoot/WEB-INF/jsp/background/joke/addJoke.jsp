<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../../meta.jsp"/>
 <script type="text/javascript">
   	 window.UMEDITOR_HOME_URL = "/laugh/umeditor/";
	</script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zcV0.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.validate.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/ace/assets/css/ace.css">
 <link href="${pageContext.request.contextPath}/umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/third-party/template.min.js"></script>
	<!-- 配置文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/umeditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/umeditor/umeditor.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="../head.jsp" />
		<div class="row" style="margin-top: 4rem;">
			<jsp:include page="../left.jsp" />
			<div class="col-md-9">
			<fieldset>
				<label>笑话标题</label>
				<input type="text" id="jokeTitle" placeholder="笑话标题…">
			</fieldset>
			<div class="space-10"></div>
			<fieldset>
				<label>期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数</label>
				<input type="text" id="period" placeholder="期数…">
			</fieldset>
			<div class="space-12"></div>
				 <div class="panel panel-info" style="background: #f6f6f1;">
				    <div class="panel-body">
						 <div class="wysiwyg-editor" id="myEditor" style="min-height: 600px;" contenteditable="true">
 						</div>
				    </div>
				    <div class="panel-footer">
				    	<button id="saveContent" style="float:right;" ajaxUrl="${pageContext.request.contextPath}/background/saveJoke.html" class="btn btn-sm btn-danger btn-white btn-round">
								<i class="ace-icon fa fa-floppy-o bigger-125"></i> 保存
						</button>
					</div>
					<div class="space-12"></div>
				</div>
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/background/addJoke.js"></script>
</body>
</html>