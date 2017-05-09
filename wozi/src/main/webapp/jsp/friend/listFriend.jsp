<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线搜索好友</title>
<!-- 此例子是结合bootstrap的Datatables，暂且定位为最基本的例子吧 -->
<!-- 引入必须的css和js文件 -->
  <link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" /> 
  <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css" /> 
  <script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.js"></script> 
  <script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js"></script> 
  <script type="text/javascript" language="javascript" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script> 
  <!-- HTML代码片段中请勿添加<body>标签 //--> 
  </head>
  
  
  <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#">操作</a>
    </div>
    <div>
        <ul class="nav navbar-nav" id="">
        	<li id=""><a href="#">添加好友</a></li>
        	<li id=""><a href="#">分享笔记</a></li>
        	<li id="check"><a href="#">我的好友请求</a></li>
        </ul>
    </div>
    </div>
</nav>
  
  <div id="container"> 
   <!-- 定义一个表格元素 --> 
   <table id="example" class="table table-striped table-bordered"> 
    <thead> 
     <tr> 
      <th></th> 
      <th>名称</th> 
      <th>添加时间</th> 
     </tr> 
    </thead> 
    <tbody></tbody> 
    <!-- tbody是必须的 --> 
   </table> 
  </div> 
  <script>
  
  /*Javascript代码片段*/
  var t = $('#example').DataTable({
      ajax: {
          //指定数据源
          url: "<%=request.getContextPath()%>/friendController/list"
      },
      //每页显示三条数据
      pageLength: 3,
      "language": {
    	  "url":"<%=request.getContextPath()%>/json/ln.json"
      },
      columns: [{
          "data": null //此列不绑定数据源，用来显示序号
      },
      {
          "data": "onlyName"
      },
      {
          "data": "update_time"
      }],
//       "columnDefs": [{
//           // "visible": false,
//           //"targets": 0
//       },
//       {
//           "render": function(data, type, row, meta) {
//               //渲染 把数据源中的标题和url组成超链接
//               return '<a href="' + data + '" target="_blank">' + row.title + '</a>';
//           },
//           //指定是第三列
//           "targets": 2
//       }]

  });

  //前台添加序号
  t.on('order.dt search.dt',
  function() {
      t.column(0, {
          "search": 'applied',
          "order": 'applied'
      }).nodes().each(function(cell, i) {
          cell.innerHTML = i + 1;
      });
  }).draw();

  </script>