package com.wozi.usermanager.service;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class UserService extends BaseService {

	/**用户存在返回true,否则返回fasle*/
	public Record login(String userName, String pwd) {
		String sql = "select * from WOZI_USER where user_name = ?"
				+ " and user_password = ?";
		return Db.findFirst(sql, userName, pwd);
	}

}
