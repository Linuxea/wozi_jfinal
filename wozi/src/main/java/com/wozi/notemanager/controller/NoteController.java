package com.wozi.notemanager.controller;


import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.notemanager.NoteVO;
import com.wozi.notemanager.model.NoteModel;
import com.wozi.notemanager.service.NoteService;
import com.wozi.utils.impl.PointImpl;

/**笔记的controller*/
public class NoteController extends BaseController {
	
	private NoteService service = Duang.duang(NoteService.class, Tx.class);
	
	public void index() {
	}
	
	@Before(Tx.class)
	/**笔记的创建  前端传来所在目录的id*/
	public void add(){
		int userId = (int) this.getSession().getAttribute("UID");
		PointImpl.me.opPoint(userId, 5, "添加笔记获得5分");//添加笔记获得5分
		//tbWoZiNotePOStr
		String tbWoZiNotePOStr = this.getPara("tbWoZiNotePOStr");
		NoteVO rs = JSONObject.parseObject(tbWoZiNotePOStr, NoteVO.class);
		this.renderJson(this.service.add(rs, userId));
	}
	
	@Before(Tx.class)
	/**笔记的修改*/
	public void edit(){
		int userId = (int) this.getSession().getAttribute("UID");
		PointImpl.me.opPoint(userId, +2, "修改笔记添加2分");//修改笔记添加2分
		boolean isSuccess = false;
		NoteModel model = this.getModel(NoteModel.class);
		isSuccess = this.service.update(model);
		this.renderJson("isSuccess", isSuccess);
	}
	
	@Before(Tx.class)
	/**笔记的删除*/
	public void del() {
		boolean isSuccess = false;
		int id = this.getParaToInt("currentNoteId");
		isSuccess = this.service.del(new NoteModel().set("id", id));
		PointImpl.me.opPoint(id, +1, "删除笔记获得1分");//删除笔记获得1分
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**点击目录查找笔记*/
	public void find(){
		int id = this.getParaToInt("currentNoteId");
		this.renderJson(this.service.findNote(id));
	}
	

}
