package com.wozi.notemanager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.notemanager.model.MenuModel;

public class MenuService extends BaseService<MenuModel> {

	/**查找当前登录用户所有的目录信息*/
	public List<Record> findMenu(int id) {
		String sql = "select * from WOZI_MENU where user_id = ? order by create_time desc";
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
				+ " and menu_id = ? "
				+ " order by create_time desc";
		return Db.find(querySql, user_id, id);
	}

	public int delNoteByMenuId(String menuId, int userId) {
		String delSql = "delete from wozi_note where menu_id = ? and user_id = ?";
		int impact = Db.update(delSql, menuId, userId);//总数几行受影响
		return impact;
	}

	public boolean delMenu(String menuId, int userId) {
		String delSql = "delete from wozi_menu where id=? and user_id = ?";
		int count = Db.update(delSql, menuId, userId);
		return count == 1;
		
	}

	public Map<String, Object>  checkMenu(String menuId, int userId) {
		Map<String, Object> rsMap = new HashMap<>();
		String selectSql = "select parent from wozi_menu where id = ? "
				+ " and user_id = ?";
		String isRoot = Db.queryStr(selectSql, menuId, userId);
		if(null!=isRoot && isRoot.equals("#")){
			//根目录不能删除
			rsMap.put("isSuccess", false);
			rsMap.put("msg", "根目录不能删除");
		}else{
			//有子目录的不能删除
			String subQuery = "select count(*) from wozi_menu "
					+ " where parent = ? and user_id = ?";
			long count = Db.queryLong(subQuery, menuId, userId);
			if(count>0){
				rsMap.put("isSuccess", false);
				rsMap.put("msg", "该目录有子目录不能直接删除!");
			}else{
				rsMap.put("isSuccess", true);
				rsMap.put("msg", "该目录可以删除");
			}
		}
		
		return rsMap;
	}

	
}
