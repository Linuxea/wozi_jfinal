package com.wozi.base;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.wozi.friendmanager.model.FriendModel;
import com.wozi.helpmanager.model.LeaveMsg;
import com.wozi.notemanager.model.MenuModel;
import com.wozi.notemanager.model.NoteModel;
import com.wozi.pointmanager.model.PointModel;
import com.wozi.usermanager.model.UserModel;

public class MappingKit {
	
	public static void mapping(ActiveRecordPlugin arp) {
		/**用户的映射表*/
		arp.addMapping("WOZI_USER","id", UserModel.class);
		
		/**目录的映射表*/
		arp.addMapping("WOZI_MENU", "tb_id", MenuModel.class);
		
		/**笔记的映射表*/
		arp.addMapping("WOZI_NOTE", "id", NoteModel.class);
		
		/**积分映射表*/
		arp.addMapping("WOZI_USER_POINT", "id", PointModel.class);
		
		/**好友关系映射表*/
		arp.addMapping("WOZI_FRIENDS", "id", FriendModel.class);
		
		/**留言信息表*/
		arp.addMapping("wozi_leave","id", LeaveMsg.class);
		
	}
	
}
