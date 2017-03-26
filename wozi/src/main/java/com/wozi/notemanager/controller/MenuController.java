package com.wozi.notemanager.controller;

import java.util.List;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
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
		int id = (int) this.service.getId(this.getModel(MenuModel.class),"id");
		this.renderJson("generatedId", id);
	}
	
	/**目录名称的修改*/
	public void update() {
		MenuModel model = this.getModel(MenuModel.class);
		boolean isSuccess = false;
		isSuccess = this.service.update(model);
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**用户所属目录的查找*/
	public List<Record> findMenu(String id) {
		return this.service.findMenu(id);
	}
	
	/**目录的删除*/
	public void del() {
		int menuId = this.getParaToInt("id");
		boolean isSuccess = this.service.del(new MenuModel().set("id", menuId));
		this.renderJson("isSuccess", isSuccess);
	}

}
