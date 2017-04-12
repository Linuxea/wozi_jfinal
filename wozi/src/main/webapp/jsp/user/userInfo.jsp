<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>我的个人信息</title>
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
        <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>我知笔记个人信息</strong></a>
    </div>
    
    <div class="nav navbar-nav navbar-right">
        	 <button type="button" class="btn btn-default navbar-btn chat-btn">聊天室</button>
    </div>
    
    <div class="nav navbar-nav navbar-right">
        	 <button type="button" class="btn btn-default navbar-btn help-btn">帮助</button>
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
		<label for="" class="col-sm-2 control-label">
			旧密码
		</label>
		<div class="col-sm-10">
			<input class="form-control" id="oldPwd" type="text" disabled>
		</div>
	</div>
	
	<div class="form-group">
		<label for="" class="col-sm-2 control-label">
			新密码
		</label>
		<div class="col-sm-10">
			<input class="form-control" id="newPwd" type="text" placeholder="如果需要,请在此处输入新密码">
		</div>
	</div>
	
	<div class="form-group">
		<label for="" class="col-sm-2 control-label">
			年龄
		</label>
		<div class="col-sm-10">
			<input class="form-control" id="age" type="text">
		</div>
	</div>
	
	<div class="form-group">
		<label for="" class="col-sm-2 control-label">
			邮箱
		</label>
		<div class="col-sm-10">
			<input class="form-control" id="email" type="text">
		</div>
	</div>
	
	<fieldset>
<!-- 		<div class="form-group"> -->
<!-- 			<label for="disabledTextInput"  class="col-sm-2 control-label">禁用输入（Fieldset disabled） -->
<!-- 			</label> -->
<!-- 			<div class="col-sm-10"> -->
<!-- 				<input type="text" id="disabledTextInput" class="form-control"  placeholder="禁止输入"> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="form-group">
			<label for="sex"  class="col-sm-2 control-label">性别
			</label>
			<div class="col-sm-10">
				<select id="sex" class="form-control">
					<option value="boy">boy</option>
					<option value="girl">girl</option>
				</select>
			</div>
		</div>
	</fieldset>
	
	<div class="form-group">
		<label for="" class="col-sm-2 control-label">
			个人介绍
		</label>
		<div class="col-sm-10 input-group-lg">
			<input class="form-control" id="intro" type="text">
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">账户创建时间</label>
		<div class="col-sm-10">
			<input class="form-control" id="create_time" type="text" disabled>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">账户最后修改时间</label>
		<div class="col-sm-10">
			<input class="form-control" id="update_time" type="text" disabled>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label"></label>
		<div class="col-sm-5">
			<button type="button" class="btn btn-info" id="back">返回</button>
		</div>
		
		<div class="col-sm-5">
		<button type="button" class="btn btn-info" id="update">确认修改</button>
		</div>
	</div>
	
	
</form>
</div>

<script>
var id = null;//保存用户id

$(function(){
	init();
	getUser();
	help();
});

function init(){
	$("#update").on("click", function(){
		updateInfo();
	});
	
	$("#back").on("click",function(){
		window.history.back();
	});
}

function getUser(){
	$.ajax({
     	url: "<%=request.getContextPath()%>/userController/getCurrentName",
     	dataType:"json",
     	success:function(rs){
     		$("#user_name").val(rs.user_name);
     		$("#age").val(rs.age);
     		$("#oldPwd").val(rs.user_password);
			$("#create_time").val(rs.create_time);
			$("#update_time").val(rs.update_time)
			$("#email").val(rs.email);
			$("#intro").val(rs.intro);
			id = rs.id;
			if(rs.sex ==="boy"){
				$("#sex>option:eq(0)").prop("selected", true);
			}else{
				$("#sex>option:eq(1)").prop("selected", true);
			}
     	}
     });
}

function updateInfo(){
	$.ajax({
     	url: "<%=request.getContextPath()%>/userController/update",
     	dataType:"json",
     	data: {
     		age : $("#age").val(),
			user_password : $("#newPwd").val(),
			email :  $("#email").val(),
			sex :  $("#sex>option:selected").val(),
			intro:$("#intro").val(),
     		id: id,
     	},
     	success:function(rs){
     		if(rs.isSuccess){
     			getUser();
     			$("#newPwd").val("");
     		}else{
     			alert("systemerror!");
     		}
     	}
     });
	
}


function help(){
	$(".help-btn").on("click", function(){
		//帮助的绑定
		window.location.href = "<%=request.getContextPath()%>/jsp/help/help.jsp";
	});
}

</script>
</body>
</html>