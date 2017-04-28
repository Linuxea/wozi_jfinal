package com.wozi.base;

import com.jfinal.plugin.activerecord.Model;

/**curd base service*/
public class BaseService<T extends Model<?>> {
	
	/**model save*/
	public boolean add(T model) {
		boolean isSuccess = false;
		isSuccess = model.save();
		return isSuccess;
	}
	
	/**model del*/
	public boolean del(T model) {
		boolean isSuccess = false;
		isSuccess = model.delete();
		return isSuccess;
	}
	
	/**model update*/
	public boolean update(T model) {
		boolean isSuccess = false;
		isSuccess = model.update();
		return isSuccess;
	}
	
	/**model return newID
	 * @return */
	public <R> R getId(T model, String idName) {
		model.save();
		return (R)model.get(idName);
	}
	
}
