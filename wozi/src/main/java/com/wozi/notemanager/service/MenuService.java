package com.wozi.notemanager.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.notemanager.model.MenuModel;

public class MenuService extends BaseService<MenuModel> {

	/**查找当前登录用户所有的目录信息*/
	public List<Record> findMenu(int id) {
		String sql = "select * from WOZI_MENU where user_id = ?";
		return Db.find(sql, id);
	}

	public void reName(String currentMenuNodeId, String newTextName,int userId) {
		String upDateSql = "update wozi_menu set text = ? "
				+ " where id = ? "
				+ " and user_id = ?";
		Db.update(upDateSql, newTextName, currentMenuNodeId, userId);
	}

	public List<Record> findNode(String id, int user_id) {
		String querySql = "select * from wozi_note "
				+ " where user_id = ?"
				+ " and menu_id = ?";
		return Db.find(querySql, user_id, id);
	}

}
