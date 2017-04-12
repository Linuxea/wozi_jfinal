package com.wozi.notemanager.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.notemanager.model.MenuModel;
import com.wozi.notemanager.service.MenuService;

/**目录的controller*/
@Before(Tx.class)
public class MenuController extends BaseController {
	private MenuService service = Duang.duang(MenuService.class, Tx.class);
	public void index() {
		
	}
	
	/**目录的添加*/
	public void add(){
		//directMenuParentId   newNodeId
		int userId = (int) this.getSession().getAttribute("UID");
		String directMenuParentId = this.getPara("directMenuParentId");
		String newNodeId = this.getPara("newNodeId");
		MenuModel model = this.getModel(MenuModel.class);
		model.set("parent", directMenuParentId)
			.set("id", newNodeId)
			.set("text", "new node")
			.set("create_time", new Date())
			.set("update_time", new Date())
			.set("user_id", userId);
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
		int id = (int) this.getSession().getAttribute("UID");
		this.renderJson(this.service.findMenu(id));
	}
	
	/**目录的删除与该目录下所有笔记的删除*/
	public void del() {
		int userId = (int) this.getSession().getAttribute("UID");
		String menuId = this.getPara("currentMenuNodeId");
		/**目录的删除检查 根目录不能删除,有子目录的不能删除*/
		Map<String, Object> checkMap = this.service.checkMenu(menuId, userId);
		if(!((Boolean)checkMap.get("isSuccess"))){
			this.renderJson(checkMap);
			return;
		}
		//删除目录
		boolean isSuccess = this.service.delMenu(menuId, userId);
		//删除该目录下的笔记
		int impact = this.service.delNoteByMenuId(menuId, userId);
		Map<String,Object> map = new HashMap<>();
		map.put("impact", impact);
		map.put("isSuccess", isSuccess);
		this.renderJson(map);
	}
	
	/**目录重新命名*/
	public void reName(){
		int id = (int) this.getSession().getAttribute("UID");
		String currentMenuNodeId  = this.getPara("currentMenuNodeId");
		String newTextName = this.getPara("newTextName");
		this.service.reName(currentMenuNodeId, newTextName, id);
		this.renderJson("msg","rename ok！");
	}
	
	/**列出某目录下的所有笔记*/
	public void listNote(){
		String id = this.getPara("currentMenuNodeId");
		//需要用户的Id
		int user_id = (int) this.getSession().getAttribute("UID");
		this.renderJson(this.service.findNode(id,user_id));
	}
	
	

}
