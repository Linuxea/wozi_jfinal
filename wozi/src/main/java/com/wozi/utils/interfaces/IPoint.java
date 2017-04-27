package com.wozi.utils.interfaces;

/**
 * 积分工具
 * @author linuxea
 *
 */
public interface IPoint {
	
	//积分操作
	boolean opPoint(int id, int point);
	
	//积分上升规则 
	String rulePoint(int point);
	
	
}
