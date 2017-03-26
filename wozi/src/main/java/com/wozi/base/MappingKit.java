package com.wozi.base;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.wozi.noteManager.model.MenuModel;
import com.wozi.noteManager.model.NoteModel;
import com.wozi.userManager.model.UserModel;

public class MappingKit {
	
	public static void mapping(ActiveRecordPlugin arp) {
		/**用户的映射表*/
		arp.addMapping("WOZI_USER","id", UserModel.class);
		
		/**目录的映射表*/
		arp.addMapping("WOZI_MENU", "id", MenuModel.class);
		
		/**笔记的映射表*/
		arp.addMapping("WOZI_NOTE", "id", NoteModel.class);
	}
	
}
