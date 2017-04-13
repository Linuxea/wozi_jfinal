<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/plugins/swet/sweetalert.css" >  
<title>Insert title here</title>
</head>
<body>

<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert-dev.js"></script>
<script src="<%=request.getContextPath()%>/plugins/swet/sweetalert.min.js"></script>
<script>
	$(function(){
		funs.init();
	});
	
	var funs = {
			init : function(){
				swal("Here's a message!");
			},
	}
</script>
</body>
</html>