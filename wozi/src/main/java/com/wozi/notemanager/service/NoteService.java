package com.wozi.notemanager.service;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.notemanager.model.NoteModel;

public class NoteService extends BaseService<NoteModel>{

	/**根据目录id查找该目录下的所有笔记并返回*/
	public Record findNote(int id) {
		String sql = "select * from WOZI_NOTE where id = ?";
		return Db.findFirst(sql, id);
	}

}
