var changeState = function(state){
	var url = $("#serverPath").attr("ajaxUrl")+ "/background/doGifState.html";
	var selectedIds = $("#grid-table").jqGrid("getGridParam", "selarrrow"); //返回选中多行ids
	if(selectedIds.length < 0){
		alert("请选择一行数据");
		return;
	}
	var idList = "";
	for (var id=0;id < selectedIds.length;id++) {
		var rowData = $('#grid-table').getRowData(selectedIds[id]);
		if(id == (selectedIds.length-1)){
			idList = idList + rowData.id;
		}else{
			idList = idList + rowData.id + ",";
		}
	}
	var data = new jsonData();
	data.put("idList",idList);
	data.put("state",state);
	var dataJson = data.toJson();
	myAjax(url,dataJson,function(data){
		if(data.success){
			firstList();
			alert(data.msg);
		}else{
			alert(data.msg);
		}
	},function(){},function(){},true);
}

$(function(){
	jQuery("#grid-table").jqGrid({
				url: "getDelGif.html",
				datatype: "json",
				ajaxGridOptions: {contentType: 'application/json; charset=utf-8'},
				colNames:['ID','期数','标题','作者','创建时间','修改时间','open'],
				colModel:[
				    {name:'id',index:'id', hidden : true},
				    {name:'periods',index:'periods', width:'10%', sortable : true,height:'30px'},
					{name:'description',index:'description', width:'33%', sortable : true,height:'30px'},
					{name:'userName',index:'userName', width:'10%', sortable : true,height:'30px'},
					{name:'createDateStr',index:'createDateStr', width:'18%', sortable : true,height:'30px'},
					{name:'modifyDateStr',index:'modifyDateStr', width:'18%', sortable : true,height:'30px'},
					{name:'open',index:'open', width:'10%', sortable : true,height:'30px'}
				], 
				rowNum : 10,//一页显示多少条
				rowList : [ 10, 20, 30 ],//可供用户选择一页显示多少条
				pager : '#grid-pager',//表格页脚的占位符(一般是div)的id
				sortname : 'id',//初始化的时候排序的字段
				sortorder : "desc",//排序方式,可选desc,asc
				mtype : "get",//向后台请求数据的ajax的类型。可选post,get
				viewrecords : true,
				rownumbers:true,
				multiselect: true,
		        multiboxonly: true,
		        altRows: true,
//				caption : "JSON Example"//表格的标题名字
				loadComplete : function(data) {
					var table = this;
					updatePagerIcons(table);
				}
			});
	
	
	
	$("#grid-table").parents('div.ui-jqgrid-bdiv').css({'height':10*50 +'px'});//分页栏位置
	jQuery("#grid-table").jqGrid('navGrid', '#pager2', {edit : false,add : false,del : false});
	jQuery("#grid-table").jqGrid('setGridWidth', $(".pagecontent").width());
	$("#grid-table,.ui-jqgrid-htable").css("width",$(".pagecontent").width());
	$(".ui-jqgrid-htable").find("div").css("text-align", "center");
})
				
var firstList = function () {
	$('#grid-table').jqGrid('setGridParam', {
		url: "getDelGif.html",
		page:1,
		mtype: "get"
	}).trigger("reloadGrid");
}

function updatePagerIcons(table) {
	var replacement = {
		'ui-icon-seek-first' : 'ace-icon fa fa-angle-double-left bigger-140',
		'ui-icon-seek-prev' : 'ace-icon fa fa-angle-left bigger-140',
		'ui-icon-seek-next' : 'ace-icon fa fa-angle-right bigger-140',
		'ui-icon-seek-end' : 'ace-icon fa fa-angle-double-right bigger-140'
	};
	$('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function(){
		var icon = $(this);
		var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
		if($class in replacement) icon.attr('class', 'ui-icon '+replacement[$class]);
	})
}
