<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
	<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jqContext begin -->
    <link href="../../plugins/jqContextMenu/src/jquery.contextMenu.css" rel="stylesheet" type="text/css" />
    <link href="../../plugins/jqContextMenu/screen.css" rel="stylesheet" type="text/css" />
    <link href="../../plugins/jqContextMenu/prettify/prettify.sunburst.css" rel="stylesheet" type="text/css" />
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
	</style>
</head>
<body>
<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
    <div class="navbar-header">
        <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>我知笔记</strong></a>
    </div>
        <!--向左对齐-->
       <!--  <ul class="nav navbar-nav navbar-left">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Java
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">jmeter</a></li>
                    <li><a href="#">EJB</a></li>
                    <li><a href="#">Jasper Report</a></li>
                    <li class="divider"></li>
                    <li><a href="#">分离的链接</a></li>
                    <li class="divider"></li>
                    <li><a href="#">另一个分离的链接</a></li>
                </ul>
            </li>
        </ul> -->
       <div>
       		<form method="GET" class="navbar-form navbar-left zu-top-search-form" role="search" id="zh-top-search-form">
            	<div class="form-group">
               		<input type="text" class="zu-top-search-input" id="q" name="q" autocomplete="off" value="" maxlength="100" placeholder="搜索你的笔记..." role="combobox" aria-autocomplete="list">
            	</div>
            		<span class="searchMirror glyphicon glyphicon-zoom-in" style="color: rgb(255, 255, 255);font-size: 20px;background:#337ab7;"></span>
        	</form>
    	</div>
        <!--向右对齐-->
        <div class="nav navbar-nav navbar-right">
        	 <button type="button" class="btn btn-default navbar-btn user-btn">
        	 	<!--  此处显示当前登录用户名称  -->
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
<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- jqContext begin -->
<script src="../../plugins/jqContextMenu/src/jquery.ui.position.js" type="text/javascript"></script>
<script src="../../plugins/jqContextMenu/src/jquery.contextMenu.js" type="text/javascript"></script>
<script src="../../plugins/jqContextMenu/screen.js" type="text/javascript"></script>
<script src="../../plugins/jqContextMenu/prettify/prettify.js" type="text/javascript"></script>
<!-- jqContext end -->
<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script type="text/javascript" charset="utf-8" src="../../ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../../ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8" src="../../lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../../plugins/js/common.js"></script>
<script>
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
		var params = window.location.search;
		var paramObj = handleSearchParams(params);
		$("button.user-btn").text(paramObj.name);
		var currentMenuId;//声明一个全局变量来保存每个操作当前目录的Id
		var menuId;//声明一个全局变量来保存每一个笔记的Id
		var currentNoteId = "";//保存当前编辑的笔记
		//取得用户目录json格式数据
		getMenu();
		findNode();
		addDel();
	  });
	
	//点击用户名称跳转到用户信息详情页面
	$(document).on("click","button.user-btn", function(){
		window.location.href = "../userManager/userInfo.jsp";
	});
	
	//点击目录获取该目录下的笔记列表
	function getNoteListByMenu(menuId) {
		$.ajax({
			url:"<%=request.getContextPath()%>/note/noteManager_listNoteByDirectMenuId",
			data:{
				"currentMenuNodeId":menuId,
			},
			success:function(rs){
				if(rs.code === "0"){
					var divs = $("#menu_list>div");
					if(divs.length>0){
						divs.remove();
				}
					var list =rs.data;
					var strLine = "";
					$.each(list, function(i,c){
						var time = c.uploadTime;
						time = time.replace("T"," ");
						strLine+='<div><i><span id='+c.id+' class="glyphicon glyphicon-list-alt">&nbsp;</span></i><span>'+c.title.substring(0,18)+'...</span><span style="display:block;color:#8c8c8c;margin-top: 4px;font-size: 12px;line-height: 1.35;">'+time+'</span></div>';
					});
					$("#menu_list").append(strLine);
					addNoteHover();
				}
			}
		});
	}
	
	//创建目录节点
	function createMenuNode(parnetId,newNodeId){
		$.ajax({
			url:"<%=request.getContextPath()%>/note/noteManager_ajaxAddMenuNode",
			type:"post",
			data:{"directMenuParentId":parnetId,"newNodeId":newNodeId},
			dataType:"json",
			success:function(rs){
				if(rs.code ==="0"){
					console.log(rs.desc);
				}else{
					console.log(rs.desc);
				}
			},
			fail:function(){
				console.log("error..");
			}
		});
	}
	
	//修改节点名称
	function reNameMenuNode(currentMenuId, newTextName) {
		if(Array.isArray(currentMenuId)){
			currentMenuId = currentMenuId[0];
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/note/noteManager_reNameMenuNode",
			dataType:"json",
			data:{
				"currentMenuNodeId":currentMenuId,//currentMenuNodeId
				"newTextName":newTextName,
			},
			success:function(rs) {
				if(rs.code==="0") {
					console.log(rs.desc);
				}else{
					console.log(rs.desc);
				}
			},
			fail:function(){
				console.log("error..");
			}
		});
	}
	
	function delMenu(currentMenuId) {
		$.ajax({
			url:"<%=request.getContextPath()%>/note/noteManager_delMenuNode",
			data:{
				"currentMenuNodeId":currentMenuId,
			},
			dataType:"json",
			success:function(rs){
				if(rs.code === "0"){
					console.log(rs.desc);
				}else{
					alert(rs.desc);
				}
			},
			fail:function(){
				
			},
		});
	}
	
	//创建笔记
	$(document).on("click",".note-create", function(){
		currentNoteId = "";
		if(typeof currentMenuId ==="undefined"){
			alert("请选择目录");
		}else {
			console.log("创建笔记成功" + currentMenuId);
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
		$.ajax({
			url:"<%=request.getContextPath()%>/note/noteManager_ajaxAddNote",
			type:"post",
			data:{
				"tbWoZiNotePOStr":JSON.stringify(tbWoZiNotePO),
			},
			dataType:"json",
			success:function(rs){
				if(rs.code==="0") {
					getNoteListByMenu(currentMenuId);
					UE.getEditor('editor').setDisabled('fullscreen');
					//alert("新建或者修改成功");
				}
			},
		});
	});
	
	//点击具体笔记
	$(document).on("click","#menu_list>div",function(){
		//alert($(this).find("span").attr("id"));
		currentNoteId = $(this).find("span").attr("id");
		$.ajax({
			url:"<%=request.getContextPath()%>/note/noteManager_ajaxGetNode",
			dataType:"json",
			data:{
				"currentNoteId":$(this).find("span").attr("id"),
			},
			success:function(rs){
				if(rs.code === "0"){
					initUE(function(){
						UE.getEditor('editor').setEnabled();
						UE.getEditor('editor').setContent("");
						UE.getEditor('editor').execCommand('insertHtml', rs.data.content);
						$(".note-title").val(rs.data.title);
					});
				}
			}
		});
	});
	
	function findNode(){
		//查找笔记
		$(document).on(".zu-top-search-input","keyup", function(){
			console.log("aaa");
		});
	}
	
	function getMenu() {
		$.ajax({
			url:"<%=request.getContextPath()%>/note/noteManager_handleNoteMenu",
			dataType:"json",
			success:function(rs) {
				 $('#jstree').jstree({
				    	"core": {
				    			"data": rs.data,
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
						console.log("createa node successfully!");
						console.log(e);//e 的 parent 表示新创建的目录的父目录!
						createMenuNode(e.parent, e.node.id);//e.node.id为自动生成的id
						currentMenuId = e.node.id;
					})
					.bind("rename_node.jstree", function(data, e){//修改节点名称
						console.log("rename..");
						console.log("当前选中的是"+currentMenuId);
						console.log(e);//e.old oldname  e.text  newName
						reNameMenuNode(currentMenuId, e.text);
						//document.location.reload();//当前页面 解决一个问题的暂时方法 2016-12-19
					})
					.bind("delete_node.jstree", function(data, e){//delete_node
						console.log(e);//e.node.id  存放着欲删除的目录id
						delMenu(e.node.id);
						currentMenuId = undefined;
					})
					.bind("select_node.jstree", function (e, data) {
				       // console.log(data.changed.selected); // 左键右键点击目录的id
				        currentMenuId = data.node.id;//保存当前选中的目录id
				        menuId = data.node.id;
				        getNoteListByMenu(currentMenuId);
				        //console.log(data.changed.deselected); // 跳出某个目录的id
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
            callback: function(key, options) {
                var nodeId = $(this).find("i>span").attr("id");
                $.ajax({
                	url:"http://192.168.0.102:8080/wozi//note/noteManager_delNodeById",
                	dataType:"json",
                	data:{"currentNoteId":nodeId},
                	success:function(rs){
                		if(rs.code === '0'){
                			getNoteListByMenu(currentMenuId);//重新加载日记列表
                		}else{
                			alert(rs.desc)
                		}
                	}
                });
            },
            items: {
                "delete": {name: "删除", icon: "delete"},
            }
        });
	}
</script>
</body>
</html>