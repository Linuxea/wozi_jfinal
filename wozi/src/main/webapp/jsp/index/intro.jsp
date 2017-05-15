<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>我知笔记介绍</title>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Custom Styles */
    ul.nav-tabs{
        width: 140px;
        margin-top: 20px;
        border-radius: 4px;
        border: 1px solid #ddd;
        box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    }
    ul.nav-tabs li{
        margin: 0;
        border-top: 1px solid #ddd;
    }
    ul.nav-tabs li:first-child{
        border-top: none;
    }
    ul.nav-tabs li a{
        margin: 0;
        padding: 8px 16px;
        border-radius: 0;
    }
    ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
        color: #fff;
        background: #0088cc;
        border: 1px solid #0088cc;
    }
    ul.nav-tabs li:first-child a{
        border-radius: 4px 4px 0 0;
    }
    ul.nav-tabs li:last-child a{
        border-radius: 0 0 4px 4px;
    }
    ul.nav-tabs.affix{
        top: 30px; /* Set the top position of pinned element */
    }
</style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
   <div class="jumbotron">
   <a class="navbar-brand" href="<%=request.getContextPath() %>/jsp/index/index.jsp">
   <span class="glyphicon glyphicon-home" style="color:#0088cc; font-size: 22px;display:inline;">back</span>
   </a>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="#section-1">概述</a></li>
                <li><a href="#section-2">笔记编辑</a></li>
                <li><a href="#section-3">分享笔记</a></li>
                <li><a href="#section-4">积分</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            <h2 id="section-1">笔记编辑</h2>
            <p>注册登录的用户，能够在线进行目录的创建，在相应的目录下进行笔记的创建与编辑。</p>
            <hr>
            <h2 id="section-2">分享笔记</h2>
            <p>用户在待选列表中对特定用户进行申请好友添加申请，等待对方同意通过后，能够进行笔记的分享操作。</p>
            <hr>
            <h2 id="section-3">积分</h2>
            <p>对于用户的操作，从注册登录到创建，修改更新个人信息，乃至分享笔记。都有相应的积分积累。</p>
            <p>通过积分对用户的等级进行相应的分段：潜水 冒泡 专家 教授</p>
            <hr>
            <h2 id="section-4">总结</h2>
            <p>系统仍有许多不完善的地方，在个人信息模块，有留言的模块，可以对管理员，针对系统的不完善地方，给予一定的建议与意见，我们将会认真对待您的每一次建议，并将落实到底</p>
            <hr>
        </div>
    </div>
</div>
</body>
</html>