package com.wozi.base.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**用户拦截器*/
public class LoginInterceptor implements Interceptor {

	@Override
	public void intercept(Invocation inv) {
		Controller controller = inv.getController();
		StringBuffer sb = controller.getRequest().getRequestURL();
		if(!sb.toString().endsWith("login")){
			if( null ==  controller.getSession().getAttribute("UID") ){
				//表示没登录 跳转到登录页面
				controller.render("/jsp/user/login.jsp");
			}else{
				System.out.println("通过登录拦截");
				inv.invoke();
			}
		}else{
			inv.invoke();
		}
	}

}
