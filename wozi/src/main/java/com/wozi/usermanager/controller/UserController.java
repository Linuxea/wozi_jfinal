package com.wozi.usermanager.controller;


import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Maps;
import com.jfinal.aop.Before;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.wozi.base.BaseController;
import com.wozi.usermanager.model.UserModel;
import com.wozi.usermanager.service.UserService;
import com.wozi.utils.impl.PointImpl;

public class UserController extends BaseController{
	
	private UserService service = Duang.duang(UserService.class, Tx.class);
	
	public void index() {
		this.renderJson("msg","hello!wozi_super is coming...");
	}
	
	@Before(Tx.class)
	/**用户的注册添加*/
	public void add(){
		Map<String,Object> resultMap = new HashMap<>();
		UserModel model = this.getModel(UserModel.class);
		
		boolean isExist = this.service.isExist(model.getStr("user_name"));
		if(isExist){
			resultMap.put("isSuccess", false);
			resultMap.put("msg", "用户名已被人注册");
		}else{
				boolean isOk = this.service.checkNotNull(model);
				if(!isOk){
					resultMap.put("isSuccess", false);
					resultMap.put("msg", "关键字段不能为空");
				}else{
					model.set("create_time", new Date())
					.set("update_time", new Date());
				int id =  this.service.getId(model,"id");
				//注册成功新目录一个root根目录
				this.service.newRoot(id);
				//默认头像
				this.service.addPic(id);
				//注册成功添加用户积分基础为零
				PointImpl.me.opPoint(id, 100, "创建账号获得100分");//创建账号获得100分
				resultMap.put("msg", "注册成功");
				resultMap.put("isSuccess", true);
				resultMap.put("id", id);
			}
		}
		
		this.renderJson(resultMap);
	}
	
	@Before(Tx.class)
	/**用户信息的修改*/
	public void update() {
		UserModel um = new UserModel();//自己封装 :(
		um.set("age", this.getPara("age"))
			.set("email", this.getPara("email"))
			.set("sex", this.getPara("sex"))
			.set("intro", this.getPara("intro"))
			.set("id", this.getParaToInt("id"))
			.set("update_time", new Date());
		if(StringUtils.isNotEmpty(this.getPara("user_password"))){
			//表示有新的密码
			um.set("user_password", this.getPara("user_password"));
			
			//顺便把session保存的账号信息清一清 要求用户重新登录 
//			this.getSession().setAttribute("UID", null);
		}
		boolean isSuccess = false;
		isSuccess = this.service.update(um);
		if(isSuccess){
			int id = (int)this.getSession().getAttribute("UID");
			PointImpl.me.opPoint(id, 5, "更新账号获得5分");
		}
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**用户登录*/
	public void login() {
		String userName = this.getPara("userName");
		String userPwd = this.getPara("password");
		Record record = this.service.login(userName, userPwd);
		if(record!=null){
			super.map.put("isSuccess", true);
			super.map.put("id", record.get("id"));
			int id = record.get("id");
			this.getSession().setAttribute("UID", id);//将用户的id放在session中
			this.getSession().setAttribute("UNAME", userName);//将用户的用户名称放在session中
			//如果是管理员 跳转到管理员首页
			if(userName.equalsIgnoreCase("admin")){
				super.map.put("isSuccess", true);
				super.map.put("isAdmin", true);
				this.renderJson(super.map);
			}
			PointImpl.me.opPoint(id, 5, "登录账号获得5分");
		}else{
			super.map.put("isSuccess", false);
			super.map.put("msg", "no this people!");
		}
		this.renderJson(super.map);
		
	}
	
	/**用户注销*/
	public void logOut(){
		this.getSession().invalidate();
		this.renderJson("isSuccess", true);
	}
	
	
	/**返回当前登录人名称*/
	public void getCurrentName(){
		int userId = (int) this.getSession().getAttribute("UID");
		Record rs = this.service.findUser(userId);
		this.renderJson(rs);
	}
	
	/**上传头像*/
	public void upHeadPic() throws IOException{
		int userId = (int) this.getSession().getAttribute("UID");
		UploadFile uf = this.getFile("headPic", "/images/head/");
		if(null ==  uf){
			return;//表示没选择头像
		}
		File fis = new File(uf.getUploadPath()+uf.getFileName());
		//save into db  => f.getFileName()
		String newFile = "E:\\git-home\\wozi_jfinal\\wozi\\src\\main\\webapp\\images\\head\\" + uf.getFileName();
		FileUtils.copyFile(fis, new File(newFile));
		this.service.editHeadPic(userId, "images\\head\\"+uf.getFileName());
		this.renderJson("isSuccess", true);
	}
	
	/**获取头像地址*/
	public void getPic(){
		int userId = (int) this.getSession().getAttribute("UID");
		String path = this.service.getPic(userId);
		super.map.put("isSuccess", true);
		super.map.put("path", path);
		this.renderJson(map);
	}
	
	/**获取当前人积分信息*/
	public void getPoint(){
		int userId = (int) this.getSession().getAttribute("UID");
		int point = this.service.getPoint(userId);
		super.map.put("isSuccess", true);
		super.map.put("point", point);
		super.map.put("class", new PointImpl().rulePoint(point));
		this.renderJson(map);
	}
	
	/**我的历史积分足迹*/
	public void pointTrace(){
		int userId = (int) this.getSession().getAttribute("UID");
		String title = PointImpl.me.getTitle(userId);//查询积分title
		List<Record> hi = PointImpl.me.listHi(userId);
		Map<String, Object> map = Maps.newHashMap();
		int count = PointImpl.me.getCount(userId);
		map.put("isSuccess", true);
		map.put("sum", count);
		map.put("title", title);
		map.put("list", hi);
		this.renderJson(map);
	}
	
	
	/**time line*/
	public void timeLine(){
		int id = (int) this.getSession().getAttribute("UID");
		
	}
	
	
}
