package com.wozi.notemanager.controller;


import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Before;
import com.jfinal.aop.Duang;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wozi.base.BaseController;
import com.wozi.notemanager.NoteVO;
import com.wozi.notemanager.model.NoteModel;
import com.wozi.notemanager.service.NoteService;

/**笔记的controller*/
@Before(Tx.class)
public class NoteController extends BaseController {
	
	private NoteService service = Duang.duang(NoteService.class, Tx.class);
	
	public void index() {
	}
	
	
	/**笔记的创建  前端传来所在目录的id*/
	public void add(){
		//tbWoZiNotePOStr
		String tbWoZiNotePOStr = this.getPara("tbWoZiNotePOStr");
		NoteVO rs = JSONObject.parseObject(tbWoZiNotePOStr, NoteVO.class);
		boolean isSuccess  = this.service.add(rs);
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**笔记的修改*/
	public void edit(){
		boolean isSuccess = false;
		NoteModel model = this.getModel(NoteModel.class);
		isSuccess = this.service.update(model);
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**笔记的删除*/
	public void del() {
		boolean isSuccess = false;
		int id = this.getParaToInt("currentNoteId");
		isSuccess = this.service.del(new NoteModel().set("id", id));
		this.renderJson("isSuccess", isSuccess);
	}
	
	/**点击目录查找笔记*/
	public void find(){
		int id = this.getParaToInt("currentNoteId");
		this.renderJson(this.service.findNote(id));
	}
	

}
