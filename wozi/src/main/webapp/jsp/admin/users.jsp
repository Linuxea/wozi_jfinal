<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>所有用户信息</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid"> 
    <div class="navbar-header">
        <a class="navbar-brand"><span class="glyphicon glyphicon-book" style="color:#fff;">&nbsp;</span><strong>用户信息中心</strong></a>
    </div>
    
    </div>
</nav>


<div class="container main">
	<div class="panel-heading">
		<!-- 留空白 好看 -->
	</div>

<form id="msgs">
<table class="table table-striped">
	<caption>所有用户信息</caption>
	<thead>
		<tr>
			<th>用户名</th>
			<th>性别</th>
			<th>年龄</th>
			<th>邮箱</th>
			<th style="display:none;">id</th>
		</tr>
	</thead>
	<tbody id = "msgBody">
	</tbody>
</table>
</form>
<div style="height:250px;width:900px;">
<div style="height:250px;width:450px;">
	<div id="EForm" style="height:250px;width:450px;"></div>
</div>
<div style="height:250px;width:450px;">
	<div id="EForm2" style="height:250px;width:450px;"></div>
</div>
</div>
</div>
<script src="<%=request.getContextPath()%>/plugins/js/jquery-3.1.1.js"></script>
<script src="<%=request.getContextPath()%>/plugins/echart/echarts.js"></script>
<script>
	var myChart = null;
	
	$(function(){
		funs.init();
		funs.getUser();
		funs.eInit();
	});
	
	var funs = {
			init: function(){
				
			},
			getUser: function(){
				$.ajax({
			     	url: "<%=request.getContextPath()%>/adminController/listUsers",
			     	dataType:"json",
			     	success:function(rs){
			     		//先清空原来的
			     		$("#msgBody").html("");
			     		var str = "";
			     		for(var i in rs){
			     			str += "<tr><td>"+rs[i].user_name+"</td><td>"+rs[i].sex+"<td>"+rs[i].age+"</td><td>"+rs[i].email+"</td>";
// 			     			str += "<td>"+rs[i].create_time+"</td>";
// 			     			str += "<td>"+rs[i].update_time+"</td>";
			     			str += "<td style=\"display:none;\">"+rs[i].id+"</td>";
			     			str +="</tr>";
			     		}
			     		$("#msgBody").append(str);
			     		funs.detail();
			     		funs.colorCh();
			     	}
			     });
			},
			detail: function(){
				$("#msgBody>tr").on("click", function(){
					var id = $(this).find("td:eq(4)").text();
					window.location.href="detail.jsp?id="+id;
				});
			},
			colorCh: function(){
				var oldColor= null;
				$("#msgBody>tr").hover(function(){
					oldColor=$(this).css("background");
					$(this).css("background", "lightgray");
				}, function(){
					$(this).css("background", oldColor);
				});
			},
			eInit: function(){
				myChart = echarts.init(document.getElementById('EForm'));
				myChart2 = echarts.init(document.getElementById('EForm2'));
				myChart.showLoading();
				myChart2.showLoading();
				funs.eSetData();
				funs.secondChart();
			},
			eSetData : function(){
				var data = null;
				$.ajax({
					url:"<%=request.getContextPath()%>/adminController/sexData",
					type:"post",
					success: function(rs){
						data = rs.data;
						option = {
							    backgroundColor: '#c23531',

							    title: {
							        text: '用户性别分布',
							        left: 'center',
							        top: 20,
							        textStyle: {
							            color: '#ccc'
							        }
							    },

							    tooltip : {
							        trigger: 'item',
							        formatter: "{a} <br/>{b} : {c} ({d}%)"
							    },

							    visualMap: {
							        show: false,
							        min: 80,
							        max: 600,
							        inRange: {
							            colorLightness: [0, 1]
							        }
							    },
							    series : [
							        {
							            name:'访问来源',
							            type:'pie',
							            radius : '55%',
							            center: ['50%', '50%'],
							            data:data,
							            roseType: 'angle',
							            label: {
							                normal: {
							                    textStyle: {
							                        color: 'rgba(255, 255, 255, 0.3)'
							                    }
							                }
							            },
							            labelLine: {
							                normal: {
							                    lineStyle: {
							                        color: 'rgba(255, 255, 255, 0.3)'
							                    },
							                    smooth: 0.2,
							                    length: 10,
							                    length2: 20
							                }
							            },
							            itemStyle: {
							                normal: {
							                    color: 'orange',
							                    shadowBlur: 200,
							                    shadowColor: 'green'
							                }
							            },

							            animationType: 'scale',
							            animationEasing: 'elasticOut',
							            animationDelay: function (idx) {
							                return Math.random() * 200;
							            }
							        }
							    ]
							};

					        // 使用刚指定的配置项和数据显示图表。
					        myChart.setOption(option);
					        myChart.hideLoading();

					}
				});
			},
			secondChart : function(){
				var name = null;
				var value = null;
				$.ajax({
					url:"<%=request.getContextPath()%>/adminController/ageData",
					type:"post",
					success: function(rs){
						name = rs.name;
						value = rs.value;
						
						var option = {
					            title: {
					                text: '年龄分布图'
					            },
					            tooltip: {},
					            legend: {
					                data:['age']
					            },
					            xAxis: {
					                data: name,
					            },
					            yAxis: {},
					            series: [{
					                name: 'age',
					                type: 'bar',
					                data: value,
					            }]
					        };
						myChart2.setOption(option);
						myChart2.hideLoading();
			
					}
				});
			}
			
			
	}
	
</script>
</body>
</html>