package com.wozi.base;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.core.Controller;

/**各个controller通用的组件可以写在这里*/
public class BaseController extends Controller{
	
	private Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	protected String currentUserName = null;
	
	protected Map<String, Object> map = new HashMap<>();
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
