package com.wozi.notemanager.service;


import java.util.Date;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.notemanager.NoteVO;
import com.wozi.notemanager.model.NoteModel;

public class NoteService extends BaseService<NoteModel>{

	/**根据目录id查找该目录下的所有笔记并返回*/
	public Record findNote(int id) {
		String sql = "select * from WOZI_NOTE where id = ?";
		return Db.findFirst(sql, id);
	}

	
	/**笔记的创建或更新*/
	public boolean add(NoteVO rs) {
		//通过id值来判断
		if(null!=rs.getId()){
			NoteModel nm = new NoteModel();
			nm.set("create_time", new Date())
			.set("id", rs.getId())
			.set("update_time", new Date())
			.set("menu_id", rs.getRefMenu() )
			.set("title", rs.getTitle())
			.set("content", rs.getContent())
			.set("name", rs.getTitle())
			.set("user_id", 1);
			return super.update(nm);
		}else{
			NoteModel nm = new NoteModel();
			nm.set("create_time", new Date())
			.set("update_time", new Date())
			.set("menu_id", rs.getRefMenu() )
			.set("title", rs.getTitle())
			.set("content", rs.getContent())
			.set("name", rs.getTitle())
			.set("user_id", 1);
			return super.add(nm);
		}
	}

}
