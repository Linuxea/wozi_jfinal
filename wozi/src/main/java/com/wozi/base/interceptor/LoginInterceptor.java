package com.wozi.base.interceptor;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**用户拦截器*/
public class LoginInterceptor implements Interceptor {
	
	private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public void intercept(Invocation inv) {
		Controller controller = inv.getController();
		StringBuffer sb = controller.getRequest().getRequestURL();
		if(sb.toString().endsWith("userController/login") || sb.toString().endsWith("userController/add")){
			inv.invoke();
		}else{
			if( null ==  controller.getSession().getAttribute("UID") ){
				logger.info("催促别人去登录...");
				controller.render("/jsp/user/login.jsp");
//				HttpServletResponse hsp = controller.getResponse();
//				hsp.setHeader("Location","/jsp/user/login.jsp");//try this to redicret
				return;
			}else{
				inv.invoke();
			}
		}
		System.out.println("via global Exception Interceptor:"+ this.getClass().getName());
	}

}
