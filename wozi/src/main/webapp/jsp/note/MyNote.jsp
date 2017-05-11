<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的笔记首页</title>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<%--   		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/note/jstree.css" /> --%>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/swet/sweetalert.css" >
	<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css" /> 
	<!-- jqContext begin -->
    <link href="<%=request.getContextPath()%>/plugins/jqContextMenu/src/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/plugins/jqContextMenu/screen.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/plugins/jqContextMenu/prettify/prettify.sunburst.css" rel="stylesheet" type="text/css" />
<style>
	.container-fluid {
    background: #337ab7;
    border-bottom: 1px dotted white;
}
	.navbar{
		margin-bottom: 0px;
		border: 0;
	}
	.navbar-default .navbar-brand {
    color: #fff;
}
	input[type=text], input[type=password]:focus {
    -webkit-appearance: none;
}
.zu-top-search-input {
    padding: 7px 50px 7px 10px;
    width: 100%;
    color: #49525c;
    font-size: 14px;
    line-height: 17px;
    background-color: #e1eaf2;
    border: 1px solid #045bb2;
    border-radius: 4px;
    box-shadow: inset 0 1px 3px rgba(0,0,0,.2), 0 1px 0 rgba(255,255,255,.1);
    outline: 0;
    box-sizing: border-box;
    -webkit-transition: all .2s ease-in-out;
    transition: all .2s ease-in-out;
}
.zu-top-search-form .zu-top-search-button {
    position: absolute;
    top: 0;
    right: 0;
    width: 40px;
    height: 100%;
    background: #0e78e7;
    background: -webkit-linear-gradient(top,#0e7bef,#0d73da);
    background: linear-gradient(to bottom,#0e7bef,#0d73da);
    border: 1px solid #045bb2;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    box-shadow: 0 1px 2px rgba(0,0,0,.05), inset 0 1px 1px rgba(255,255,255,.15);
    box-sizing: border-box;
    outline: 0;
    cursor: pointer;
}
	.sprite-global-icon-magnifier-dark {
    background-position: -82px 0;
    width: 15px;
    height: 15px;
}
	button {
    padding: 0;
    line-height: 1.7;
}
	.btn-search {
    color: #fff;
    background-color: #0d73da;
    border-color: #0d73da;
}
	.navbar-form {
    border-color: #e7e7e7;
    margin-left: 66px;
}
	.navbar-btn {
    margin-top: 8px;
    margin-bottom: 8px;
    margin-right: 35px;
    background: #337ab7;
    border: 1px solid #337ab7;
    color:#fff;
}
	.btn-primary:hover {
    	color: #fff;
    	/* background-color: #286090; */
   		border-color: #0d73da;
}
	.searchMirror{
		top: 7px;
    	padding-left: 5px;
	}
	
	.searchMirror:hover{
		background:gray;
	}
	
	/*笔记目录*/
	.note-menu {
    	width: 15%;
    	float:left;
        height: 500px;
        border-radius:0;
    }
    /*笔记列表*/
    .note-list{
    	width:20%;
    	float:left;
        height: 500px;
        border-radius:0;
    }
    /*笔记编辑栏*/
    .note-main{
    	width:65%;
    	float:left;
        height: 500px;
        border-radius:0;
    }
    /* 去掉圆角 */
    .panel-heading{
    	border-top-left-radius: 0;
    	border-top-right-radius: 0;
    }
    /* 面板padding */
    .panel-body{
    	padding: 0;
    }
    /* 目录面板 为了y轴上可滑动 */
    .panel-menu{
    	padding: 4px;
    	height: 460px;
    	overflow-y:scroll;
    }
    #menu_list {
    	padding: 4px;
    	height: 460px;
    	overflow-y:scroll;
    }
    #menu_list>div{
   		width: 100%;
    	height: 81px;
    	border-bottom: 1px solid #f0f0f0;
    	padding-top: 27px;
    	padding-left:18px;
    }
    #menu_list>div>i>span{
    	color:#337ab7;
    }
    .note-create{
    	    padding: 0px 0px 0px 0;
		    font-size: 9px;
		    line-height: 1.5;
		    border-radius: 3px;
		    /* margin-left: 43px; */
		    margin-left: 146px;
    }
    <!-- 搜索框 -->
    .zu-top-search-input:focus {
    	background:white;
    }
    .note-save{
    		padding: 0px 0px 0px 0;
		    font-size: 9px;
		    line-height: 1.5;
		    border-radius: 3px;
    }
    .note-title{
    	width: 320px;
	    height: 16px;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #555;
	    background-color: #fff;
	    background-image: none;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    display: inline;
    }
    div.main{
    	height:100%;
    	width:100%;
    	padding-left:0;
    	padding-right:0;
    	padding-bottom:0;
    }
    .bg{
	    display:none;
	    position:fixed;
	    width:100%;
	    height:100%;
	    background:white;
	    z-index:9999;
	    top:0;
	    left:0;
	    opacity:1;
    }
	</style>
</head>
<body>
<div class="bg">

	 <table id="example"> 
   	 	<thead> 
     		<tr> 
     			<th></th> 
      			<th>名称</th>
      			<th></th>
     		</tr> 
    	</thead> 
    	<tbody></tbody> 
    <!-- tbody是必须的 --> 
   	</table> 
	
</div>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
    <div class="navbar-header">
        <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>我知笔记</strong></a>
    </div>
       <div>
       		<form method="GET" class="navbar-form navbar-left zu-top-search-form" role="search" id="zh-top-search-form">
            	<div class="form-group">
               		<input type="text" class="zu-top-search-input" id="q" name="q" autocomplete="off" value="" maxlength="100" placeholder="搜索你的笔记..." role="combobox" aria-autocomplete="list">
            	</div>
            		<span class="searchMirror glyphicon glyphicon-zoom-in" style="color: rgb(255, 255, 255);font-size: 20px;background:#337ab7;">S</span>
        	</form>
    	</div>
        <!--向右对齐-->
        <div class="nav navbar-nav navbar-right">
         	<button type="button" class="btn btn-default navbar-btn  user-btn">
         		<img id="headPic" class="img-rounded" height='35px' width='35px' src=""/>
         	</button>
        </div>
    </div>
</nav>

<div class="container main">
<!-- 侧边栏开始 -->
	<div class="panel panel-primary note-menu">
		<div class="panel-heading">
				<h3 class="panel-title"><span>笔记目录</span></h3>
		</div>
		<div class="panel-body panel-menu">
			<div id="jstree">
			<!-- 笔记目录侧边栏 -->
			</div>
		</div>
</div>
<!-- 侧边栏结束 -->
<!-- 笔记列表开始-->
	<div class="panel panel-primary note-list">
		<div class="panel-heading">
			<h3 class="panel-title"><span>笔记列表</span><span><button type="button" class="btn note-create btn-info">new!</button></span></h3>
		</div>
		<div class="panel-body">
			<div id="menu_list">
			<!-- 笔记目录列表栏 -->
			</div>
		</div>
	</div>
<!-- 笔记列表结束 -->
<!-- 笔记编辑主体开始-->
	<div class="panel panel-primary note-main">
		<div class="panel-heading">
			<h3 class="panel-title"><span>笔记编辑主体</span><span>
				<!-- 标题框 -->
				<input type="text" class="form-control note-title" placeholder="请输入标题"/>
				</span><span><button type="button" class="btn note-save btn-info">save!</button></span>
			</h3>
		</div>
		<div class="panel-body">
			 <script id="editor" type="text/plain" style="width:100%;height:100%;"></script>
		</div>
	</div>
<!-- 笔记编辑主体结束 -->
</div>
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script><!-- 版本不能太高 -->
<script src="<%=request.getContextPath()%>/plugins/jqContextMenu/src/jquery.ui.position.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/plugins/jqContextMenu/src/jquery.contextMenu.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/plugins/jqContextMenu/screen.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/plugins/jqContextMenu/prettify/prettify.js" type="text/javascript"></script>
<!-- jqContext end -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert-dev.js"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<%-- <script src="<%=request.getContextPath()%>/plugins/js/jstree.js"></script> --%>
<script type="text/javascript" charset="utf-8" src="../../ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../../ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8" src="../../lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../../plugins/js/common.js"></script>
<script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js"></script> 
<script type="text/javascript" language="javascript" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>
<script>

	var params = window.location.search;
// 	var paramObj = handleSearchParams(params);
	var currentMenuId;//声明一个全局变量来保存每个操作当前目录的Id
	var menuId;//声明一个全局变量来保存每一个笔记的Id
	var currentNoteId = "";//保存当前编辑的笔记
	var id = null;//保存用户的Id
	
	var t = null;//用来存在datatables数据
	var rowData = null;//用来存放balabala

	$("a.navbar-brand").hover(function(){
		//覆盖掉移动到该文字上面的默认样式
		$(this).css("color","#fff");
	});
	
	function addNoteHover() {
		$("#menu_list>div").hover(function(){
			$(this).css("background","lightblue");
		},function(){
			$(this).css("background","white");
		});
	}
	
	$(function () {
		//取得用户目录json格式数据
		getMenu();
		findNode();
		addDel();
		initSearch();//搜索功能
		getCurrentName();
		getPic();
	  });
	
	//点击用户名称跳转到用户信息详情页面
	$(document).on("click","button.user-btn", function(){
		window.location.href = "<%=request.getContextPath()%>/jsp/user/zone.jsp";
	});
	
	//点击目录获取该目录下的笔记列表
	function getNoteListByMenu(menuId) {
		$.ajax({
			url:"<%=request.getContextPath()%>/menuController/listNote",
			data:{
				"currentMenuNodeId":menuId,
			},
			success:function(rs){
					var divs = $("#menu_list>div");
					if(divs.length>0){
						divs.remove();
					}
					var strLine = "";
					$.each(rs, function(i,c){
						var time = c.create_time;//
						strLine+='<div><i><span id='+c.id+' class="glyphicon glyphicon-list-alt">&nbsp;</span></i><span>'+c.title+'...</span><span style="display:block;color:#8c8c8c;margin-top: 4px;font-size: 12px;line-height: 1.35;">'+time+'</span></div>';
					});
					$("#menu_list").append(strLine);
					addNoteHover();
			}
		});
	}
	
	//创建目录节点
	function createMenuNode(parnetId,newNodeId){
		$.ajax({
			url:"<%=request.getContextPath()%>/menuController/add",
			type:"post",
			data:{"directMenuParentId":parnetId,"newNodeId":newNodeId},
			dataType:"json",
			success:function(rs){
				swal({
					  title: "Good job!",
					  text: "创建目录成功!",
					  timer: 1000,
					  showConfirmButton: false
					});
			},
			fail:function(){
				swal("Ohh!", "创建目录失败!", "error")
			}
		});
	}
	
	//修改节点名称
	function reNameMenuNode(currentMenuId, newTextName) {
		if(Array.isArray(currentMenuId)){
			currentMenuId = currentMenuId[0];
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/menuController/reName",
			dataType:"json",
			data:{
				"currentMenuNodeId":currentMenuId,//currentMenuNodeId
				"newTextName":newTextName,
			},
			success:function(rs) {
				//pass
			},
			fail:function(){
				swal("Ohh!", "系统故障!", "error");
			}
		});
	}
	
	function delMenu(currentMenuId) {
		swal({
			  title: "你确定删除该目录以及目录下所有的笔记吗?",
			  text: "删除操作执行后将无法恢复!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "是的!我确定",
			  cancelButtonText: "不,我取消",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
				if(isConfirm){
					$.ajax({
						url:"<%=request.getContextPath()%>/menuController/del",
						data:{
							"currentMenuNodeId":currentMenuId,
						},
						dataType:"json",
						success:function(rs){
							if(rs.isSuccess){
								swal("删除目录成功!", "共删除了该目录下"+rs.impact+"条日记", "success");
								var divs = $("#menu_list>div");
								if(divs.length>0){
									divs.remove();
								}
							}else{
								swal("删除目录失败!", rs.msg, "error");
							}
						},
						fail:function(){
							swal("Ohh!", "系统故障!", "error");
						},
					});
				}else{
					swal("Cancelled", "Your imaginary file is safe :)", "error");
		
				}
				
			});
	}
	
	//创建笔记
	$(document).on("click",".note-create", function(){
		currentNoteId = "";
		if(typeof currentMenuId ==="undefined"){
			swal({
				  title: "请选择目录",
				  text: "请选择需要创建笔记的目录",
				  timer: 1000,
				  showConfirmButton: false
				});
		}else {
			var str = '<div><i><span class="glyphicon glyphicon-list-alt">&nbsp;</span></i><span>标题1</span><span style="display:block;color:#8c8c8c;margin-top: 4px;font-size: 12px;line-height: 1.35;">时间标签</span></div>';
			$("#menu_list").prepend(str);
			$("#menu_list>div:eq(0)").css("height","0").css("background","#fff").animate({height:"81px"}, 500 ,"swing",function(){
			});
			initUE();
			//旧内容清空
			$("input.note-title").val("");
			UE.getEditor('editor').setContent("");
		}
	});
	
	$(document).on("click",".note-save", function(){
		var htmlContent = UE.getEditor('editor').getAllHtml();
		
		var tbWoZiNotePO = {};
		tbWoZiNotePO.content = htmlContent;
		tbWoZiNotePO.id = currentNoteId;
		tbWoZiNotePO.refMenu = menuId;
		tbWoZiNotePO.title = $("input.note-title").val();
		
		//有bug 
		$.ajax({
			url:"<%=request.getContextPath()%>/noteController/add",
			type:"post",
			data:{
				"tbWoZiNotePOStr":JSON.stringify(tbWoZiNotePO),
			},
			dataType:"json",
			success:function(rs){
				if(rs.isSuccess) {
					getNoteListByMenu(currentMenuId);
// 					UE.getEditor('editor').setDisabled('fullscreen');
					if(rs.isUpdate){
						swal({
							  title: "修改成功!",
							  text: "笔记修改成功",
							  timer: 1000,
							  showConfirmButton: false
							});
					}else{
						swal({
							  title: "添加成功!",
							  text: "笔记添加成功.",
							  timer: 1000,
							  showConfirmButton: false
							});
					}
				}
			},
		});
	});
	
	//点击具体笔记
	$(document).on("click","#menu_list>div",function(){
		//alert($(this).find("span").attr("id"));
		currentNoteId = $(this).find("span").attr("id");
		$.ajax({
			url:"<%=request.getContextPath()%>/noteController/find",
			dataType:"json",
			data:{
				"currentNoteId":$(this).find("span").attr("id"),
			},
			success:function(rs){
					initUE(function(){
						UE.getEditor('editor').setEnabled();
						UE.getEditor('editor').setContent("");
						UE.getEditor('editor').execCommand('insertHtml', rs.content);
						$(".note-title").val(rs.title);
						
						//当前目录的改变
						menuId = rs.menu_id;
						currentNoteId = rs.id;
					});
			}
		});
	});
	
	function findNode(){
		//查找笔记
		$(document).on(".zu-top-search-input","keyup", function(){
		});
	}
	
	function getMenu() {
		$.ajax({
			url:"<%=request.getContextPath()%>/menuController/findMenu",
			dataType:"json",
			success:function(rs) {
				 $('#jstree').jstree({
				    	"core": {
				    			"data": rs,
				    		  	"check_callback" : true,
				    		  	//"multiple" : true,
				    		    //"animation" : 1,
				    		  	"massload" : {
				    		    "url" : "/some/path",
				    		    "data" : function (nodes) {
				    		        return { "ids" : nodes.join(",") };
				    		      },
				    		      "themes":{
				    		    	  "stripes" : true,
				    		      }
				    		    },
				    	 },
				    	 		"checkbox" : {
				    	      	"keep_selected_style" : false
				    	    },
				    	    	"plugins" :  [
				    	    	//"checkbox",
				    	    	"contextmenu",//右键菜单
				    	    	//"dnd", //可移动
				    	    	//"massload",
				    	    	//"search",
				    	    	//"sort",
				    	    	"state",//节点展开状态
				    	    	"types",
				    	    	//"unique",
				    	    	"wholerow", //全行
				    	    	"changed",
				    	    	"conditionalselect",
				    	    ],
				    })
				    .bind("create_node.jstree", function(data, e){//创建新目录节点
				    	e.node.text = "newNode";//新创建节点的默认名称
				    	var id = randomId();
						createMenuNode(e.parent, e.node.id);//e.node.id为自动生成的id
						currentMenuId = e.node.id;
					})
					.bind("rename_node.jstree", function(data, e){//修改节点名称
						reNameMenuNode(currentMenuId, e.text);
						//document.location.reload();//当前页面 解决一个问题的暂时方法 2016-12-19
					})
					.bind("delete_node.jstree", function(data, e){//delete_node
						delMenu(e.node.id);
						currentMenuId = undefined;
					})
					.bind("select_node.jstree", function (e, data) {
				        currentMenuId = data.node.id;//保存当前选中的目录id
				        menuId = data.node.id;
				        getNoteListByMenu(currentMenuId);
				    });
			}
		});
	}
	
	function initUE(callback) {
		UE.getEditor('editor',{
			"initialFrameHeight":380, //初始化高度
			"initialContent":"",
			"maximumWords":9999,
			"autoHeightEnabled":false,//关闭自动增高
			"toolbars":[[ //按需要加载
	            'fullscreen', 'source', '|', 'undo', 'redo', '|',
	            'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
	            'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
	            'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
	            'directionalityltr', 'directionalityrtl', 'indent', '|',
	            'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
	            'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
	            'simpleupload', 'insertimage', 'emotion', 'scrawl', '', '', 'attachment', 'map', '', '', 'insertcode', '', 'pagebreak', 'template', 'background', '|',
	            'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
	            'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
	            'print', 'preview', 'searchreplace', 'drafts', 'help'
	        ]],
		});//初始化编辑器
		setTimeout(callback,100)//执行回调
	}
	
	//create right click menu
    function addDel(){
    	$.contextMenu({
            selector: '#menu_list>div', 
            callback: function(key, options) {//应该是根据key值或options值来确定是哪个item
            	var nodeId = $(this).find("i>span").attr("id");
            	if(key==="delete"){
                   $.ajax({
                   	url: "<%=request.getContextPath()%>/noteController/del",
                   	dataType:"json",
                   	data:{"currentNoteId":nodeId},
                   	success:function(rs){
                   			getNoteListByMenu(currentMenuId);//重新加载日记列表
                   	}
                   });
               }else if(key === "share"){//这里应该做成弹窗的形势
            	   //这里用来做分享
            	   loadPeople();
               }
            },
            items: {
                "delete": {name: "删除", icon: "delete"},
                "share":{name:"分享",icon:""},
            }
        });
	}
	
	
	function initSearch(){
		$(".searchMirror ").on("click", function(){
			if($("#q").val()==="")return;//没有关键词不响应  google搜索也是这么干的
			$.ajax({
	         	url: "<%=request.getContextPath()%>/noteSearchController/search",
	         	dataType:"json",
	         	data:{"titleOrContent": $("#q").val(),},
	         	success:function(rs){
	         		var divs = $("#menu_list>div");
					if(divs.length>0){
						divs.remove();
					}
					var strLine = "";
					$.each(rs, function(i,c){
						console.log(c);
						var time = c.create_time;//
						strLine+='<div><i><span id='+c.id+' class="glyphicon glyphicon-list-alt">&nbsp;</span></i><span>'+c.title+'...</span><span style="display:block;color:#8c8c8c;margin-top: 4px;font-size: 12px;line-height: 1.35;">'+time+'</span></div>';
					});
					$("#menu_list").append(strLine);
					addNoteHover();
	         	}
	         });
		});
	}
	
	function getCurrentName(){
		$.ajax({
         	url: "<%=request.getContextPath()%>/userController/getCurrentName",
         	dataType:"json",
         	success:function(rs){
         		//将当前登录人名称
//          		$(".user-btn").text(rs.user_name);
         	}
         });
	}
	
	function getPic(){
		$.ajax({
	     	url: "<%=request.getContextPath()%>/userController/getPic",
	     	dataType:"json",
	     	success:function(rs){
	     		if(rs.isSuccess){
	     			$("#headPic").prop("src","<%=request.getContextPath()%>/"+rs.path);
	     		}else{
	     			alert("systemerror!");
	     		}
	     	}
	     });
	}
	
	
	function show(){
		$("div.bg").css("display","block");
	}
	
	function hide(){
		$("div.bg").css("display","none");
	}
	
	//Load出我的朋友 
	function loadPeople(){
// 		show();
		if(!currentNoteId){
			swal("请选择想要分享的笔记!", "分享失败", "error");
			return;
		}
		window.location.href="<%=request.getContextPath()%>/jsp/share/share.jsp?noteId="+currentNoteId;
		return;
		 t = $('#example').DataTable({
		      ajax: {
		          //指定数据源
		          url: "<%=request.getContextPath()%>/friendController/list"
		      },
		      //每页显示三条数据
		      pageLength: 3,
		      "language": {
		    	  "url":"<%=request.getContextPath()%>/json/ln.json"
		      },
		      columns: [{
		          "data": null, //此列不绑定数据源，用来显示序号
		      },
		      {
		          "data": "onlyName",
		      },
		      {
		    	  "data":null,
		      }
		      ],
		      
		  });
		 
		  //前台添加序号
		  t.on('order.dt search.dt',
		  function() {
		      t.column(0, {
		          "search": 'applied',
		          "order": 'applied'
		      }).nodes().each(function(cell, i) {
		          cell.innerHTML = i + 1;
		      });
		  }).draw();
		  
		  //添加点击事件
		  cc();
	}
	
	
	function share(){
		var toId = rowData.id;
		$.ajax({
  		  url:"<%=request.getContextPath()%>/friendController/share", 
  		  data:{"noteId":nodeId,"toId":toId},
  		  type:"post",
  		  success:function(rs){
  			  if(rs.isSuccess){
  				  //分享成功啦
  				swal("分享成功啦!", "分享成功啦", "success");
  			  }else{
  				  //分享失败啦
  				swal("分享失败!", "分享失败", "error");
  			  }
  		  },
  		  error:function(){
  			  //system error
  			swal("系统错误!", "系统没救了,请在留言区通知管理员，非常感谢", "error");
  		  },
  	   });
	}
	
	
	function cc(){
	  $("#example tbody").on("click", "tr", function(){
		  rowData = t.row(this).data();
		  console.log(rowData);//haha
	  });
}
	
	
</script>
</body>
</html>