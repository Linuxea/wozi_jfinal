package com.wozi.base.plugins;

import com.jfinal.plugin.IPlugin;
import com.wozi.chatmanager.server.SimpleChatServer;

/**聊天服务器插件*/
public class ChatServerPlugin implements IPlugin {
	
	private volatile boolean isStart = false;
	
	@Override
	public boolean start() {
		int port = 12345;
		try {
			new Thread(new SimpleChatServer(port)).start();
		} catch (Exception e) {
			e.printStackTrace();
		}
		isStart = true;
		if(isStart)System.out.println("聊天服务器启动了!");
		return true;
	}

	@Override
	public boolean stop() {
		if(isStart){
			return true;
		}
		return false;
	}

}
