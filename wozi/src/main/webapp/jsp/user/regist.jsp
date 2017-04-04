<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
	span.necessary{
		color:red;
		font-size:14px;
		font-weight: bold;
	}
</style>  
</head>
<body>
<div class="panel panel-default">
    <div class="panel-body">
    <nav class="navbar" role="navigation">
	<div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="jsp/index/index.html">我知笔记</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="jsp/index/intro.html">介绍</a></li>
            <!-- <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    Java <b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">xx</a></li>
                    <li><a href="#">xx</a></li>
                    <li><a href="#">xx</a></li>
                    <li class="divider"></li>
                    <li><a href="#">xx</a></li>
                    <li class="divider"></li>
                    <li><a href="#">xx</a></li>
                </ul>
            </li> -->
        </ul>
         <ul class="nav navbar-nav navbar-right">
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
    </ul>
    </div>
	</div>
</nav>
		<!-- <div class="panel-footer">面板脚注</div> -->
    </div>
</div>
<div class="container">
	<div class="msg" style="height:60px;">
	</div>
	<form class="form-horizontal" role="form" id="registForm" method="post">
	<div class="form-group">
		<label for="firstname" class="col-sm-offset-3 col-sm-2 control-label">名称</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="" name="userModel.user_name" placeholder="请输入名字" />
		</div>
		<span class="necessary">*</span>
	</div>
	<div class="form-group">
		<label for="EMail" class="col-sm-offset-3 col-sm-2 control-label">邮箱</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="" name="userModel.email" placeholder="请输入邮箱"/>
		</div>
	</div>
	
	<div class="form-group">
		<label for="age" class="col-sm-offset-3 col-sm-2 control-label">年龄</label> 
		<div class="col-sm-2">
			<input type="text" class="form-control" id="" name="userModel.age" placeholder="请输入年龄"/>
		</div>
		<span class="necessary">*</span>
	</div>
	
	<div class="form-group">
		<label for="sex" class="col-sm-offset-3 col-sm-2 control-label">性别</label> 
		<div class="col-sm-2">
			<input type="radio" class="" id="" name="userModel.sex" value="boy" checked />boy
			<input type="radio" class="" id="" name="userModel.sex" value="girl"/>girl
		</div>
		<span class="necessary">*</span>
	</div>
	
	
	<div class="form-group">
		<label for="password" class="col-sm-offset-3 col-sm-2 control-label">密码</label>
		<div class="col-sm-2 col">
			<input type="password" class="form-control" id="" name="userModel.user_password"
				   placeholder="请输入密码">
			<span class="help-block">Use at least 6 characters</span>
		</div>
		<span class="necessary">*</span>
	</div>
	<div class="form-group">
		<label for="confirmPassword" class="col-sm-offset-3 col-sm-2 control-label">确认密码</label>
		<div class="col-sm-2 col">
			<input type="password" class="form-control" id="" name="confirmPassword"
				   placeholder="请再次输入密码" />
				   <span class="help-block">confirm your password</span>
				   <span class="necessary">*</span>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-5 col-sm-2">
			<button type="button" class="btn btn-primary btn-block" id="submit">注册</button>
		</div>
	</div>
</form>
</div>
<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../plugins/js/Jquery-Form.js"></script>
<script>
	$(document).on("click","#submit",function(){
		var name = $("input[name='userModel.user_name']").val();
		var pwd = $("input[name='userModel.user_password']").val();
		var age = $("input[name='userModel.age']").val();
		var sex = $("input[name='userModel.sex']").val();
		var first = $("input[name='userModel.user_password']").val();
		var second = $("input[name=confirmPassword]").val();
		
		if(name===''|| pwd=== '' || age === '' || sex === '' || first === '' || second === ''){
			if($(".alert").length){
				$(".alert").remove();
			}
			var appendStr = "<div class=\"alert alert-warning\">"+
			"<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>"+
			"<strong>警告！</strong>关键字段不能为空</div>";
			$(".msg").append(appendStr);
			return;
		}
		
		if(first!==second){
			if($(".alert").length){
				$(".alert").remove();
			}
			var appendStr = "<div class=\"alert alert-warning\">"+
			"<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>"+
			"<strong>警告！</strong>密码不一致</div>";
			$(".msg").append(appendStr);
			return;
		}
		$("#registForm").ajaxSubmit({
			url:"<%=request.getContextPath() %>/userController/add",
			dataType:"json",
			success:function(rs){
				if(rs.code==="0"){
					var appendStr = "<div class=\"alert alert-success\">"+
					"<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>"+
					"<strong></strong>"+ 
					rs.desc +
					"</div>";
					$(".msg").append(appendStr);
				}else{
					if($(".alert").length){
						$(".alert").remove();
					}
					var appendStr = "<div class=\"alert alert-warning\">"+
					"<a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>"+
					"<strong>警告！</strong>"+ 
					rs.desc +
					"</div>";
					$(".msg").append(appendStr);
				}
			}
		});
	});
</script>
</body>
</html>