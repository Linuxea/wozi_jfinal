package com.wozi.usermanager.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

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
		boolean isOk = this.service.checkNotNull(model);
		Map<String,Object> resultMap = new HashMap<>();
		if(!isOk){
			resultMap.put("code", -1);
			resultMap.put("msg", "关键字段不能为空!");
		}else{
			model.set("create_time", new Date())
			.set("update_time", new Date());
		int id = (int) this.service.getId(model,"id");
		//注册成功新目录一个root根目录
		this.service.newRoot(id);
		resultMap.put("desc", "恭喜！注册成功");
		resultMap.put("code", 0);
		resultMap.put("id", id);
		}
		this.renderJson(resultMap);
	}
	
	/**用户信息的修改*/
	public void update() {
		UserModel um = new UserModel();//自己封装 :(
		um.set("age", this.getPara("age"))
			.set("email", this.getPara("email"))
			.set("sex", this.getPara("sex"))
			.set("intro", this.getPara("intro"))
			.set("id", this.getParaToInt("id"))
			.set("update_time", new Date());
		if(StringUtils.isNotEmpty(this.getPara("user_password"))){
			//表示有新的密码
			um.set("user_password", this.getPara("user_password"));
		}
		boolean isSuccess = false;
		isSuccess = this.service.update(um);
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
			int id = record.get("id");
			this.getSession().setAttribute("UID", id);//将用户的id放在session中
		}else{
			super.map.put("isSuccess", false);
			super.map.put("msg", "no this people!");
		}
		this.renderJson(super.map);
		
	}
	
	/**不提供用户注销*/
	
	
	/**返回当前登录人名称*/
	public void getCurrentName(){
		int userId = (int) this.getSession().getAttribute("UID");
		Record rs = this.service.findUser(userId);
		this.renderJson(rs);
	}
}
