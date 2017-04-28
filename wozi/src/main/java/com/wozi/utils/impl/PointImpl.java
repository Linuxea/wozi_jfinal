package com.wozi.utils.impl;

import java.util.List;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.utils.interfaces.IPoint;
import com.wozi.utils.service.PointService;

public class PointImpl implements IPoint {
	
	private PointService service = Duang.duang(PointService.class, Tx.class);
	
	public static PointImpl me = new PointImpl();
	
	@Override
	public String rulePoint(int point) {
		String title = null;
		if(point == 0 ){
			title = "潜水";
		}else if(point>0 && point <5000){
			title = "冒泡";
		}else if(point>5000 && point <10000){
			title = "专家";
		}else if(point>10000 && point <50000){
			title = "教授";
		}else{
			title = "传说";
		}
		return title;
	}
	
	
	/* 列出用戶積分歷史變化情況*/
	public List<Record> pointTrace(int id){
		return this.service.listTrace(id);
	}
	
	
	/**統計當前用戶的所有積分總和*/
	public String countPoint(int userId){
		int sum = this.service.countPoint(userId);
		return this.rulePoint(sum);
	}


	public boolean opPoint(int id, int point, String comment) {
		return this.service.opPoint(id, point, comment);
	}


	@Override
	public List<Record> listHi(int userId) {
		return this.service.listHi(userId);
	}


	@Override
	public int getCount(int userId) {
		return this.service.getCount(userId);
	}
	
	@Override
	public String getTitle(int userId){
		return this.rulePoint(getCount(userId));
	}

}
