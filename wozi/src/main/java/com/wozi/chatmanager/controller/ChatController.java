package com.wozi.chatmanager.controller;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.chatmanager.client.SimpleChatClient;
import com.wozi.chatmanager.service.ChatService;

/**chat controller*/
public class ChatController extends BaseController {
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	private ChatService service = Duang.duang(ChatService.class, Tx.class);
	
	
	//跳转到聊天的主页面
	public void index(){
		this.renderJsp("/jsp/chat/chat.jsp");
	}
	
	//列出所有的好友
	public void listMyFriends(){
		int id = (int) this.getSession().getAttribute("UID");
		List<Record> rs = this.service.myFriends(id);
		super.map.put("isSuccess", true);
		super.map.put("friends", rs);
		this.renderJson(map);
	}
	
	
	//发送信息
	public void sent(){
		int to = this.getParaToInt("to");//sent to who
		String content = this.getPara("content");
	}
	
	
	
	/**new client connect*/
	public void touch(){
		if(this.isOn()){
			//表示此人已经在线上了
			this.renderJson("isSuccess", true);
			return;//cautious
		}
		
		String currentUserName = null;
		try {
			new Thread(new SimpleChatClient("localhost", 12345)).start();
			currentUserName = (String) this.getSession().getAttribute("UNAME");
			logger.info("有新的客户端接入了:" + currentUserName);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		}
//		this.renderJson("msg",currentUserName+"上线了");
		this.renderJson("isSuccess", true);
	}
	
	
	//下线
	@SuppressWarnings("unchecked")
	public void untouch(){
		//前提是已经登录了
		if(isOn()){
			boolean isOnline = true;
			int id = (int) this.getSession().getAttribute("UID");
			Set<Integer> online = (Set<Integer>) this.getSession().getAttribute("onList");
			String currentUserName = (String) this.getSession().getAttribute("UNAME");
			try{
				online.remove(id);
			}catch(Exception e){
				logger.error(currentUserName + "下线失败:" +e.getMessage());
				while(isOnline){//不断尝试下线  :>
					boolean ok = online.remove(id);
					if(ok){
						isOnline = false;
					}
				}
			}finally{
				logger.info(currentUserName + "下线啦!!!" + new Date());
			}
			
		}
		this.renderJsp("/jsp/note/MyNote.jsp");
	}
	
	
	//我要上线!!!!!!!!!
	//感觉这个没必要
	//如果session是每个客户端一个相互独立的副本的话
	//只需要一个标识位来判断该用户是登录的即可
	@SuppressWarnings("unchecked")
	private boolean isOn(){
		int id = (int) this.getSession().getAttribute("UID");
		Set<Integer> online = (Set<Integer>) this.getSession().getAttribute("onList");
		if(null == online){
			//表示还没有这个对象 自然没有这个人
			Set<Integer> sets = new HashSet<>();
			sets.add(id);//将当前用户放进去
			this.getSession().setAttribute("onList", sets);
		}else{
			if(online.contains(id)){
				//已经上线了
				return true;
			}else{
				Set<Integer> onlineSet = (Set<Integer>) this.getSession().getAttribute("onList");
				onlineSet.add(id);
				this.getSession().setAttribute("onList", onlineSet);
			}
		}
		return false;
	}

}
