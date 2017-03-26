<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线搜索好友</title>
<link rel="stylesheet" href="../../plugins/datatable/css/dt.min.css"/>
<link rel="stylesheet" href="../../plugins/datatable/css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="../../plugins/datatable/css/dataTables.bootstrap4.min.css"/>
<link rel="stylesheet" href="../../plugins/datatable/css/dataTables.foundation.min.css"/>
<link rel="stylesheet" href="../../plugins/datatable/css/dataTables.jqueryui.min.css"/>
</head>
<body>
<table id = "friends">
<thead>
					<tr>
						<th>id</th>
						<th>用户名</th>
						<th>邮箱</th>
						<th>注册日期</th>
					</tr>
				</thead>
</table>

<script src="../../plugins/js/jquery-3.1.1.js"></script>
<script src="../../plugins/datatable/js/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatable/js/dt.min.js"></script>
<script src="../../plugins/datatable/js/dataTables.bootstrap.js"></script>
<script src="../../plugins/datatable/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatable/js/dataTables.foundation.min.js"></script>
<script src="../../plugins/datatable/js/dataTables.material.min.js"></script>
<script src="../../plugins/datatable/js/dataTables.semanticui.min.js"></script>
<script src="../../plugins/datatable/js/dataTables.uikit.min.js"></script>

<script>
$(function(){
	var table = null;
	table = $("#friends").dataTable({
		"ajax": "<%=request.getContextPath()%>/friendManage/friendManage_listAllPeoInfo",
		"bPaginate": true, //翻页功能
		"bLengthChange": true, //改变每页显示数据数量
		"bFilter": true, //过滤功能
		"bAutoWidth": true,//自动宽度
		"columns": [
			{ "data": "id" },
			{ "data": "userName" },
			{ "data": "email" },
			{ "data": "registdate" },
		],
	});

	$('#friends tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	} );
	$('#button').click( function () {
		table.row('.selected').remove().draw( false );
	} );
	
});

</script>
</body>
</html>