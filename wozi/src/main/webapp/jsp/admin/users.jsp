<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>所有用户信息</title>
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

<form id="msgs">
<table class="table table-striped">
	<caption>所有用户信息</caption>
	<thead>
		<tr>
			<th>用户名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>邮箱</th>
			<th>创建时间</th>
			<th>最后修改时间</th>
			<th style="display:none;">id</th>
		</tr>
	</thead>
	<tbody id = "msgBody">
	</tbody>
</table>
</form>
</div>
<script>
	$(function(){
		funs.init();
		funs.getUser();
	});
	
	var funs = {
			init: function(){
				
			},
			getUser: function(){
				$.ajax({
			     	url: "<%=request.getContextPath()%>/adminController/listUsers",
			     	dataType:"json",
			     	success:function(rs){
			     		//先清空原来的
			     		$("#msgBody").html("");
			     		var str = "";
			     		for(var i in rs){
			     			str += "<tr><td>"+rs[i].user_name+"</td><td>"+rs[i].sex+"<td>"+rs[i].age+"</td><td>"+rs[i].email+"</td>";
			     			str += "<td>"+rs[i].create_time+"</td>";
			     			str += "<td>"+rs[i].update_time+"</td>";
			     			str += "<td style=\"display:none;\">"+rs[i].id+"</td>";
			     			str +="</tr>";
			     		}
			     		$("#msgBody").append(str);
			     	}
			     });
			},
			detail: function(){
				
			},
			
			
	}
	
</script>
</body>
</html>