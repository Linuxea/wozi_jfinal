<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加好友</title>
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
        <a class="navbar-brand" href="#">添加</a>
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
      <th>性别</th>
      <th>个人介绍</th>
      <th>添加</th>
     </tr> 
    </thead> 
    <tbody></tbody> 
    <!-- tbody是必须的 --> 
   </table> 
  </div> 
  <script>
  
  var rowData = null;
  var t = null;
  
  var funs = {
		  init: function(){
			  funs.table();
			  funs.bindEvent();
			  funs.cli();
		  },
		  bindEvent: function(){
			setTimeout(function(){
				$("button.btn-add").on("click", function(){
					swal({
						  title: "确认添加该好友吗?",
						  text: "",
						  type: "success",
						  showCancelButton: true,
						  confirmButtonColor: "#DD6B55",
						  confirmButtonText: "是的!我确定",
						  cancelButtonText: "不,我取消",
						  closeOnConfirm: false,
						  closeOnCancel: false
						},
						function(isConfirm){
// 							alert(isConfirm);
							if(isConfirm){
								funs.add();
							}else{
								swal("Cancelled", "", "error");
								
							}
						});
				});  
			}, 1000);
		  },
		  cli: function(){
			  $("#example tbody").on("click", "tr", function(){
				  rowData = t.row(this).data();
				  console.log(rowData);//haha
			  });
		  },
		  add:function(){
			  //提取出所想要添加的那个人的id
			  var id = rowData.id;
			  $.ajax({
				  url:"<%=request.getContextPath()%>/friendController/sent",
				  data:{id:id},
				  type:"post",
				  success:function(rs){
					  if(rs.isSuccess){
						  swal(rs.msg, rs.msg, "success");
					  }else{
						  swal(rs.msg, rs.msg, "error");
					  }
				  },
				  error:function(){
					  alert("system error");
				  }
			  });
		  },
		  table:function(){
			 t =  $('#example').DataTable({
			      ajax: {
			          //指定数据源
			          url: "<%=request.getContextPath()%>/friendController/find"
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
			          "data": "user_name"
			      },
			      {
			          "data": "sex"
			      },
			      {
			          "data": "intro"
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
							if(data==="girl")return "女生";
							else return "男生";
			          },
			          //指定是第三列
			          "targets": 2
			      },
			      {
			          "render": function(data, type, row, meta) {
			              //渲染 把数据源中的标题和url组成超链接
//			               return '<a href="' + data + '" target="_blank">' + row.title + '</a>';
							if(data===1)return "<button type=\"button\" class=\"btn btn-info btn-add\">添加</button>";
			          },
			          //指定是第三列
			          "targets": 4
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
		  }
  }
  
  
  $(function(){
	  funs.init();
  });
  
  </script>