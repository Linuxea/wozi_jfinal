package com.wozi.utils.impl;

import com.jfinal.aop.Before;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.utils.interfaces.IPoint;
import com.wozi.utils.service.PointService;

public class PointImpl implements IPoint {
	
	private PointService service = Duang.duang(PointService.class, Tx.class);
	
	@Before(Tx.class)
	@Override
	public void addPoint(int id, int point) {
		this.service.addPoint(id, point);
	}

	@Before(Tx.class)
	@Override
	public void subPoint(int id, int point) {
		this.service.subPoint(id, point);
	}

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

}
