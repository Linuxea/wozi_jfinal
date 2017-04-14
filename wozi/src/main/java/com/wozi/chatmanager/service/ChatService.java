package com.wozi.chatmanager.service;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.chatmanager.model.FriendModel;

public class ChatService extends BaseService<FriendModel> {

	//找出我所有好友的信息
	public List<Record> myFriends(int id) {
		String sql = "select user_name,sex,age,email,intro,create_time "
				+ " 	from wozi_user "
				+ " 	where id in("
				+ " 		select add_side "
				+ " 		from wozi_friends "
				+ " 		where "
				+ " 		added_side = 6  "
				+ " 			and "
				+ " 		added_pass = 'true')";
		return Db.find(sql, id);
	}
	
	
}
