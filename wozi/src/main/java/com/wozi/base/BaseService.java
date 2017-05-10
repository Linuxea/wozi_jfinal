package com.wozi.base;

import com.jfinal.plugin.activerecord.Model;

/**curd base service*/
public class BaseService<T extends Model<?>> {
	
	/**model save*/
	public boolean add(T model) {
		return model.save();
	}
	
	/**model del*/
	public boolean del(T model) {
		return model.delete();
	}
	
	/**model update*/
	public boolean update(T model) {
		return model.update();
	}
	
	/**model return newID
	 * @return */
	@SuppressWarnings("unchecked")
	public <R> R getId(T model, String idName) {
		if(model.save()){
			return (R)model.get(idName);
		}else{
			return null;
		}
	}
	
}
