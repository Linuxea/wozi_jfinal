package com.wozi.helpmanager.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.helpmanager.model.LeaveMsg;

public class HelpService extends BaseService<LeaveMsg>{

	public List<Record> listMyMsg(int id) {
		String listSql = "select * from wozi_leave where user_id = ?"
				+ " order by create_time desc";
		return Db.find(listSql, id);
	}

	public List<Record> listMsg() {
		String listSql = "select * from wozi_leave order by create_time desc";
		return Db.find(listSql);
	}

	public Map<String, Object> isToday(int id) {
		Map<String, Object> map  = new HashMap<>();
		String sql = "select max(id) from wozi_leave where user_id = ?";
		int maxId = 0;
		try{ 
			//第一次留言会报空指针 
			//利用异常来做业务
			maxId = Db.queryInt(sql, id);
		}catch(Exception e){
			map.put("isSuccess", true);
			return map;
		}
		String seSql = "select create_time from wozi_leave where user_id = ?"
				+ " and id = ?";
		Date date = Db.queryDate(seSql, id, maxId);
		if(System.currentTimeMillis() - date.getTime() <= 24*60*60*60){
			//还没过24小时
			map.put("isSuccess", false);
			map.put("msg", "请再过24小时留言~");
		}else{
			map.put("isSuccess", true);
		}
		return map;
	}

}
