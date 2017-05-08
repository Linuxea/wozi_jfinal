package com.wozi.friendmanager.service;

import java.util.List;
import java.util.Objects;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class FriendService  extends BaseService<Model<?>>{


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

	public List<Record> list(int id) {
		String sql = "select * from wozi_friends where "
				+ " added_pass = 'true' and add_side = ?"
				+ " or added_side = ?  order by create_time desc";
		List<Record> rs = Db.find(sql, id, id);
		this.filter(id, rs);//过滤掉自己一方
		return rs;
	}

	private void filter(int id, List<Record> rs) {
		for(Record temp: rs){
			int one = temp.getInt("add_side");
			int another = temp.getInt("added_side");
			if(id != one){
				temp.set("only", one);
				temp.set("onlyName", getName(one));
			}else{
				temp.set("only", another);
				temp.set("onlyName", getName(another));
			}
		}
		
		//循环查询获取对方信息
	}
	
	private String getName(int id){
		String sql = "select user_name from wozi_user where id = ?";
		return Db.queryStr(sql, id);
	}

	public List<Record> getMsg(int id) {
		String sql = "select * from wozi_msg where receiverId = ? order by create_time desc";
		return Db.find(sql, id);
	}

	public List<Record> findFriends() {
		String sql = "select * from WOZI_USER where 1=1 ";
		return Db.find(sql);
	}


	//是否已经发送过添加请求
	public boolean isSent(int selfId, int id) {
		String sql = "select count(*) from wozi_friends where add_side = ?"
				+ " and added_side = ?";
		return Db.queryLong(sql,selfId, id)>0;
	}
	

}
