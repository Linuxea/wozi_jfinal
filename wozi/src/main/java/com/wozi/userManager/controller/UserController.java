package com.wozi.userManager.controller;


import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.userManager.model.UserModel;
import com.wozi.userManager.service.UserService;

public class UserController extends BaseController{
	
	private UserService service = Duang.duang(UserService.class, Tx.class);
	
	public void index() {
		this.renderJson("msg","hello!wozi_super is coming...");
	}
	
	/**用户的注册添加*/
	public void add(){
		int id = (int) this.service.getId(this.getModel(UserModel.class),"id");
		super.maps.put("generatedId", id);
		this.renderJson(super.maps);
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
		boolean isLogin = false;
		String userName = this.getPara("loginName");
		String userPwd = this.getPara("pwd");
		isLogin = this.service.login(userName, userPwd);
		this.renderJson(super.maps.put("isSuccess", isLogin));
	}
	
	/**不提供用户注销*/
}
