<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>所有留言</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/swet/sweetalert.css" >
	<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
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
<!--         <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>留言中心</strong></a> -->
<!--     </div> -->
    
<!--     </div> -->
<!-- </nav> -->


<div class="container main">
<!-- 	<div class="panel-heading"> -->
<!-- 		<!-- 留空白 好看 --> 
<!-- 	</div> -->

<form id="msgs">

<table class="table table-striped">
	<caption>所有历史留言信息</caption>
	<thead>
		<tr>
			<th>标题</th>
			<th>内容</th>
			<th>作者</th>
			<th>时间</th>
			<th>查看过</th>
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
		funs.getMsgs();
	});
	
	var funs = {
		init: function(){
			//初始化操作
		},
		getMsgs: function(){
			$.ajax({
		     	url: "<%=request.getContextPath()%>/adminController/listMsg",
		     	dataType:"json",
		     	success:function(rs){
		     		//先清空原来的
		     		$("#msgBody").html("");
		     		var str = "";
		     		for(var i in rs){
		     			str += "<tr><td>"+rs[i].title+"</td><td>"+rs[i].content+"<td>"+rs[i].user_name+"</td><td>"+rs[i].create_time+"</td>";
		     			if(rs[i].status === "0"){
		     				//没看过的状态
		     				str += "<td><img src=\"<%=request.getContextPath()%>/images/no.jpg\" height=\"20\" width=\"20\"/></td>";
		     			}else{
		     				//看过了的状态
		     				str += "<td><img src=\"<%=request.getContextPath()%>/images/yes.png\" height=\"20\" width=\"20\"/></td>";
		     			}
		     			str += "<td style=\"display:none;\">"+rs[i].id+"</td>";
		     			str +="</tr>";
		     		}
		     		$("#msgBody").append(str);
		     		funs.colorCh();
		     		funs.change();
		     	}
		     });
		},
		colorCh: function(){
			var oldColor= null;
			$("#msgBody>tr").hover(function(){
				oldColor=$(this).css("background");
				$(this).css("background", "lightgray");
			}, function(){
				$(this).css("background", oldColor);
			});
		},
		change: function(){
			//点击每一条状切换
			$("#msgBody>tr").on("click", function(){
				var id = $(this).find("td:eq(5)").text();
				$.ajax({
			     	url: "<%=request.getContextPath()%>/adminController/changeStatus",
			     	dataType:"json",
			     	data:{id:id},
			     	success:function(rs){
			     		if(rs.isSuccess){
			     			swal({
			     				  title: "切换成功",
			     				  text: "状态切换成功!",
			     				  timer: 1000,
			     				  showConfirmButton: false
			     				});
			     			funs.getMsgs();
			     		}
			     	}
			     });
			});
		},
	}
</script>
</body>
</html>