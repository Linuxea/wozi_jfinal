package com.wozi.friendmanager.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.common.collect.*;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.friendmanager.model.FriendModel;
import com.wozi.friendmanager.service.FriendService;

/**用户好友模块*/
public class FriendController extends BaseController{
	
	
	private FriendService service = Duang.duang(FriendService.class, Tx.class);
	
	public void index(){
		
	}
	
	//根据条件过滤寻找好友
	public void find(){
		int sex = this.getParaToInt("sex");
		int age = this.getParaToInt("age");
		String orderField = this.getPara("orderField");
		List<Record> list = this.service.findFriends(sex, age, orderField);
		this.renderJson("friends", list);
	}
	
	/**发出好友请求*/
	public void addFriend(){
		//根据当前登录人获取其个人id
		int id = 0;
		int addedId = this.getParaToInt("addedId");
		FriendModel model = new FriendModel();
		model.set("add_side", id)
			.set("added_side", addedId)
			.set("create_time", new Date());
		this.service.add(model);
	}
	
	/**接受别人的好友添加请求*/
	public void accept(){
		//传来那条好友申请添加记录的id
		int id = this.getParaToInt("id");
		FriendModel model = new FriendModel();
		model.set("id", id)
		.set("added_pass", "1");
		this.service.update(model);
	}
	
	/**拒绝别人的好友添加请求*/
	public void deny(){
		//传来那条好友申请添加记录的id
		int id = this.getParaToInt("id");
		FriendModel model = new FriendModel();
		model.set("id", id)
		.set("added_pass", "2");
		this.service.update(model);		
	}
	
	/**列出别人请求添加你为好友的信息列表*/
	public void listRequire(){
		int id = 0;//当前登录者的id
		List<Record> list = this.service.listRequire(id);
		this.renderJson(list);
	}
	
	/**向别人发出好友请求*/
	public void sent(){
		int selfId = 0;//自己的id
		int id = this.getParaToInt("id");//你想要添加的那个人的id
		FriendModel model = new FriendModel();
		model.set("add_side", selfId)
			.set("added_side", id)
			.set("create_time", new Date());
		this.service.add(model);
	}
	
	/**分享笔记*/
	public void share(){
		int noteId = this.getParaToInt("noteId");
		int id = (int) this.getSession().getAttribute("UID");//当前人id
		int to = this.getParaToInt("toId");//对方id 目前做成一个的
		
		boolean isSuccess = this.service.share(noteId, id, to);
		Map<String, Object> returnMap = Maps.newHashMap();
		returnMap.put("isSuccess", isSuccess);
		this.renderJson(returnMap);
	}
	
	/**查看別人給我分享的筆記*/
	public void shareToMe(){
		int id = (int) this.getSession().getAttribute("UID");//当前人id
		
		List<Record> rs = this.service.shareToMe(id);
		
		this.renderJson(rs);
	}
	
	/**查看我分享給別人的筆記*/
	public void shareFromMe(){
		int id = (int) this.getSession().getAttribute("UID");//当前人id
		
		List<Record> rs = this.service.shareFromMe(id);
		
		this.renderJson(rs);
	}
	
	
	
}
