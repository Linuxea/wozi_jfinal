<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面jsp</title>
<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
</head>
<body>

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
      <li><a href="regist.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
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
	<form class="form-horizontal" role="form" id="loginForm" method="post">
	<div class="form-group">
		<label for="firstname" class="col-sm-offset-3 col-sm-2 control-label">名称</label>
		<div class="col-sm-2">
			<input type="text" class="form-control" id="" name="tbWoZiUser.userName"
				   placeholder="请输入名字">
		</div>
	</div>
	<div class="form-group">
		<label for="lastname" class="col-sm-offset-3 col-sm-2 control-label">密码</label>
		<div class="col-sm-2 col">
			<input type="password" class="form-control" id="" name="tbWoZiUser.password"
				   placeholder="请输入密码">
		</div>
		
	</div>
	<div class="form-group">
		<div class="col-sm-offset-5 col-sm-2">
			<button type="button" class="btn btn-primary btn-block" id="ajaxLogin">登录</button>
		</div>
	</div>
</form>
</div>
<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../plugins/js/Jquery-Form.js"></script>
<script>

	$(document).on("click","#ajaxLogin", function(){
		$("#loginForm").ajaxSubmit({
			url:"<%=request.getContextPath() %>/user/userManager_ajaxLogin",
			dataType:"json",
			success:function(rs){
				if(rs.code==="0"){
					debugger;
					window.location.href="../note/MyNote.jsp?name=" + rs.data;
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