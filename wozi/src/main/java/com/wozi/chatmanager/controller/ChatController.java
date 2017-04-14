package com.wozi.chatmanager.controller;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wozi.base.BaseController;
import com.wozi.chatmanager.client.SimpleChatClient;

/**chat controller*/
public class ChatController extends BaseController {
	
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	/**new client connect*/
	public void touch(){
		if(this.isOn()){
			//表示此人已经在线上了
			this.renderJson("msg","你已经在线上了!!!");
			return;//cautious
		}
		
		String currentUserName = null;
		try {
			new Thread(new SimpleChatClient("localhost", 12345)).start();
			currentUserName = (String) this.getSession().getAttribute("UNAME");
			logger.info("有新的客户端接入了:" + currentUserName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.renderJson("msg",currentUserName+"上线了");
	}
	
	//我要上线!!!!!!!!!
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
