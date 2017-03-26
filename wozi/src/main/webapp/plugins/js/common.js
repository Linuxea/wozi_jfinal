/* 2016-12-18 begin  */
//将地址中的参数转化成对象存放
function handleSearchParams(href){
		var paramPair = {};
		var
			a = [],
			b = [],
			c = [];
		a = href.split("?");
		b = a[1].split("&");
		for(let i = 0,j = b.length;i<j;i++) {
			c = b[i].split("=");
			paramPair[c[0]] = c[1];
		}
		return paramPair;
	}
/* 2016-12-18 end  */

/* js生成一段随机id begin 来源stackoverflow */
function S4() {
	   return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
	}
function randomId() {
	   return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
	}
/* js生成一段随机id end 来源stackoverflow */