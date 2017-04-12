package com.wozi.helpmanager.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.jfinal.aop.Before;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.helpmanager.model.LeaveMsg;
import com.wozi.helpmanager.service.HelpService;

@Before(Tx.class)
public class HelpController extends BaseController {
	
	private HelpService service = Duang.duang(HelpService.class, Tx.class);
	
	public void index(){
	}
	
	//列出所有的留言列表给管理员看的
	public void listMsg(){
		List<Record> rs = this.service.listMsg();
		this.renderJson(rs);
	}
	
	//列出自己的留言列表
	public void listMyMsg(){
		int id = (int)this.getSession().getAttribute("UID");
		List<Record> list = this.service.listMyMsg(id);
		this.renderJson(list);
		
	}
	
	//留言
	public void leaveMsg(){
		int id = (int)this.getSession().getAttribute("UID");
		//留言检测  一天只能留言一条
		Map<String, Object> map = this.service.isToday(id);
		if(!(Boolean)map.get("isSuccess")){
			this.renderJson(map);
			return;
		}
		LeaveMsg msg = new LeaveMsg();
		String title = this.getPara("title");
		String content = this.getPara("content");
		msg.set("content", content)
			.set("create_time", new Date())
			.set("title", title)
			.set("user_id", id);
		boolean isSuccess = this.service.add(msg);
		this.renderJson("isSuccess", isSuccess);
	}

}
