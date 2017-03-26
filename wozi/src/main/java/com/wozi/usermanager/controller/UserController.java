package com.wozi.usermanager.controller;


import java.util.Date;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.usermanager.model.UserModel;
import com.wozi.usermanager.service.UserService;

public class UserController extends BaseController{
	
	private UserService service = Duang.duang(UserService.class, Tx.class);
	
	public void index() {
		this.renderJson("msg","hello!wozi_super is coming...");
	}
	
	/**用户的注册添加*/
	public void add(){
		UserModel model = this.getModel(UserModel.class);
		model.set("create_time", new Date())
			.set("update_time", new Date());
		int id = (int) this.service.getId(model,"id");
		this.renderJson("generatedId", id);
	}
	
	/**用户信息的修改*/
	public void update() {
		UserModel model = this.getModel(UserModel.class);
		boolean isSuccess = false;
		isSuccess = this.service.update(model);
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**用户登录*/
	public void login() {
		String userName = this.getPara("userName");
		String userPwd = this.getPara("password");
		Record record = this.service.login(userName, userPwd);
		if(record!=null){
			super.map.put("isSuccess", true);
			super.map.put("id", record.get("id"));
		}else{
			super.map.put("isSuccess", false);
			super.map.put("msg", "no this people!");
		}
		this.renderJson(super.map);
		
	}
	
	/**不提供用户注销*/
}
