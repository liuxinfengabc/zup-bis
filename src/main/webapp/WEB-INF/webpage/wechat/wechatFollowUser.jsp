<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<base href=" <%=basePath%>">
		<title>用户使用反馈问题</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="plug-in/ace/main/css/index/searchpage.css" rel="stylesheet" type="text/css" />
	    <!-- 引入外部样式库css-->
        <jsp:include page="../include/mainHead.jsp"></jsp:include>
        <!-- 定义适应屏幕的css样式 -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <style type="text/css">
	        @media (max-width:992px){
				#validityQuery{
					margin-top:15px;
				}
				#POSITIONDEPRESS{
					margin-top:15px;
				}			
			}
			td > a{
				color:#009688!important;
			}
			thead > tr > td{
				text-align:center!important;
			}
        </style>
   </head>
   <body style="background-color:#FFFFFF; overflow-x : hidden ;">
     <div class="row">
		
		<!-- 左查询条件开始 -->
		<div class="col-sm-12 col-xs-12 col-lg-12 widget-body">
			<div class="page-header">
				<div class="col-md-6 col-xs-6 col-lg-6">
					<small><i class="icon-double-angle-right"></i>查询条件</small>
				</div>				
			</div>
			<div class="row center center-block" style="margin-top:20px;">
				<div class="container">
					<div class="row clearfix">
						<div class="col-md-12 column">
							<form class="form-horizontal" role="form">
								<div class="form-group ">
									<label class="col-xs-5 col-md-2 control-label" style="text-align: right" >公司名称：</label>
									<div class="col-xs-4 col-md-3">								
										<input id="company_NameQuery" class="form-control inputs" />
									</div>							
									<label class="col-xs-5 col-md-2 control-label" style="text-align: right">公众号：</label>
									<div class="col-xs-4 col-md-3"> 
										<select id="service_IdQuery" class="form-control inputs"></select>
									</div>
									<div class="col-md-2 col-xs-2" style=" position:absolute; right:30px; top:0px">
										<button class="btn btn-sm btn-primary" type="button" style="float:right; height:30px;" id="btnSearch"><i class="icon-ok"></i>查询</button>
									</div>									
								</div>	
								<div class="form-group ">
									<label class="col-xs-5 col-md-2 control-label" style="text-align: right">系统名称：</label>
									<div class="col-xs-4 col-md-3">								
										<select id="system_NameQuery" class="form-control inputs"></select>
									</div>
									<div class="col-md-2 col-xs-2" style=" position:absolute; right:30px; top:0px">
									</div>	
									<label class="col-xs-5 col-md-2 control-label" style="text-align: right">告警标识：</label>
									<div class="col-xs-4 col-md-3">								
										<input id="region_IdQuery" class="form-control inputs" />
									</div>
								</div>					
							</form>
						</div> 
					</div>
				</div>
			</div>
			<!-- 查询条件结束 -->
			<!-- 岗位信息datables开始 -->
			<div class="table-header">详细信息</div>
			<div class="row">
				<div class="col-md-12" style="margin-left:20px;height:30px; margin-bottom:10px; margin-top:5px;">
					<button class="btn btn-primary btn-sm" id="btnAdd">添加</button>
					<button class="btn btn-primary btn-sm" id="btnEdit">编辑</button>
					<button class="btn btn-primary btn-sm" id="btnDelete">删除</button>
				</div>
			</div>
			<div class="table-responsive">
				<table id="postTable" class="table table-striped table-bordered table-hover"  style="margin-bottom:20px;">
					<thead>
						<tr>
							<th>
								<label>
									<input type="checkbox" class="ace" id="allCheck" />
									<span class="lbl"></span>
								</label>
							</th>
							<th>
								公司名称
							</th>
							<th>
								公众号名称
							</th>
							<th>
								系统名称
							</th>
							<th>
								系统地址
							</th>
							<th>
								告警标识
							</th>
							<th>
								标识类型
							</th>
							<th>
								图片地址
							</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<!-- datables结束 -->
	</div>
	
	<!--弹出框放置位置  添加 删除  查看详情-->
    <div id="fromEdit" class="hide">
    	<div class="container">
			<div class="row clearfix">
				<div class="col-md-12 column">
					<form class="form-horizontal" role="form">
						<div class="form-group">
    						 <strong class="col-xs-12 col-md-3 control-label" style="text-align: left" >公司名称：</strong>
							<div class="col-xs-12 col-md-8">
							    <input class="form-control" id="company_Name" type="text" />
							</div>
							<div class="col-xs-12 col-md-1">
								<font color=red>*</font>
							</div>
						</div> 
    					<div class="form-group">
    						<strong class="col-xs-12 col-md-3 control-label" style="text-align: left" >公众号：</strong>
							<div class="col-xs-12 col-md-8">
								<select id="service_Name" class="form-control" >
					            </select>
							</div>
							<div class="col-xs-12 col-md-1">
								<font color=red>*</font>
							</div>
						</div> 
						<div class="form-group">
    						<strong for="system_Name" class="col-xs-12 col-md-3 control-label" style="text-align: left" >所属系统：</strong>
							<div class="col-xs-12 col-md-8">
								<select id="system_Name" class="form-control" >
					            </select>
							</div>
							<div class="col-xs-12 col-md-1">
								<font color=red>*</font>
							</div>
						</div> 
						<div class="form-group">
							 <strong class="col-xs-12 col-md-3 control-label" style="text-align: left" >系统地址 ：</strong>
							<div class="col-xs-12 col-md-8"> 
					            <input class="form-control" id="system_Url" type="text" />
							</div>
						</div>
  						<div class="form-group">
    						 <strong for="region_Id" class="col-xs-12 col-md-3 control-label" style="text-align: left" >告警标识：</strong>
							<div class="col-xs-12 col-md-8">
								<input class="form-control" id="region_Id" type="text" />
							</div>
							<div class="col-xs-12 col-md-1">
								<font color=red>*</font>
							</div>
						</div>
						<div class="form-group">
    						 <strong for="region_Id" class="col-xs-12 col-md-3 control-label" style="text-align: left" >标识类型：</strong>
							<div class="col-xs-12 col-md-8">
								<input class="form-control" id="region_Type" type="text" />
							</div>
							<div class="col-xs-12 col-md-1">
								<font color=red>*</font>
							</div>
						</div>  
						<div class="form-group">
    						 <strong for="img_Url" class="col-xs-12 col-md-3 control-label" style="text-align: left" >图片地址：</strong>
							<div class="col-xs-12 col-md-8">
								<input class="form-control" id="img_Url" type="text" />
							</div>
							<div class="col-xs-12 col-md-1">
								<font color=red>*</font>
							</div>
						</div> 
        			</form>
				</div> 
			</div>
		</div> 
	</div>
    
    <!--  引入js存放的外部脚本库  -->
    <jsp:include page="../include/mainFooter.jsp"></jsp:include>
	
   	<!-- 加载datables表数据js -->
   	<script type="text/javascript">
        //封装请求参数
        var param = {};
   		$(document).ready(function () {
   			//日期控件js
   			dateDom();
   			loadTableData();
   			loadService();
   		});
   		function loadService(){
   			//获取公众号
	        $.ajax({
	            type: "POST",
	            url: "rest/wechat/wechatSystemController/getAllService", 
	            cache: false,  //禁用缓存
	            dataType: "json",
	            success: function (result) {
	       			$("#service_Name").html(""); 
	       			$("#service_IdQuery").html(""); 
	       			$("#service_IdQuery").html("<option value='0'>全部</option>");
	            	for(var i=0;i<result.data.length;i++){
	             		$("#service_Name").append("<option value='"+result.data[i].service_ID+"'>"+result.data[i].service_Name+"</option>");
	             		$("#service_IdQuery").append("<option value='"+result.data[i].service_ID+"'>"+result.data[i].service_Name+"</option>");
	            	}
	            },
	            error:function(){	            	
	            }
	        });

	      //获取系统名称
	        $.ajax({
	            type: "POST",
	            url: "rest/workflow/workPersonal/SystemName", 
	            cache: false,  //禁用缓存
	            dataType: "json",
	            success: function (result) {
	       			$("#system_NameQuery").html(""); 
	       			$("#system_NameQuery").html("<option value='0'>全部</option>");
	       			$("#system_Name").html(""); 
	            	for(var i=0;i<result.system.length;i++){
	             		$("#system_NameQuery").append("<option value='"+result.system[i].systemId+"'>"+result.system[i].systemName+"</option>");
	             		$("#system_Name").append("<option value='"+result.system[i].systemId+"'>"+result.system[i].systemName+"</option>");
	            	}
	            },
	            error:function(){	            	
	            }
	        });



		}
	    function loadTableData(){
    		//提示信息
	        var lang = {
	            "sProcessing": "处理中...",
	            "sLengthMenu": "每页 _MENU_ 项",
	            "sZeroRecords": "没有匹配结果",
	            "sInfo": "当前第 _START_ 至 _END_ 项，共 _TOTAL_ 项。",
	            "sInfoEmpty": "当前显示第 0 至 0 项，共 0 项",
	            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
	            "sInfoPostFix": "",
	            "sSearch": "搜索:",
	            "sUrl": "",
	            "sEmptyTable": "表中数据为空",
	            "sLoadingRecords": "载入中...",
	            "sInfoThousands": ",",
	            "oPaginate": {
	                "sFirst": "首页",
	                "sPrevious": "上页",
	                "sNext": "下页",
	                "sLast": "末页",
	                "sJump": "跳转"
	            },
	            "oAria": {
	                "sSortAscending": ": 以升序排列此列",
	                "sSortDescending": ": 以降序排列此列"
	            }
	        };   
	        var state = 0;
    		//初始化表格
        	var table = $("#postTable").dataTable({
        	    "dom": '<t><"row"<"col-md-2"l><"col-md-4"i><"col-md-6"p>>',    //为表格元素书写css样式<t>为中间表格  在<t>右边就是在表格下边
           		language:lang,  //提示信息
            	stripeClasses: ["odd", "even"],  //为奇偶行加上样式，兼容不支持CSS伪类的场合
	            serverSide: true,  //启用服务器端分页
	            searching: false,  //禁用原生搜索
	            bAutoWidth:true, //自适应宽度 
	            bDestroy:true,//重新加载使用
	            renderer: "bootstrap",  //渲染样式：Bootstrap和jquery-ui
	            pagingType: "full_numbers",  //分页样式：simple,simple_numbers,full,full_numbers
	            ordering:false,
	            ajax: function (data, callback, settings) {
					if($("#company_NameQuery").val() != ""){
						 param.company_Name = $("#company_NameQuery").val();
					}else{
						 delete param.company_Name;
					}
					if($("#service_IdQuery").val() != 0){
						param.service_ID = $("#service_IdQuery").val();
					}else{
						delete param.service_ID;
					}
					if($("#system_NameQuery").val() != 0){
						param.system_Id = $("#system_NameQuery").val();
					}else{
						delete param.system_Id;
					}
					if($("#region_IdQuery").val() != ""){
						param.region_Id = $("#region_IdQuery").val();
					}else{
						delete param.region_Id;
					}
					
					
	                param.rows = data.length;//页面显示记录条数，在页面显示每页显示多少项的时候
	                param.start = data.start;//开始的记录序号
	                param.page = (data.start / data.length)+1;//当前页码
	                //console.log(param);
	                //ajax请求数据
	                $.ajax({
	                    type: "POST",
	                    url: "rest/wechat/wechatSystemController/getweChatSystemList",
	                    cache: false,  //禁用缓存
	                    data: param,  //传入组装的参数
	                    dataType: "json",
	                    success: function (result) {
	                        setTimeout(function () {
	                            //封装返回数据
	                            var returnData = {};
	                            returnData.draw = data.draw;//这里直接自行返回了draw计数器,应该由后台返回
	                            returnData.recordsTotal = result.total;//返回数据全部记录
	                            returnData.recordsFiltered = result.total;//后台不实现过滤功能，每次查询均视作全部结果
	                            returnData.data = result.data;//返回的数据列表
	                            callback(returnData);
	                        }, 200);
	                    }
	                });
            	},
            	columnDefs: [
                    {
				    	"targets": [0], // 目标列位置，下标从0开始
				        "data": "company_Id", // 数据列名
				        "orderable":false,
				        "sWidth":"5px",
				        "render": function(data, type, full) { // 返回自定义内容
				       		return "<label><input type='checkbox' class='ace' id='service_ID' value = '" + data + "' /><span class='lbl' id='service_ID' value = '" + data + "'></span></label>";
				         }
                    },
                    {
					   	"targets": [1], // 目标列位置，下标从0开始
					   	"sWidth":"15%",
					   	"data": "company_Name" // 数据列名
                    },
                    {
					  	"targets": [2], // 目标列位置，下标从0开始
					  	"sWidth":"15%",
					   	"data": "service_Name"
                    },
                      {
					  	"targets": [3], // 目标列位置，下标从0开始
					  	"sWidth":"15%",
					   	"data": "system_Name"
                    },
                    {
					   	"targets": [4], // 目标列位置，下标从0开始
					   	"sWidth":"18%",
					   	"data": "system_Url" // 数据列名
                    },
                    {
					   	"targets": [5], // 目标列位置，下标从0开始
					   	"sWidth":"12%",
					   	"data": "region_Id" // 数据列名
                    },
                    {
					   	"targets": [6], // 目标列位置，下标从0开始
					   	"sWidth":"12%",
					   	"data": "region_Type" // 数据列名
                    },
                    {
					   	"targets": [7], // 目标列位置，下标从0开始
					   	"sWidth":"15%",
					   	"data": "img_Url" // 数据列名
                    }
	            ]
	        }).api();
	        //此处需调用api()方法,否则返回的是JQuery对象而不是DataTables的API对象
		    }
			//搜索按钮
	    	$("#btnSearch").click(function(){
	    		loadTableData();
	    	});
	    	
	    	//复选框全选
			$("#allCheck").on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		$.widget("ui.dialog", $.extend({}, $.ui.dialog.prototype, {
			_title: function(title) {
				var $title = this.options.title || '&nbsp;'
				if( ("title_html" in this.options) && this.options.title_html == true )
					title.html($title);
				else title.text($title);
			}
		}));
		var thisid = null;
		
		//日期控件js
   		function dateDom(){
   			$.datepicker.regional['zh-CN'] = { 
			  clearText: '清除', 
			  clearStatus: '清除已选日期', 
			  closeText: '关闭', 
			  closeStatus: '不改变当前选择', 
			  prevText: '<上月', 
			  prevStatus: '显示上月', 
			  prevBigText: '<<', 
			  prevBigStatus: '显示上一年', 
			  nextText: '下月>', 
			  nextStatus: '显示下月', 
			  nextBigText: '>>', 
			  nextBigStatus: '显示下一年', 
			  currentText: '今天', 
			  currentStatus: '显示本月', 
			  monthNames: ['一月','二月','三月','四月','五月','六月', '七月','八月','九月','十月','十一月','十二月'], 
			  monthNamesShort: ['一','二','三','四','五','六', '七','八','九','十','十一','十二'], 
			  monthStatus: '选择月份', 
			  yearStatus: '选择年份', 
			  weekHeader: '周', 
			  weekStatus: '年内周次', 
			  dayNames: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六'], 
			  dayNamesShort: ['周日','周一','周二','周三','周四','周五','周六'], 
			  dayNamesMin: ['日','一','二','三','四','五','六'], 
			  dayStatus: '设置 DD 为一周起始', 
			  dateStatus: '选择 m月 d日, DD', 
			  dateFormat: 'yy-mm-dd', 
			  firstDay: 1, 
			  initStatus: '请选择日期', 
			  isRTL: false};
			$.datepicker.setDefaults($.datepicker.regional['zh-CN']);
   			//日期框
			$('.date-picker').datepicker({
                language: 'zh-CN',
                autoclose: true,
                todayHighlight: true
            })
   		}
   		
   		
   		$("#btnAdd").on('click', function(e) {
			$("#system_Url").val('');
			$("#region_Id").val("");
			$("#region_Type").val("");
			$("#img_Url").val('');
			$("#company_Name").val('');	
			
			msgDialog(e, this.id);
		});
		
		$( "#btnEdit" ).on('click', function(e) {
			if($("#service_ID:checked").length>1){
				parent.bootbox.alert("只能选择一个公众号进行编辑", function(){});
	        	return;
			}else{
				par.service_ID = $("#service_ID:checked").val();
				if(par.service_ID == null || par.service_ID == ""){
					parent.bootbox.alert("请先选择要编辑的公众号", function(){});
					return;
				}else{
					lookWS(par);
					msgDialog(e, this.id);
				}
			}
			
		});
		
		$( "#btnDelete" ).on('click', function(e) {
			if($("#service_ID:checked").length <= 0){
				parent.bootbox.alert("请先选择要删除的公众号", function(){});
				return;
			}else{
				delWS();
			}
		});
		
		var par = {};   //声明ajax传输参数的数组变量
		function msgDialog(e, thisid){
			e.preventDefault();
				var dialog = $( "#fromEdit" ).removeClass('hide').dialog({
					modal: true,
					width:450,
					title: "<div class='widget-header widget-header-small'><h4 class='smaller'><i class='icon-ok'></i>微信公众号管理操作</h4></div>",
					title_html: true,
					buttons: [ 
						{
							text: "取消",
							"class" : "btn btn-xs",
							click: function() {
								$( this ).dialog( "close" );
							} 
						},
						{
							text: "保存",
							"class" : "btn btn-primary btn-xs",
							click: function() {
								if(thisid == "btnAdd"){
									par.service_ID = $("#service_Name").val();	
									par.company_Name = $("#company_Name").val();	
									par.system_Id = $("#system_Name").val();	
									par.system_Url = $("#system_Url").val();	
									par.region_Id = $("#region_Id").val();
									par.region_Type = $("#region_Type").val();		
									par.img_Url = $("#img_Url").val();	
									addWS(par);
								}
								if(thisid == "btnEdit"){
									par.service_ID = $("#service_Name").val();	
									par.company_Name = $("#company_Name").val();	
									par.system_Id = $("#system_Name").val();	
									par.system_Url = $("#system_Url").val();	
									par.region_Id = $("#region_Id").val();
									par.region_Type = $("#region_Type").val();	
									par.img_Url = $("#img_Url").val();
									editWS(par);
								}
							} 
						}
					]
				});
		}
		
		//添加岗位信息
		function addWS(par){	
			console.log(par);
			if(par.company_Name == null|| par.company_Name == ""){
				parent.bootbox.alert("公司不能为空" , function(){});
				return;
			}else if(par.system_Url == null|| par.system_Url==""){
				parent.bootbox.alert("系统url不能为空" , function(){});
				return;
			}else if(par.region_Id == null|| par.region_Id==""){
				parent.bootbox.alert("告警标识不能为空" , function(){});
				return;
			}else if(par.region_Type == null|| par.region_Type==""){
				parent.bootbox.alert("标识类型不能为空" , function(){});
				return;
			}else{
				$.ajax({
      	            url: 'rest/wechat/wechatSystemController/addWechatSystem',
      	            data: par,
      	            type: 'POST',
      	            dataType: 'json',
      	            success: function (result) {
      	            	if(result.data=="1"){
   	                		parent.bootbox.alert("添加成功", function(){
	   	                		$( "#fromEdit" ).dialog( "close" ); 
	 	                		loadTableData();
	 	                	});
	                	}else{
	                		parent.bootbox.alert("添加失败", function(){});
	                	}
    	            },
    	            error: function(){
    	               parent.bootbox.alert("系统错误！添加微信公司异常，请刷新重新添加", function(){});
    	            }
    	        });
    	    }
		}

		//添加岗位信息
		function editWS(par){	
			console.log(par);
			par.company_Id = $("#service_ID:checked").val();
			if(par.company_Name == null|| par.company_Name == ""){
				parent.bootbox.alert("公司不能为空" , function(){});
				return;
			}else if(par.system_Url == null|| par.system_Url==""){
				parent.bootbox.alert("系统url不能为空" , function(){});
				return;
			}else if(par.region_Id == null|| par.region_Id==""){
				parent.bootbox.alert("告警标识不能为空" , function(){});
				return;
			}else if(par.region_Type == null|| par.region_Type==""){
				parent.bootbox.alert("标识类型不能为空" , function(){});
				return;
			}else{
				$.ajax({
      	            url: 'rest/wechat/wechatSystemController/editWechatSystem',
      	            data: par,
      	            type: 'POST',
      	            dataType: 'json',
      	            success: function (result) {
      	            	if(result.data=="1"){
   	                		parent.bootbox.alert("修改成功", function(){
	   	                		$( "#fromEdit" ).dialog( "close" ); 
	 	                		loadTableData();
	 	                	});
	                	}else{
	                		parent.bootbox.alert("修改失败", function(){});
	                	}
    	            },
    	            error: function(){
    	               parent.bootbox.alert("系统错误！添加微信公司异常，请刷新重新添加", function(){});
    	            }
    	        });
    	    }
		}
		
		
			//删除公众号信息
			function delWS(){
				par.actionIds = [];
				parent.bootbox.confirm("你确定要删除公司吗？", function(result) {
				if(result){
					for(var i=0; i<$("#service_ID:checked").length;i++){
						par.actionIds[i] = $("#service_ID:checked")[i].defaultValue;
						if(par.actionIds.length < 1){
							parent.bootbox.alert("请先选择要删除的公司号", function(){});
							return;
						}
		   	        }
		   	        $.ajax({
	    	            url: 'rest/wechat/wechatSystemController/delWechatSystem',
	    	            async: false,
	    	            data: par,
	    	            type: 'POST',
	    	            dataType: 'json',
	    	            success: function (result) {
    	                	parent.bootbox.alert("删除公司成功", function(){});
    	                	loadTableData();
	    	            },
	    	            error: function(){
	    	            	parent.bootbox.alert("该公司已被引用，不允许删除", function(){});
	    	            }
		   	        });
		   	       loadTableData();
				}else{
					return;
				}
			});
		}

		function lookWS(par){
			par = {};
			par.company_Id = $("#service_ID:checked").val();
			$.ajax({
	            url: 'rest/wechat/wechatSystemController/getWechatSystem',
	            async: false,
	            data: par,
	            type: 'POST',
	            dataType: 'json',
	            success: function (result) {
					$("#company_Name").val(result.data.company_Name);	
					 $("#service_Name").val(result.data.service_ID);	
					 $("#system_Name").val(result.data.system_Id);	
					 $("#system_Url").val(result.data.system_Url);	
					 $("#region_Id").val(result.data.region_Id);
					 $("#region_Type").val(result.data.region_Type);	
					 $("#img_Url").val(result.data.img_Url);
	            },
	            error: function(){
	            	parent.bootbox.alert("获取数据失败", function(){});
	            }
   	        });
		}
	</script>
  </body>
</html>

