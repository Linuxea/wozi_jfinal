package com.wozi.userManager.service;


import com.jfinal.plugin.activerecord.Db;
import com.wozi.base.BaseService;

public class UserService extends BaseService {

	/**用户存在返回true,否则返回fasle*/
	public boolean login(String userName, String pwd) {
		String sql = "select count(*) from WOZI_USER where user_name = ?"
				+ " and user_password = ?";
		long count = Db.queryLong(sql, userName, pwd);
		return count == 1;
	}

}
