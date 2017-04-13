<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta charset="utf-8">
	<title>我知笔记</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="panel panel-default">
    <div class="panel-body">
    <nav class="navbar" role="navigation">
	<div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">我知笔记</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li class="active"><a href="<%=request.getContextPath() %>/jsp/index/intro.jsp">介绍</a></li>
          <!--   <li class="dropdown">
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
      <li><a href="<%=request.getContextPath() %>/jsp/user/regist.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
      <li><a href="<%=request.getContextPath() %>/jsp/user/login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
    </ul>
    </div>
	</div>
</nav>
		<!-- <div class="panel-footer">面板脚注</div> -->
    </div>
</div>
<div id="myCarousel" class="carousel slide">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="<%=request.getContextPath() %>/jsp/test/images/bg1.jpg" alt="First slide" style="width:100%;height:480px;">
			<div class="carousel-caption">标题 1</div>
		</div>
		<div class="item">
			<img src="<%=request.getContextPath() %>/jsp/test/images/bg2.jpg" alt="Second slide" style="width:100%;height:480px;">
			<div class="carousel-caption">标题 2</div>
		</div>
		<div class="item">
			<img src="<%=request.getContextPath() %>/jsp/test/images/bg3.jpg" alt="Third slide"  style="width:100%;height:480px;">
			<div class="carousel-caption">标题 3</div>
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>
</div> 
<div style="height:25px;"></div>
<div class="container">
        <div class="row">
            <div class="col-xs-12 text-center">
                <ul class="list-inline">
                    <li><a href="">帮助</a></li>
                    <li><a href="">我知笔记</a></li>
                    <li><a href="" target="_blank">隐私条款</a></li>
                    <li><a href="" target="_blank">合作伙伴</a></li>
                </ul>
                <p>©北京我知科技有限公司 京ICP证140089号 京ICP备1309856号</p>
            </div>
        </div>
    </div>
</body>
</html>