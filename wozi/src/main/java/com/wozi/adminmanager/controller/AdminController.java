package com.wozi.adminmanager.controller;

import java.util.List;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;

public class AdminController extends BaseController {
	
	private AdminService service = Duang.duang(AdminService.class, Tx.class);
	public void index(){}
	
	//列出所有的留言列表给管理员看的
	public void listMsg(){
		List<Record> rs = this.service.listMsg();
		this.renderJson("data",rs);
	}	
	
}
