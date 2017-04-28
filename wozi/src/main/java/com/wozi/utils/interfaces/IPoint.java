package com.wozi.utils.interfaces;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;

/**
 * 积分工具
 * @author linuxea
 *
 */
public interface IPoint {
	
	//积分操作
	boolean opPoint(int id, int point, String comment);
	
	//积分上升规则 
	String rulePoint(int point);
	
	//列出积分变化历史表
	List<Record> listHi(int userId);
	
	
}
