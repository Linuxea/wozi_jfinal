package com.wozi.base;


import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

/*
 *@date      2017年4月28日 下午12:13:21
 *@desc      基础serivce
 *@version   1.0
 *@author    linuxea
 */

public class BaseService<T extends Model<?>> {
	
	/**model save*/
	protected boolean add(T model) {
		return model.save();
	}
	
	/**model del*/
	protected boolean del(T model) {
		return model.delete();
	}
	
	/**model update*/
	protected boolean update(T model) {
		return model.update();
	}
	
	@SuppressWarnings("unchecked")
	/**model return newID*/
	protected <R> R  saveAndGetKey(T model) {
		String idColName = keyPrimaryColumnName(model);
		if(model.save()){
			return (R) model.get(idColName);
		}else{
			return null;
		}
		
	}
	
	//通过model去找id列名 :) 一般是单主键不考虑复合主键的情况。否则返回map也不是很方便
	private String keyPrimaryColumnName(T t){
		Table table = TableMapping.me().getTable(t.getClass());
		return table.getPrimaryKey()[0];
	}
	
	
}

