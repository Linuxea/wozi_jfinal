package com.wozi.utils.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.wozi.base.BaseService;

public class PointService extends BaseService<Model<?>>{

	public boolean addPoint(int id, int point) {
		String sql = "update wozi_user_point set  point+=? where user_id = ?";
		int count = Db.update(sql, point);
		return count == 1;
	}

	public boolean subPoint(int id, int point) {
		String sql = "select point from wozi_user_point where user_id  =?";
		int count = Db.queryInt(sql, id);
		String newSql = null;
		if(point>count){
			//全部扣除
			newSql = "update wozi_user_point set point = 0 where user_id = ?";
		}else{
			newSql = "update wozi_user_point set point-=? where user_id = ?";
		}
		int infect = Db.update(newSql, id);
		return infect == 0;
	}
	
	

}
