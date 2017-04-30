<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>所有好友</title>
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
<!--         <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>好友中心</strong></a> -->
<!--     </div> -->
    
<!--     </div> -->
<!-- </nav> -->


<div class="container main">
	<div class="panel-heading">
		<!-- 留空白 好看 -->
	</div>

<form id="msgs">

<table class="table table-hover table-condensed table-bordered">
	<caption>所有好友</caption>
	<thead>
		<tr style="display:none;" >
			<th></th><!-- 用户名 -->
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
	});
	
	var funs = {
			
			init : function(){
				funs.list();
			},
			list :function(){
				$.ajax({
					url:"<%=request.getContextPath()%>/friendController/list",
					success: function(rs){
						if(rs.isSuccess){
// 							console.log(rs.list);
							$("#msgBody").html("");
				     		var str = "";
				     		var li = rs.list;
				     		for(var i in rs.list){
				     			str += "<tr><td>"+li[i].onlyName+"</td>";
//	 			     			str += "<td>"+rs[i].create_time+"</td>";
//	 			     			str += "<td>"+rs[i].update_time+"</td>";
				     			str += "<td style=\"display:none;\">"+li[i].add_side+"</td>";
				     			str +="</tr>";
				     		}
				     		$("#msgBody").append(str);
						}else{
							
						}
					},
					error : function(){
						
					},
				});
			},
			
			
	}

</script>
</body>
</html>