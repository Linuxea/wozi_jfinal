package com.wozi.base;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.wozi.userManager.model.UserModel;

public class MappingKit {
	
	public static void mapping(ActiveRecordPlugin arp) {
		//arp.addMapping("blog", "id", Blog.class);
		arp.addMapping("WOZI_USER","id", UserModel.class);
	}
	
}
