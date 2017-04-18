package com.wozi.adminmanager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.wozi.base.BaseService;

public class AdminService extends BaseService<Model<?>> {
	
	public List<Record> listMsg() {
		String listSql = "select wozi_leave.*, wozi_user.user_name from wozi_leave  "
				+ " left join wozi_user "
				+ " on wozi_leave.user_id = wozi_user.id "
				+ " order by create_time desc";
		return Db.find(listSql);
	}

	public void changeStatus(int id) {
		String querySql = "select status from wozi_leave where id = ?";
		String status = Db.queryStr(querySql, id);
		if(status.equals("0")){
			this.setStatus(id, "1");
		}else{
			this.setStatus(id, "0");
		}
	}
	
	public boolean setStatus(int id, String status){
		String changeSql = "update wozi_leave set status = ? where id = ?";
		int impact = Db.update(changeSql,status, id);
		return impact == 1;
	}

	public List<Record> listUser() {
		//数据量少
		String sql = "select * from wozi_user order by update_time desc";
		return Db.find(sql);
	}

	public Record getDetail(int id) {
		String sql = "select * from wozi_user where id = ?";
		return Db.findFirst(sql, id);
	}

	public Map<String, Object> getSexData() {
		long boyCount = this.getSexData("boy");
		long girlCount = this.getSexData("girl");
		Record boy = new Record().set("name", "boy").set("value", boyCount);
		Record girl = new Record().set("name", "girl").set("value", girlCount);
		Record[] rs = new Record[]{boy,girl};
		Map<String, Object> rsMap = new HashMap<>();
		rsMap.put("data", rs);
		return rsMap;
	}
	
	private long getSexData(String sex){
		String sql = "select count(*) from wozi_user where sex = ?";
		return Db.queryLong(sql, sex);
	}

	//["0-10","11-20","21-25","26-28","28-30","30-"]
	public Map<String, Object> getAgeData() {
		//两个数组 第一个存在名称 第二个相同下标位置存放int数值
		String[] nameArr = new String[]{"0-10","11-20","21-25","26-28","28-30","30-"};
		long[] ageRange = new long[nameArr.length];
		ageRange[0] = this.rangAge(0, 10);
		ageRange[1] = this.rangAge(11, 20);
		ageRange[2] = this.rangAge(21, 25);
		ageRange[3] = this.rangAge(26, 28);
		ageRange[4] = this.rangAge(28, 30);
		ageRange[5] = this.rangAge(30, 500);
		Map<String,Object> rsMap = new HashMap<>();
		rsMap.put("name", nameArr);
		rsMap.put("value", ageRange);
		return rsMap;
	}
	
	public long rangAge(int ageStart, int ageEnd){
		String querySql = "select count(*) from wozi_user where age>? and age< ?";
		return Db.queryLong(querySql, ageStart, ageEnd);
	}

	public boolean stopUser(int id) {
		String changeSql = "insert into wozi_user_stop(user_id) values(?)";
		Db.update(changeSql, id);
		return true;
	}
	
	public boolean changeUserStatus(int id){
		String changeSql = "delete from wozi_user_stop where user_id = ?";
		Db.update(changeSql, id);
		return true;
	}
	
	public boolean isStop(int id){
		String sql = "select count(*) from wozi_user_stop where user_id = ?";
		long count = Db.queryLong(sql, id);
		return count > 0;
	}
	
}
