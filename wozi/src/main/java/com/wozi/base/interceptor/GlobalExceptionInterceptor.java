package com.wozi.base.interceptor;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**全局异常拦截器*/
public class GlobalExceptionInterceptor implements Interceptor {

	private Logger logger = LoggerFactory.getLogger(GlobalExceptionInterceptor.class);
	
	public void intercept(Invocation inv) {
		try{
			inv.invoke();
		}catch(Exception e) {
			logger.error(e.getMessage());
		}finally{
			Controller controller = inv.getController();
			Map<String, Object> map = new HashMap<>();
			map.put("errorMsg", "system error!");
			controller.renderJson(map);
		}
	}

}
