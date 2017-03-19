<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理台首页</title>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/ace/assets/css/ace.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/ace/assets/css/jquery-ui.custom.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/ace/assets/css/font-awesome.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/ace/assets/css/ui.jqgrid.css" />
<script src="${pageContext.request.contextPath}/ace/assets/js/jqGrid/jquery.jqGrid.src.js"></script>
<script src="${pageContext.request.contextPath}/ace/assets/js/jqGrid/i18n/grid.locale-cn.js"></script>

</head>
<body>
	<div class="container">
		<jsp:include page="../head.jsp" />
		<div class="row" style="margin-top: 4rem;">
			<jsp:include page="../left.jsp" />
			<div class="col-md-9">
				<div class="pagecontent">
				<table id="grid-table"></table>
				<div id="grid-pager"></div>
				</div>
			</div>
		</div>
	</div>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/background/deleteJoke.js"></script>
</body>
</html>