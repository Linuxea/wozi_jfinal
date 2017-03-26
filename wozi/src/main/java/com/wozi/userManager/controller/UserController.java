package com.wozi.userManager.controller;


import com.wozi.base.BaseController;

public class UserController extends BaseController{
	
	public void index() {
		this.renderJson("msg","hello!wozi_super is coming...");
	}
	
}
