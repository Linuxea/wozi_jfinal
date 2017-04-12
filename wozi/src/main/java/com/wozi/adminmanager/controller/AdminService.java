package com.wozi.adminmanager.controller;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class AdminService extends BaseService<Model<?>> {
	
	public List<Record> listMsg() {
		String listSql = "select * from wozi_leave order by create_time desc";
		return Db.find(listSql);
	}
	
}
