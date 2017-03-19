$(function(){
	var buttonStr = '<p style="margin-top: 5px;"><button class="btn btn-white btn-info btn-bold" style="margin-right: 4px;"><i class="ace-icon fa fa-eye bigger-120 blue"></i>预览</button>'; 
	buttonStr = buttonStr + '<button class="btn btn-white btn-default btn-bold" style="margin-right: 4px;"><i class="ace-icon fa fa-bolt bigger-120 orange"></i>下线</button>';
	buttonStr = buttonStr + '<button class="btn btn-white btn-warning btn-round"><i class="ace-icon fa fa-trash-o red2"></i>删除</button></p>';							
											
										
	jQuery("#grid-table").jqGrid({
				url: "getDeleteJoke.html",
				datatype: "json",
				ajaxGridOptions: {contentType: 'application/json; charset=utf-8'},
				colNames:['ID','标题','作者','操作'],
				colModel:[
				    {name:'id',index:'id', width:'20%', sortable : true,height:'30px'},
					{name:'title',index:'title', width:'20%', sortable : true,height:'30px'},
					{name:'author',index:'author', width:'20%', sortable : true,height:'30px'},
					{name:'myac',index:'', width:'40%', sortable:false,
						formatter : function(data,row, rowObject){
							return buttonStr;
		            	}
					}
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
	
//	initGridTable();
})

function beforeDeleteCallback(e) {
					var form = $(e[0]);
					if(form.data('styled')) return false;
					
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_delete_form(form);
					
					form.data('styled', true);
				}
				
				function beforeEditCallback(e) {
					var form = $(e[0]);
					form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
					style_edit_form(form);
				}
				
var firstList = function () {
	$('#grid-table').jqGrid('setGridParam', {
		url: webroot + "getReadyJoke.html",
		postData : jsonData,
		page:1,
		mtype: "get"
	}).trigger("reloadGrid");
}

function updatePagerIcons(table) {
		var replacement = 
		{
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

var initGridTable = function(){
	var grid_selector = "#grid-table";
	var pager_selector = "#grid-pager";
	var parent_column = $(grid_selector).closest('[class*="col-"]');
	
	$(window).on('resize.jqGrid', function () {
		var tableHeight = 0;
		if(window.screen.width <= 1366){
			tableHeight = $(window).height()-200;
		}else {
			tableHeight = $(window).height()-240;
		}
		$(grid_selector).jqGrid('setGridWidth', $(".pagecontent").width());
		console.log($(".pagecontent").width());
		$(grid_selector).parents('div.ui-jqgrid-bdiv').css({'height':'224px','min-height': tableHeight + 'px'});
    });
//	$(grid_selector).parents('div.ui-jqgrid-bdiv').css({'height':'auto','min-height': '800px'});
	
	
	$(document).on('settings.ace.jqGrid' , function(ev, event_name, collapsed) {
		if( event_name === 'sidebar_collapsed' || event_name === 'main_container_fixed' ) {
			setTimeout(function() {
				$(grid_selector).jqGrid( 'setGridWidth', parent_column.width() );
			}, 0);
		}
    })
	 
	$(grid_selector).jqGrid({
        url: "getReadyJoke.html",
		datatype: "json",
		ajaxGridOptions: {contentType: 'application/json; charset=utf-8'},
		colNames:['ID','标题','作者'],
		colModel:[
		    {name:'id',index:'id', width:'33%', sortable : true,height:'30px'},
			{name:'title',index:'title', width:'33%', sortable : true,height:'30px'},
			{name:'author',index:'author', width:'33%', sortable : true,height:'30px'}
		], 
		sortable : true,
		viewrecords : true,
		rowNum:20,
		rowList:[20,100,500,1000],
		pager : pager_selector,
		altRows: true,
		jsonReader:{
			total: 'total',
			records:'records',
			root:'rows',
			repeatitems:true
		},
		multiselect: true,
        multiboxonly: true,

		loadComplete : function(data) {
			var table = this;
			var pageNow = $(grid_selector).jqGrid('getGridParam', 'page');//当前页
			var totalPage = data.total;//总页数
			if(totalPage == 0){
				$(".ui-pg-input").val(0);
				$("td.ui-corner-all").addClass("ui-state-disabled");
			}else{
				if(pageNow > totalPage){
					var pageInfo = ($(".ui-pg-selbox").val()*(totalPage-1) + 1) + " - " + data.records + "\u3000共  " + data.records + " 条";
					if(totalPage == 1){
						$("td.ui-corner-all").addClass("ui-state-disabled");
					}
					$(".ui-pg-input").val(totalPage);
					$(grid_selector).jqGrid('setGridParam',{page:totalPage});
					$("#grid-pager_right > div").text(pageInfo);
					$("#next_grid-pager").addClass("ui-state-disabled").next().addClass("ui-state-disabled");
				}
			}
			
//			$("#jqgh_grid-table_id").css("text-align", "center");
			
			setTimeout(function(){
				updatePagerIcons(table);
			}, 0);
		}

	});
	$(window).triggerHandler('resize.jqGrid');
	function updatePagerIcons(table) {
		var replacement = 
		{
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
	
	$(document).one('ajaxloadstart.page', function(e) {
		$(grid_selector).jqGrid('GridUnload');
		$('.ui-jqdialog').remove();
	});
}