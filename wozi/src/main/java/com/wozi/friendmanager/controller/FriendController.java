package com.wozi.friendmanager.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.google.common.collect.Maps;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.friendmanager.model.FriendModel;
import com.wozi.friendmanager.model.MsgModel;
import com.wozi.friendmanager.service.FriendService;

/**用户好友模块*/
public class FriendController extends BaseController{
	
	
	private FriendService service = Duang.duang(FriendService.class, Tx.class);
	
	public void index(){
		
	}
	
	//根据条件过滤寻找好友
	public void find(){
		List<Record> list = this.service.findFriends();
		this.renderJson("data", list);
	}
	
	/**发出好友请求*/
	public void addFriend(){
		//根据当前登录人获取其个人id
		int id = (int) this.getSession().getAttribute("UID");
		int addedId = this.getParaToInt("addedId");
		FriendModel model = new FriendModel();
		model.set("add_side", id)
			.set("added_side", addedId)
			.set("create_time", new Date());
		this.service.add(model);
	}
	
	/**接受别人的好友添加请求*/
	public void accept(){
		int id = (int) this.getSession().getAttribute("UID");//当前登录者的id
		int otherId = this.getParaToInt("id");
		boolean isSuccess = this.service.accept(id, otherId);
		super.map.put("isSuccess", isSuccess);
		super.map.put("msg", "同意"+(isSuccess?"成功":"失败"));
		this.renderJson(super.map);
	}
	
	/**拒绝别人的好友添加请求*/
	public void deny(){
		int id = (int) this.getSession().getAttribute("UID");//当前登录者的id
		int otherId = this.getParaToInt("id");
		
		boolean isSuccess = this.service.del(id, otherId);
		
		super.map.put("isSuccess", isSuccess);
		super.map.put("msg", "拒绝他(她)们"+(isSuccess?"成功":"失败"));
		this.renderJson(super.map);
	}
	
	/**列出别人请求添加你为好友的信息列表*/
	public void listRequire(){
		int id = (int) this.getSession().getAttribute("UID");//当前登录者的id
		List<Record> list = this.service.listRequire(id);
		this.renderJson("data",list);
	}
	
	/**向别人发出好友请求*/
	public void sent(){
		int selfId = (int) this.getSession().getAttribute("UID");//自己的id
		int id = this.getParaToInt("id");//你想要添加的那个人的id
		FriendModel model = new FriendModel();
		model.set("add_side", selfId)
			.set("added_side", id)
			.set("create_time", new Date())
			.set("update_time", new Date());
		
		boolean isSent = this.service.isSent(selfId, id);
		
		if(isSent){
			map.put("isSuccess", false);
			map.put("msg", "之前已经发送添加请求了");
		}else{
			boolean isOk = this.service.add(model);
			if(isOk){
				map.put("isSuccess", isOk);
				map.put("msg", "发送添加成功");
			}else{
				map.put("isSuccess", isOk);
				map.put("msg", "发送添加失败");
			}
		}
		
		this.renderJson(map);
		
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
	
	/**列出我的好友*/
	public void list(){
		int id = (int) this.getSession().getAttribute("UID");//当前人id
		map.put("isSuccess", true);
		map.put("data", this.service.list(id));
		this.renderJson(map);
	}
	
	/**给我的好友留言*/
	public void sendMsg(){
		int id = (int) this.getSession().getAttribute("UID");//当前人id
		int toId = this.getParaToInt("id");
		String content  = this.getPara("content");
		MsgModel model = new MsgModel().set("sendId",id).set("receiverId", toId).set("content", content).set("create_time", new Date());
		boolean isSent = this.service.add(model);
		this.renderJson("isSuccess",isSent);
	}
	
	/**每隔一段时间去获取别人给我的留言信息*
	 */
	public void getMsg(){
		int id = (int) this.getSession().getAttribute("UID");//当前人id
		List<Record> lis = this.service.getMsg(id);
		this.renderJson(lis);
	}
	
}
