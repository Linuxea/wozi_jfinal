<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>历史积分变化情况</title>
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
<!--         <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>用户信息中心</strong></a> -->
<!--     </div> -->
    
<!--     </div> -->
<!-- </nav> -->


<div class="container main">
	<div class="panel-heading">
	</div>

<form id="msgs">
<table class="table table-striped">
	<caption>
		<a href="#" style="font-size:20px;">所有积分</a>
		<span style="font-size:20px;" id="sumPoint"></span>
		<span id="title" style="font-size:20px;"></span>
	</caption>
	<thead> 
		<tr>
			<th>dbId</th>
			<th>编号</th>
			<th>积分变化</th>
			<th>说明</th>
			<th>时间</th>
		</tr>
	</thead>
	<tbody id = "msgBody">
	</tbody>
</table>
</form>
<!-- <ul class="pager"> -->
<!--     <li class="previous" id="previous" ><a href="#">&larr; 上一页</a></li> -->
<!--     <li class="next" id="next" ><a href="#">下一页 &rarr;</a></li> -->
<!-- </ul> -->
</div>
<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
<script src="<%=request.getContextPath()%>/plugins/echart/echarts.js"></script>
<script>
	
	//每页默认显示10条
	var maxId = null;
	var op = null;//next previous
	var num = 10;
	
	$(function(){
		funs.init();
		funs.getHi();
	});
	
	var funs = {
			init : function(){
			},
			getHi : function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/userController/pointTrace",
					type:"post",
					success:function(rs){
						if(rs.isSuccess){
							
							//所有积分统计
							$("#sumPoint").text(rs.sum);
							//头衔
							$("#title").text(" 我的头衔 "+rs.title);
							var list = rs.list;
							console.log(list);
							var str = "";
							$("#msgBody").html("");//clear old content
							for(var i in list){
								str +="<tr>";
								str +="<th>"+(list[i].id)+"</th>";
								str +="<th>"+(i)+"</th>";
								str +="<th>"+(list[i].point>0?"+"+list[i].point:list[i].point)+"</th>";
								
								str +="<th>"+list[i].comment+"</th>";
								str +="<th>"+list[i].create_time+"</th>";
								str +="</tr>";
								
								maxId = list[i].id;
							}
							$("#msgBody").append(str);
						}else{
							alert("systemerror");
						}
					},
					error:function(){
						alert("systemerror");
					},
				});
			},
			
			previous: function(){
				$("#previous").on("click", function(){
					//绑定上一页按钮
					op = "previous";
				});
			}
	}
	
</script>
</body>
</html>