package com.wozi.base;


import java.util.Map;

import com.google.common.collect.Maps;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.TableMapping;

/*
 *@date      2017年4月28日 下午12:13:21
 *@desc      基础serivce
 *@version   1.0
 *@author    linuxea
 */
@SuppressWarnings("unchecked")
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
	
	
	/**model return newID*/
	protected <R> R  saveAndGetKey(T model) {
		String idColName = keyPrimaryColumnName(model);
		if(model.save()){
			return (R) model.get(idColName);
		}
		
		return null;
		
	}
	
	protected <K, V> Map<K,V> saveAndGetSomeColumnsValues(T model, String...params){
		Map<K,V> map = Maps.newHashMap();
		if(model.save()){
			for(int i = 0;i<params.length;i++){
				map.put((K)params[i],(V)model.get(params[i]));
			}
		}else{
			return null;
		}
		
		return map;
		
	}
	
	//通过model去找id列名 :) 一般是单主键不考虑复合主键的情况。否则返回map也不是很方便
	private String keyPrimaryColumnName(T t){
		Table table = TableMapping.me().getTable(t.getClass());
		return table.getPrimaryKey()[0];
	}
	
	
}

