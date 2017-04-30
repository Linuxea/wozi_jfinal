<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>用户具体信息</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<!-- 	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script> -->
<!-- 	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/swet/sweetalert.css" >
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.js"></script><!-- 版本不能太高 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert-dev.js"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert.min.js"></script>
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

<!-- <nav class="navbar navbar-default" role="navigation"> -->
<!-- 	<div class="container-fluid">  -->
<!--     <div class="navbar-header"> -->
<!--         <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>用户个人信息详情</strong></a> -->
<!--     </div> -->
    
<!--     </div> -->
<!-- </nav> -->


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
			年龄
		</label>
		<div class="col-sm-10">
			<input class="form-control" id="age" type="text" disabled>
		</div>
	</div>
	
	<div class="form-group">
		<label for="" class="col-sm-2 control-label">
			邮箱
		</label>
		<div class="col-sm-10">
			<input class="form-control" id="email" type="text" disabled>
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
				<select id="sex" class="form-control" disabled>
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
			<input class="form-control" id="intro" type="text" disabled>
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
		<button type="button" class="btn btn-danger" id="del">删除</button>
		</div>
	</div>
	
	
</form>
</div>

<script>
	var id = null;
	$(function(){
		funs.init();
		id = location.search.replace("?","").split("=")[1];//获取参数中的id
		funs.getDetail();
	});
	
	var funs = {
			init: function(){
				$("#back").on("click", function(){
					window.history.back();
				});
				
				$("#del").on("click", function(){
					funs.del(id);
				});
			},
			getDetail: function(){
				$.ajax({
			     	url: "<%=request.getContextPath()%>/adminController/getDetail",
			     	dataType:"json",
			     	data:{id:id},
			     	success:function(rs){
			     		if(rs.isSuccess){
			     			var rs = rs.rs;
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
			     		}else{
			     			
			     		}
			     	}
			     });
			},
			
			del : function(user_id){
				swal({
					  title: "你确定删除该用户信息吗?",
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
								url:"<%=request.getContextPath()%>/adminController/delUser",
								data:{
									"id":user_id,
								},
								dataType:"json",
								success:function(rs){
									if(rs.isSuccess){
										swal("删除成功!", "", "success");
										setTimeout(function(){
											window.history.back();
										}, 1000);
									}else{
										swal("删除失败!", rs.msg, "error");
									}
								},
								fail:function(){
									swal("Ohh!", "系统故障!", "error");
								},
							});
						}else{
							swal("Cancelled", "当前用户安全存留下来", "error");
				
						}
						
					});
			},
	}

</script>
</body>
</html>