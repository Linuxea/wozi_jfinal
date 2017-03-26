package com.wozi.noteManager.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class NoteService extends BaseService{

	/**根据目录id查找该目录下的所有笔记并返回*/
	public List<Record> findNote(int id) {
		String sql = "select * from WOZI_NOTE where menu_id = ?";
		return Db.find(sql, id);
	}

}
