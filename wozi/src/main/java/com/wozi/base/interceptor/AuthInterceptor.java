package com.wozi.base.interceptor;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.google.common.base.Splitter;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.Prop;
import com.jfinal.kit.PropKit;

/**
 * 权限拦截器
 * @author Administrator
 *
 */
public class AuthInterceptor implements Interceptor{

	@Override
	public void intercept(Invocation inv) {
		System.out.println("开始身份检验");
		
		Controller ctrl = inv.getController();
		HttpServletRequest request = ctrl.getRequest();
		String uri = request.getRequestURI();
		String url = request.getRequestURL().toString();
		
		System.out.println(url);
		
		String uname = (String) ctrl.getSession().getAttribute("UNAME");
		
		Prop prop = PropKit.use("auth.properties");
		
		String currentUri = prop.get(uri);
		
		if(Strings.isNullOrEmpty(currentUri)){
			inv.invoke();//every one can access
		}else{
			Splitter splitter = Splitter.on(",").omitEmptyStrings();
			Iterable<String> iter = splitter.split(currentUri);
			Set<String> admins = Sets.newHashSet(iter);//授权用户
			
			if(admins.contains(uname)){
				//包含当前用户
				inv.invoke();
			}else{
				Map<String, Object> returnMap = Maps.newHashMap();
				returnMap.put("isSuccess", false);
				returnMap.put("msg", "你不具备该权限");
				ctrl.renderJson(returnMap);
				return;
			}
		}
		
		
	}

}
