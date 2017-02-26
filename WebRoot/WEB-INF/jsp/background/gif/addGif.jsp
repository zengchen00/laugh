<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理台首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zcV0.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<jsp:include page="../head.jsp"/>
	<div class="row" style="margin-top: 4rem;">
		<jsp:include page="../left.jsp"/>
		<div class="col-md-9">
			<form method="post" action="${pageContext.request.contextPath}/background/doAddGifs.html" enctype="multipart/form-data">
			  <table id="table" class="table table-striped table-condensed">
			  <tr>
			  	<td style="width:30px;" class="eleCenter">
					 <button id="addRow" type="button" class="btn btn-primary">新增一行</button>
				</td>
				<td>
				<span style="float: right; margin-right: 1rem;padding-top: 0.5rem;">总行数：<strong id="totalNum"></strong></span>
				</td>
			  </tr>
<!-- 			   <tr> -->
<!-- 			    	<td style="text-align:center;vertical-align:middle;"> -->
<!-- 						<span style="width:10%;">新增期数：</span> -->
<!-- 						<input id="" name="" class="form-control" type="text" style="display: inline;"> -->
<!-- 			    	</td> -->
<!-- 			    	<td> -->
<!-- 						<span style="float: right; margin-right: 1rem;padding-top: 0.5rem;">当前总期数：<strong id="">20</strong></span> -->
<!-- 					</td> -->
<!-- 			    </tr> -->
			    <tr>
			    	<td style="text-align:center;vertical-align:middle;">
						<button name="delRow" type="button" class="btn btn-warning">删除行</button>
			    	</td>
			    	<td>
			    		<span style="width:10%;">图片描述：</span>
			    		<input id="" name="fileDes" class="form-control" type="text" style="display: inline;width:90%;">
			    		<input id="" name="clientFile" class="file mt10" type="file">
			    	</td>
			    </tr>
			     <tr>
			    	<td style="text-align:center;vertical-align:middle;">
						<button name="delRow" type="button" class="btn btn-warning">删除行</button>
			    	</td>
			    	<td>
			    		<span style="width:10%;">图片描述：</span>
			    		<input id="" name="fileDes" class="form-control" type="text" style="display: inline;width:90%;">
			    		<input id="" name="clientFile" class="file mt10" type="file">
			    	</td>
			    </tr>
			     <tr>
			    	<td style="text-align:center;vertical-align:middle;">
						<button name="delRow" type="button" class="btn btn-warning">删除行</button>
			    	</td>
			    	<td>
			    		<span style="width:10%;">图片描述：</span>
			    		<input id="" name="fileDes" class="form-control" type="text" style="display: inline;width:90%;">
			    		<input id="" name="clientFile" class="file mt10" type="file">
			    	</td>
			    </tr>
			  </table>
				<input type="submit" value="上传文件 "/>  
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	getTotalNum();
	$("#addRow").click(function(){
		var table = $("#table");
		var tdStr='<tr><td style="text-align:center;vertical-align:middle;">';
		tdStr = tdStr + '<button name="delRow" type="button" class="btn btn-warning">删除行</button>';
		tdStr = tdStr + '</td><td><span style="width:10%;">图片描述：</span>';
		tdStr = tdStr + '<input id="" name="fileDes" class="form-control" type="text" style="display: inline;width:90%;">';
		tdStr = tdStr + '<input id="" name="clientFile" class="file mt10" type="file"></td></tr>';
		table.append(tdStr);
		getTotalNum();
		$("button[name='delRow']").click(function(){
	    	$(this).parent().parent().remove();
	    	getTotalNum();
		});
	});
	
	$("button[name='delRow']").click(function(){
    	$(this).parent().parent().remove();
    	getTotalNum();
	});
});

var getTotalNum = function(){
	$("#totalNum").text($("#table").find("tr").length-1);
}
</script>
</body>
</html>