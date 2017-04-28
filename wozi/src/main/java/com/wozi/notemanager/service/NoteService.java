package com.wozi.notemanager.service;


import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseService;
import com.wozi.notemanager.NoteVO;
import com.wozi.notemanager.model.NoteModel;
import com.wozi.utils.impl.PointImpl;

public class NoteService extends BaseService<NoteModel>{

	/**根据目录id查找该目录下的所有笔记并返回*/
	public Record findNote(int id) {
		String sql = "select * from WOZI_NOTE where id = ?";
		return Db.findFirst(sql, id);
	}


	@Before(Tx.class)
	/**笔记的创建或更新*/
	public Map<String, Object> add(NoteVO rs, int userId) {
		Map<String,Object> map = new HashMap<>();
		//通过id值来判断
		if(StringUtils.isNotEmpty(rs.getId())){
			NoteModel nm = new NoteModel();
			nm.set("create_time", new Date())
			.set("id", rs.getId())
			.set("update_time", new Date())
			.set("menu_id", rs.getRefMenu() )
			.set("title", rs.getTitle())
			.set("content", rs.getContent())
			.set("name", rs.getTitle())
			.set("user_id", userId);
			map.put("isSuccess", super.update(nm));
			map.put("isUpdate", true);
		}else{
			NoteModel nm = new NoteModel();
			nm.set("create_time", new Date())
			.set("update_time", new Date())
			.set("menu_id", rs.getRefMenu() )
			.set("title", rs.getTitle())
			.set("content", rs.getContent())
			.set("name", rs.getTitle())
			.set("user_id", userId);
			map.put("isSuccess", super.add(nm));
			map.put("isAdd", true);
		}
		return map;
	}

}
