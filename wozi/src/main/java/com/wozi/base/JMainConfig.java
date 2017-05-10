package com.wozi.base;

import com.alibaba.druid.filter.stat.StatFilter;
import com.alibaba.druid.wall.WallFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.druid.DruidStatViewHandler;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;
import com.wozi.adminmanager.controller.AdminController;
import com.wozi.base.interceptor.AuthInterceptor;
import com.wozi.base.interceptor.GlobalExceptionInterceptor;
import com.wozi.base.interceptor.LoginInterceptor;
import com.wozi.chatmanager.controller.ChatController;
import com.wozi.friendmanager.controller.FriendController;
import com.wozi.helpmanager.controller.HelpController;
import com.wozi.notemanager.controller.MenuController;
import com.wozi.notemanager.controller.NoteController;
import com.wozi.searchManager.controller.NoteSearchController;
import com.wozi.usermanager.controller.UserController;


public class JMainConfig extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		PropKit.use("db_config.properties");
		me.setDevMode(PropKit.getBoolean("devMode", PropKit.getBoolean("devMode")));
		me.setViewType(ViewType.JSP);
	}

	@Override
	public void configRoute(Routes me) {
		/**
		 * 基礎模塊
		 */
		me.add("baseController", BaseController.class);
		
		/**
		 * 用戶模塊 
		 */
		me.add("userController", UserController.class);
		
		/**
		 * 菜單模塊
		 */
		me.add("menuController", MenuController.class);
		
		/**
		 * 筆記模塊 
		 */
		me.add("noteController", NoteController.class);
		
		/**
		 * 社交模塊 
		 */
		me.add("friendController", FriendController.class);
		
		/**
		 * 筆記搜索模塊
		 */
		me.add("noteSearchController", NoteSearchController.class);
		
		/**
		 * 幫助模塊
		 */
		me.add("helpController", HelpController.class);
		
		/**
		 * 後臺模塊 
		 */
		me.add("adminController", AdminController.class);
		
		/**
		 * 聊天模塊
		 */
		me.add("chatController", ChatController.class);
	}


	@Override
	public void configPlugin(Plugins me) {
		// 配置druid数据库连接池插件
		DruidPlugin druidPlugin = 
				new DruidPlugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
		
		//druid配置信息
		druidPlugin.addFilter(new StatFilter());
		WallFilter wall = new WallFilter();
		wall.setDbType("mysql");
		druidPlugin.addFilter(wall);
		
		me.add(druidPlugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(druidPlugin);
		//show sql true
		arp.setShowSql(true);
		// 所有映射在 MappingKit 中自动化搞定
		MappingKit.mapping(arp);
		me.add(arp);
		
		/**聊天服务器启动*/
//		me.add(new ChatServerPlugin());
		
		/**redis*/
//		RedisPlugin rp = new RedisPlugin("jedis", "127.0.0.1","9090");
//		me.add(rp);
	}

	@Override
	public void configInterceptor(Interceptors me) {
//		me.add(new AuthInterceptor());
		me.add(new LoginInterceptor());//登錄攔截器
		me.add(new GlobalExceptionInterceptor());//全局異常攔截器
	}

	@Override
	public void configHandler(Handlers me) {
		//jfinal配置druid數據源
		DruidStatViewHandler dvh =  new DruidStatViewHandler("/druid");
		me.add(dvh);
	}

	@Override
	public void configEngine(Engine me) {
	}

}
