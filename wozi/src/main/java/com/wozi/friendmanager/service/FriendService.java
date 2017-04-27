package com.wozi.friendmanager.service;

import java.util.List;
import java.util.Objects;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;
import com.wozi.friendmanager.model.FriendModel;

public class FriendService  extends BaseService<FriendModel>{

	public List<Record> findFriends(int sex, int age, String orderBy) {
		String sql = "select * from WOZI_USER where 1=1 ";
		if(!Objects.isNull(sex)){
			sql+=" and sex = ? ";
		}
		if(!Objects.isNull(age)){
			sql+=" and age = ?";
		}
		sql += " order by ?";
		return Db.find(sql, sex, age, orderBy);
	}

	/**列出别人对你的好友请求列表*/
	public List<Record> listRequire(int id) {
		String sql = "select * from WOZI_FRIENDS "
				+ " where added_side = ?"
				+ " and added_pass = null";
		return Db.find(sql, id);
	}

	
	public boolean share(int noteId, int id, int to) {
		String sql = "insert into WOZI_NOTE_SHARE (noteId, fromId, toId)"
				+ " values (?,?,?)";
		return Db.update(sql,noteId, id, to) == 1;
	}

	public List<Record> shareToMe(int id) {
		String sql = "select * from WOZI_NOTE_SHARE where toId = ?";
		return Db.find(sql);
	}

	public List<Record> shareFromMe(int id) {
		String sql = "select * from WOZI_NOTE_SHARE where fromId = ?";
		return Db.find(sql);
	}

}
