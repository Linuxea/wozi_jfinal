/**js公共模块*/
var ip = null;
function getIp() {
	$.ajax({
		url:"http://172.17.0.1:8080/wozi/base/base_getIp",
		success:function(rs){
			ip = rs.data;
			console.log("ip", ip);
		},
		fail:function(){
			return null;
		},
	});
}