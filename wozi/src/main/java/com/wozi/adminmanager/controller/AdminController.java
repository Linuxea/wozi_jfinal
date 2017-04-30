package com.wozi.adminmanager.controller;

import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.adminmanager.service.AdminService;
import com.wozi.base.BaseController;
import com.wozi.usermanager.model.UserModel;

public class AdminController extends BaseController {
	
	private AdminService service = Duang.duang(AdminService.class, Tx.class);
	public void index(){}
	
	//列出所有的留言列表给管理员看的
	public void listMsg(){
		List<Record> rs = this.service.listMsg();
		this.renderJson(rs);
	}	
	
	//状态切换
	public void changeStatus(){
		int id = this.getParaToInt("id");
		this.service.changeStatus(id);
		this.renderJson("isSuccess", true);
	}
	
	public void listUsers(){
		List<Record> rs = this.service.listUser();
		this.renderJson(rs);
	}
	
	//返回某个人的全部信息
	public void getDetail(){
		Map<String, Object> map = Maps.newHashMap();
		int id = this.getParaToInt("id");
		Record rs = this.service.getDetail(id);
		map.put("isSuccess", true);
		map.put("rs", rs);
		this.renderJson(map);
	}
	
	//获取用户性别人数图
	public void sexData(){
		Map<String, Object> rsMp = this.service.getSexData();
		this.renderJson(rsMp);
	}
	
	//获取用户年龄分布情况
	public void ageData(){
		Map<String, Object> rsMp = this.service.getAgeData();
		this.renderJson(rsMp);
	}
	
	//管理员删除用户接口
	public void delUser(){
		int id = this.getParaToInt("id");
		String adminName = this.service.findAdmin(id);
		if(adminName.equalsIgnoreCase("admin")){
			//这是管理员的账号 不能删除
			Map<String, Object> map = Maps.newHashMap();
			map.put("isSuccess", false);
			map.put("msg", "管理员账号不可删除");
			this.renderJson(map);
			return;
		}
		
		boolean isSuccess = this.service.del(new UserModel().set("id", id));
		//把其它的资料一并删除!
		this.service.delAbout(id);
		this.renderJson("isSuccess", isSuccess);
	}
	
	//管理员禁止用户接口
	public void stopUser(){
		int id = this.getParaToInt("id");
		this.service.stopUser(id);
	}
	
}
