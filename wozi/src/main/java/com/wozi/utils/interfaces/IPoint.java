package com.wozi.utils.interfaces;

/**
 * 积分工具
 * @author linuxea
 *
 */
public interface IPoint {
	
	//积分添加
	void addPoint(int id, int point);
	
	//积分删除
	void subPoint(int id, int point);
	
	//积分上升规则 
	String rulePoint(int point);
	
	
}
