<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>帮助模块</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	</style>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
    <div class="navbar-header">
        <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>留言中心</strong></a>
    </div>
    
    </div>
</nav>


<div class="container main">
	<div class="panel-heading">
		<!-- 留空白 好看 -->
	</div>
	<form class="form-horizontal" role="form">
	<div class="form-group">
		<label class="col-sm-2 control-label">用户名</label>
		<div class="col-sm-10">
			<input class="form-control" id="user_name" type="text" disabled>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">标题</label>
		<div class="col-sm-10">
			<input class="form-control" id="title" type="text">
		</div>
	</div>
	
	<div class="form-group">
		<label for="" class="col-sm-2 control-label">
			留言信息
		</label>
		<div class="col-sm-10 input-group-lg">
			<textarea class="form-control" id="content">
			</textarea>
		</div>
	</div>
	
	
	<div class="form-group">
		<label class="col-sm-2 control-label"></label>
		<div class="col-sm-5">
			<button type="button" class="btn btn-info" id="back">返回</button>
		</div>
		
		<div class="col-sm-5">
		<button type="button" class="btn btn-info" id="leave">确认留言</button>
		</div>
	</div>
	
	
</form>
</div>

<script>

$(function(){
	funs.init();
	funs.getUser();
});

var funs = {
		init: function(){
			$("#leave").on("click", function(){
				//绑定留言事件
				funs.leave();
			});
		},
		
		listMyMsg: function(){
			$.ajax({
		     	url: "<%=request.getContextPath()%>/helpController/listMyMsg",
		     	dataType:"json",
		     	success:function(rs){
		     		if(rs.isSuccess){
		     			
		     		}
		     	}
		     });
		},
		getUser: function(){
			$.ajax({
		     	url: "<%=request.getContextPath()%>/userController/getCurrentName",
		     	dataType:"json",
		     	success:function(rs){
		     		$("#user_name").val(rs.user_name);
		     	}
		     });
		},
		leave: function(){
			$.ajax({
		     	url: "<%=request.getContextPath()%>/helpController/leaveMsg",
		     	data:{
		     		title: $("#title").val(),
		     		content: $("#content").val()
		     	},
		     	dataType:"json",
		     	success:function(rs){
		     		alert("留言成功");
		     	}
		     });
		},
}



</script>
</body>
</html>