<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<body>
<div id="jstree">

</div>
<script src="https://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script>
  $(function () {
    $('#jstree').jstree({
    	"core": {
    	    'data' : [
    	        { "id" : "ajson1", "parent" : "#", "text" : "Simple root node" },
    	        { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
    	        { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
    	        { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
    	     ]
    	 }
    });
  });
</script>
</body>
</html>