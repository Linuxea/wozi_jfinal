package com.wozi.base;

import com.jfinal.plugin.activerecord.Model;

/**curd base service*/
public class BaseService {
	
	/**model save*/
	public boolean add(Model<?> model) {
		boolean isSuccess = false;
		isSuccess = model.save();
		return isSuccess;
	}
	
	/**model del*/
	public boolean del(Model<?> model) {
		boolean isSuccess = false;
		isSuccess = model.delete();
		return isSuccess;
	}
	
	/**model update*/
	public boolean update(Model<?> model) {
		boolean isSuccess = false;
		isSuccess = model.update();
		return isSuccess;
	}
	
	/**model return newID*/
	public Object getId(Model<?> model, String idName) {
		model.save();
		return model.get(idName);
	}

}
