package com.wozi.searchManager.controller;

import java.util.List;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.searchManager.service.NoteSearchService;

@Before(Tx.class)
public class NoteSearchController extends BaseController {
	
	private NoteSearchService service = new NoteSearchService();
	
	public void index(){
		
	}
	
	public void search(){
		int userId = 1;
		//通过题目或者内容来搜索 返回笔记的id,title,createTime
		String titleOrContent = this.getPara("titleOrContent");
		List<Record> rs = this.service.findNote(titleOrContent, userId);
		this.renderJson(rs);
		
	}
	
}
