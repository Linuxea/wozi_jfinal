package com.wozi.base;


import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;

/**各个controller通用的组件可以写在这里*/
public class BaseController extends Controller{
	
	public Map<String,Object> map = new HashMap<>();
	
}
