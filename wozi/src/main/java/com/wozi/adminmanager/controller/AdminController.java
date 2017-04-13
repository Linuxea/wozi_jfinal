package com.wozi.adminmanager.controller;

import java.util.List;
import java.util.Map;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.adminmanager.service.AdminService;
import com.wozi.base.BaseController;

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
		int id = this.getParaToInt("id");
		Record rs = this.service.getDetail(id);
		this.renderJson(rs);
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
	
}
