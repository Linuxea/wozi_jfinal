package com.wozi.utils.service;

import java.util.Date;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class PointService extends BaseService<Model<?>>{

	
	public boolean opPoint(int id, int point,String comment) {
		String sql = "insert into wozi_user_point(user_id,point,create_time,update_time,status,comment) values(?,?,?,?,?,?) ";
		int count = Db.update(sql, id, point,new Date(), new Date(), 1,comment);
		return count == 1;
	}

	

	public List<Record> listTrace(int id) {
		String sql = "select * from wozi_user_point where userId = ? order by create_time desc";
		return Db.find(sql, id);
	}

	public int countPoint(int userId) {
		String sql = "select point from wozi_user_point where userId = ? ";
		List<Record> rs = Db.find(sql, userId);
		int sum = 0;
		for(Record temp: rs){
			sum += temp.getInt("point");
		}
		return sum;
	}



	public List<Record> listHi(int userId) {
		String sql = "select id,create_time,comment,point from wozi_user_point where"
				+ " user_id = ? order by create_time desc";
		return Db.find(sql, userId);
	}



	public int getCount(int userId) {
		String sql = "select sum(point) from wozi_user_point where user_id = ?";
		return Integer.valueOf(Db.queryBigDecimal(sql, userId).toString());
	}
	

}
