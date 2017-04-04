package com.wozi.notemanager.controller;


import java.util.Date;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.notemanager.model.MenuModel;
import com.wozi.notemanager.service.MenuService;

/**目录的controller*/
public class MenuController extends BaseController {
	private MenuService service = Duang.duang(MenuService.class, Tx.class);
	public void index() {
		
	}
	
	/**目录的添加*/
	public void add(){
		//directMenuParentId   newNodeId
		String directMenuParentId = this.getPara("directMenuParentId");
		String newNodeId = this.getPara("newNodeId");
		MenuModel model = this.getModel(MenuModel.class);
		model.set("parent", directMenuParentId)
			.set("id", newNodeId)
			.set("text", "new node")
			.set("create_time", new Date())
			.set("update_time", new Date())
			.set("user_id", 1);
		this.service.add(model);
		this.renderJson("msg","create menu ok");
	}
	
	/**目录名称的修改*/
	public void update() {
		MenuModel model = this.getModel(MenuModel.class);
		boolean isSuccess = false;
		isSuccess = this.service.update(model);
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**用户所属目录的查找*/
	public void findMenu() {
		int id = 1;//this.getParaToInt("id");
		this.renderJson(this.service.findMenu(id));
	}
	
	/**目录的删除*/
	public void del() {
		int menuId = this.getParaToInt("id");
		boolean isSuccess = this.service.del(new MenuModel().set("id", menuId));
		this.renderJson("isSuccess", isSuccess);
	}
	
	

}
