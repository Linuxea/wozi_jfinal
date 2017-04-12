package com.wozi.helpmanager.service;

import java.util.List;

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

}
