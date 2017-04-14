package com.wozi.base.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.wozi.base.BaseController;

/**用户拦截器*/
public class LoginInterceptor implements Interceptor {
	
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@SuppressWarnings("unchecked")
	@Override
	public void intercept(Invocation inv) {
		Controller controller = inv.getController();
		StringBuffer sb = controller.getRequest().getRequestURL();
		if(sb.toString().endsWith("userController/login") || sb.toString().endsWith("userController/add")){
			inv.invoke();
		}else{
			if( null ==  controller.getSession().getAttribute("UID") ){
				//表示没登录 跳转到登录页面
				controller.render("/jsp/user/login.jsp");
//				controller.forwardAction("com.wozi.base.BaseController");
			}else{
				inv.invoke();
			}
		}
		System.out.println("via global Exception Interceptor:"+ this.getClass().getName());
	}

}
