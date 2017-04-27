package com.wozi.utils.impl;

import java.util.List;

import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.utils.interfaces.IPoint;
import com.wozi.utils.service.PointService;

public class PointImpl implements IPoint {
	
	private PointService service = Duang.duang(PointService.class, Tx.class);

	@Override
	public String rulePoint(int point) {
		String title = null;
		if(point == 0 ){
			title = "潜水";
		}else if(point>0 && point <100){
			title = "冒泡";
		}else if(point>100 && point <500){
			title = "专家";
		}else if(point>500 && point <1000){
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
	
	
	/**統計當前用戶的所用當前積分總和*/
	public String countPoint(int userId){
		int sum = this.service.countPoint(userId);
		return this.rulePoint(sum);
	}


	@Override
	public boolean opPoint(int id, int point) {
		return this.service.opPoint(id, point);
	}

}
