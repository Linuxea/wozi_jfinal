package com.wozi.searchManager.controller;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseController;
import com.wozi.searchManager.service.NoteSearchService;
import com.wozi.utils.impl.PointImpl;

public class NoteSearchController extends BaseController {
	
	private NoteSearchService service = new NoteSearchService();
	
	public void index(){
		
	}
	
	public void search(){
		int userId = (int) this.getSession().getAttribute("UID");
		PointImpl.me.opPoint(userId, +2, "查找笔记添加两分");//查找笔记
		//通过题目或者内容来搜索 返回笔记的id,title,createTime
		String titleOrContent = this.getPara("titleOrContent");
		List<Record> rs = this.service.findNote(titleOrContent, userId);
		this.renderJson(rs);
		
	}
	
}
