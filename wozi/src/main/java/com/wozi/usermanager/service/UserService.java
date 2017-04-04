package com.wozi.usermanager.service;


import org.apache.commons.lang3.StringUtils;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.usermanager.model.UserModel;

public class UserService extends BaseService<UserModel> {

	/**用户存在返回true,否则返回fasle*/
	public Record login(String userName, String pwd) {
		String sql = "select * from WOZI_USER where user_name = ?"
				+ " and user_password = ?";
		return Db.findFirst(sql, userName, pwd);
	}
	
	/**注册字段不为空字段的检测*/
	public boolean checkNotNull(UserModel model) {
		if(StringUtils.isEmpty(model.getStr("user_name")) ||
				StringUtils.isEmpty(model.getStr("sex")) ||
				StringUtils.isEmpty(model.getStr("age")) ||
				StringUtils.isEmpty(model.getStr("user_password"))){
			return false;
		}
			
		return true;
	}

}
