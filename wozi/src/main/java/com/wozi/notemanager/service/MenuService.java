package com.wozi.notemanager.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class MenuService extends BaseService {

	/**查找当前登录用户所有的目录信息*/
	public List<Record> findMenu(String id) {
		String sql = "select * from WOZI_MENU where user_id = ?";
		return Db.find(sql, id);
	}

}
