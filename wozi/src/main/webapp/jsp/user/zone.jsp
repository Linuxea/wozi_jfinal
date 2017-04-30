<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>管理员中心</title>
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/all.css" >
	<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/swet/sweetalert.css" >
	<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->
	<script src="<%=request.getContextPath()%>/js/all.js"></script>
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
<!--         <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>管理员中心</strong></a> -->
<!--     </div> -->
    
<!--     </div> -->
<!-- </nav> -->





<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">个人中间</a>
    </div>
    <div>
        <ul class="nav navbar-nav" id="subMenu">
           	<li id="info" class="active"><a href="#">我的信息</a></li>
           	<li id="leave"><a href="#">留言</a></li>
           	<li id="friend"><a href="#">好友</a></li>
        </ul>
    </div>
    </div>
</nav>



<div>
	<iframe id="outer" src="<%=request.getContextPath()%>/jsp/user/userInfo.jsp" style="width:1345px;height:586px;">
		
	</iframe>
	
</div>
<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
<script src="<%=request.getContextPath()%>/plugins/echart/echarts.js"></script>
<script>

	$(function(){
		funs.init();
	});
	
	var funs = {
			init: function(){
				funs.bindEvent();
			},
			bindEvent:function(){
				$("#info").on("click", function(){
					funs.jump("<%=request.getContextPath()%>/jsp/user/userInfo.jsp");
				});
				
				$("#leave").on("click", function(){
					funs.jump("<%=request.getContextPath()%>/jsp/help/help.jsp");
				});
				
				$("#subMenu>li").on("click", function(){
					$(this).addClass("active").siblings("li").removeClass("active");
				});
				
				///druid/index.html
				$("#friend").on("click", function(){
					funs.jump("<%=request.getContextPath()%>/jsp/friend/listFriend.jsp");
				});
			},
			jump: function(src){
				$("#outer").attr("src", src);
			}
	}

</script>
</body>
</html>