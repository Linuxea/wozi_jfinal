package com.wozi.usermanager.service;


import java.util.Date;
import java.util.Objects;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseService;
import com.wozi.notemanager.model.MenuModel;
import com.wozi.usermanager.model.UserModel;

public class UserService extends BaseService<Model<?>> {

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
				Objects.isNull(model.getInt("age")) ||
				StringUtils.isEmpty(model.getStr("user_password"))){
			return false;
		}
			
		return true;
	}
	
	@Before(Tx.class)
	public void newRoot(int id) {
		MenuModel mm = new MenuModel();
		mm.set("id", "j1.0")
			.set("parent", "#")
			.set("text", "root")
			.set("create_time", new Date())
			.set("update_time", new Date())
			.set("user_id", id);
		super.add(mm);
	}

	//返回当前登录人的所有信息
	public Record findUser(int userId) {
		String querySql = "select * from wozi_user where id = ?";
		return Db.findFirst(querySql, userId);
	}

}
