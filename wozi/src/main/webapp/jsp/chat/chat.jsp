<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>聊天室</title>
<!--   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" /> -->
  		<link rel="stylesheet" href="<%=request.getContextPath()%>/css/note/jstree.css" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/swet/sweetalert.css" >
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
	/*笔记目录*/
	.note-menu {
    	width: 25%;
    	float:left;
        height: 580px;
        border-radius:0;
    }
    
    /*笔记编辑栏*/
    .note-main{
    	width:75%;
    	float:left;
        height: 580px;
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
    	padding: 2px;
    	height: 540px;
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
        <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>聊天室</strong></a>
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
				<h3 class="panel-title"><span>我的好友</span></h3>
		</div>
		<div class="panel-body panel-menu">
			<div id="jstree">
			<!-- 笔记目录侧边栏 -->
			</div>
		</div>
</div>
<!-- 侧边栏结束 -->
<!-- 笔记列表开始-->
<!-- 	<div class="panel panel-primary note-list"> -->
<!-- 		<div class="panel-heading"> -->
<!-- 			<h3 class="panel-title"><span>笔记列表</span><span><button type="button" class="btn note-create btn-info">new!</button></span></h3> -->
<!-- 		</div> -->
<!-- 		<div class="panel-body"> -->
<!-- 			<div id="menu_list"> -->
<!-- 			<!-- 笔记目录列表栏 -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 笔记列表结束 -->
<!-- 笔记编辑主体开始-->
	<div class="panel panel-primary note-main">
		<div class="panel-heading">
			<h3 class="panel-title"><span>window for chat</span><span>
				<!-- 标题框 -->
			</h3>
		</div>
		
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">黄晓明</h3>
			</div>
			<div class="panel-body">
			 <!-- 有一个内容历史框框 -->
			 <textarea class="form-control" id="content" rows="18" cols="7" >
			 
			 </textarea>
			 <!-- 有一个内容输入框 -->
			 <textarea class="form-control" id="in" rows="3" cols="7" >
			 
			 </textarea>
			</div> 
			
			<div class="form-group">
				<div class="col-sm-5">
					<button type="button" class="btn btn-default navbar-btn" id="send">send</button>
				</div>
			</div>
			
		</div>
		
		
	</div>
<!-- 笔记编辑主体结束 -->
</div>
<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
<script src="../../plugins/jqContextMenu/src/jquery.ui.position.js" type="text/javascript"></script>
<script src="../../plugins/jqContextMenu/src/jquery.contextMenu.js" type="text/javascript"></script>
<script src="../../plugins/jqContextMenu/screen.js" type="text/javascript"></script>
<script src="../../plugins/jqContextMenu/prettify/prettify.js" type="text/javascript"></script>
<!-- jqContext end -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert-dev.js"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> -->
<script src="<%=request.getContextPath()%>/plugins/js/jstree.js"></script>
<script type="text/javascript" charset="utf-8" src="../../ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="../../ueditor.all.js"> </script>
<script type="text/javascript" charset="utf-8" src="../../lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="../../plugins/js/common.js"></script>
<script>
	
	$(function(){
		funs.init();
	});
	
	
	var funs = {
			
			init : function(){
				
			},
			getFriends : function(){
				$.ajax({
					url: "<%=request.getContextPath()%>/chatController/listMyFriends",
					type:"post",
					success: function(rs){
						if(rs.isSuccess){
							
						}
					},
					fail : function(){
						
					},
				});
			},
			send : function(){
				var param = {
					to : "",
					content: "",
				};
				$.ajax({
					url: "<%=request.getContextPath()%>/chatController/send",
					data: param,
					type:"post",
					success: function(rs){
						if(rs.isSuccess){
							
						}
					},
					fail : function(){
						
					},
				});
			},
			touch : function(){
				$.ajax({
					url: "<%=request.getContextPath()%>/chatController/touch",
					type:"post",
					success: function(rs){
						if(rs.isSuccess){
							
						}
					},
					fail : function(){
						
					},
				});
			},
			out :　function(){
				$.ajax({
					url: "<%=request.getContextPath()%>/chatController/out",
					type:"post",
					success: function(rs){
						if(rs.isSuccess){
							
						}
					},
					fail : function(){
						
					},
				});
			},
			
	}
	
</script>
</body>
</html>