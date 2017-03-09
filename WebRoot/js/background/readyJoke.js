$(function(){
	jQuery("#grid-table").jqGrid(
			{
				url: "getReadyJoke.html",
				datatype: "json",
				ajaxGridOptions: {contentType: 'application/json; charset=utf-8'},
				colNames:['ID','标题','作者'],
				colModel:[
				    {name:'id',index:'id', width:'33%', sortable : true,height:'30px'},
					{name:'title',index:'title', width:'33%', sortable : true,height:'30px'},
					{name:'author',index:'author', width:'33%', sortable : true,height:'30px'}
				], 
				rowNum : 10,//一页显示多少条
				rowList : [ 10, 20, 30 ],//可供用户选择一页显示多少条
				pager : '#grid-pager',//表格页脚的占位符(一般是div)的id
				sortname : 'id',//初始化的时候排序的字段
				sortorder : "desc",//排序方式,可选desc,asc
				mtype : "post",//向后台请求数据的ajax的类型。可选post,get
				viewrecords : true,
//				caption : "JSON Example"//表格的标题名字
				loadComplete : function(data) {
					var table = this;
					updatePagerIcons(table);
				}
			});
	/*创建jqGrid的操作按钮容器*/
	/*可以控制界面上增删改查的按钮是否显示*/
	$("#grid-table").parents('div.ui-jqgrid-bdiv').css({'height':10*2.6 +'rem'});
	jQuery("#grid-table").jqGrid('navGrid', '#pager2', {edit : false,add : false,del : false});
	jQuery("#grid-table").jqGrid('setGridWidth', $(".pagecontent").width());
	$("#grid-table,.ui-jqgrid-htable").css("width",$(".pagecontent").width());
	$(".ui-jqgrid-htable").find("div").css("text-align", "center");
	
//	initGridTable();
})

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