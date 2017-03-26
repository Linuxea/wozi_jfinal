package userManager.controller;

import com.jfinal.core.Controller;

import wozi_super.com.base.BaseController;

public class UserController extends Controller{
	
	public void index() {
		this.renderJson("msg","hello!wozi_super is coming...");
	}
	
}
