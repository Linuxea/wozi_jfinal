<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>笔记分享</title>
<!-- 引入必须的css和js文件 -->
  <link rel="stylesheet" type="text/css" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" /> 
  <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css" /> 
  <link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/swet/sweetalert.css" >
  <script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.js"></script> 
  <script src="http://cdn.gbtags.com/datatables/1.10.5/js/jquery.dataTables.min.js"></script> 
  <script type="text/javascript" language="javascript" src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script> 
  <script src="<%=request.getContextPath()%>/plugins/swet/sweetalert-dev.js"></script>
  <script src="<%=request.getContextPath()%>/plugins/swet/sweetalert.min.js"></script>
  <!-- HTML代码片段中请勿添加<body>标签 //--> 
  </head>
  
  
  <nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#"></a>
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
      <th>操作</th>
     </tr> 
    </thead> 
    <tbody></tbody> 
    <!-- tbody是必须的 --> 
   </table> 
  </div> 
  <script>
  
  var rowData = null;
  var t = null;
  var noteId = null;
  
  var funs = {
		  init: function(){
			  funs.table();
			  funs.bindEvent();
			  funs.cli();
		  },
		  bindEvent: function(){
			  setTimeout(function(){
				  $("button.btn-share").on("click", function(){
					  funs.share(noteId,rowData.only);
				  });
			  }, 500);
		  },
		  cli: function(){
			  $("#example tbody").on("click", "tr", function(){
				  rowData = t.row(this).data();
				  console.log(rowData);//haha
			  });
		  },
		  table:function(){
			 t =  $('#example').DataTable({
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
			    	  "data": "status",
			      }],
			      "columnDefs": [{
			          // "visible": false,
			          //"targets": 0
			      },
			      {
			          "render": function(data, type, row, meta) {
			              //渲染 把数据源中的标题和url组成超链接
//			               return '<a href="' + data + '" target="_blank">' + row.title + '</a>';
							return "<button type=\"button\" class=\"btn btn-info btn-share\">分享</button>";
			          },
			          //指定是第三列
			          "targets": 2
			      }]

			  });
			  
			  t.on('order.dt search.dt',
					  function() {
					      t.column(0, {
					          "search": 'applied',
					          "order": 'applied'
					      }).nodes().each(function(cell, i) {
					          cell.innerHTML = i + 1;
					      });
					  }).draw();
		  },
		  
		  share:function(noteId, toId){
			  $.ajax({
				  url:"<%=request.getContextPath()%>/friendController/share",
				  data:{"noteId":noteId,"toId":toId},
				  success:function(rs){
					  if(rs.isSuccess){
						  swal("分享成功!", rs.msg, "success");
					  }else{
						  swal("分享失败!", rs.msg, "success");
					  }
				  },
				  error:function(){
					  swal("系统错误!", "系统没救了,请在留言区通知管理员，非常感谢", "error");
				  }
			  });
		  },
  }
  
  
  $(function(){
	  noteId = window.location.search.split("=")[1];
	  funs.init();
  });
  
  </script>