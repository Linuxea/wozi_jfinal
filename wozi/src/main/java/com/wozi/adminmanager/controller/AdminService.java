package com.wozi.adminmanager.controller;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class AdminService extends BaseService<Model<?>> {
	
	public List<Record> listMsg() {
		String listSql = "select wozi_leave.*, wozi_user.user_name from wozi_leave  "
				+ " left join wozi_user "
				+ " on wozi_leave.user_id = wozi_user.id "
				+ " order by create_time desc";
		return Db.find(listSql);
	}

	public void changeStatus(int id) {
		String querySql = "select status from wozi_leave where id = ?";
		String status = Db.queryStr(querySql, id);
		if(status.equals("0")){
			this.setStatus(id, "1");
		}else{
			this.setStatus(id, "0");
		}
	}
	
	public boolean setStatus(int id, String status){
		String changeSql = "update wozi_leave set status = ? where id = ?";
		int impact = Db.update(changeSql,status, id);
		return impact == 1;
	}
	
}
