package com.wozi.base;

import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.core.Controller;

/**各个controller通用的组件可以写在这里*/
public class BaseController extends Controller{
	
	private Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	private String currentUserName = null;
	
	/**用来封装返回map*/
	public ConcurrentHashMap<String, Object> maps = new ConcurrentHashMap<>();
	
	public BaseController() {
		try{
			if(null == currentUserName){
				currentUserName = this.getRequest().getUserPrincipal().getName();
			}
		}catch(Exception e){
			logger.error("用户跳过登录");
			//request对象可能没有生成 
			currentUserName = "unLoginUser";
		}finally{
		}
	}
}
