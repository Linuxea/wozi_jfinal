package com.wozi.searchManager.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.searchManager.model.NoteModel;

public class NoteSearchService extends BaseService<NoteModel>{

	public List<Record> findNote(String titleOrContent, int userId) {
		String queryNoteSql = "select * from wozi_note "
				+ " where user_id = ? "
				+ " and "
				+ " title like "+ "'%"+titleOrContent+"%'";
//				+ " or content like "+"'%"+titleOrContent+"%'";
		return 
				Db.find(queryNoteSql,userId);
		
	}

}
