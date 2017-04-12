package com.wozi.notemanager;

import java.io.Serializable;

public class NoteVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
//	tbWoZiNotePO.content = htmlContent;
//	tbWoZiNotePO.id = currentNoteId;
//	tbWoZiNotePO.refMenu = menuId;
//	tbWoZiNotePO.title = $("input.note-title").val();
	
	private String content;
	private String id;
	private String refMenu;
	private String title;
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRefMenu() {
		return refMenu;
	}
	public void setRefMenu(String refMenu) {
		this.refMenu = refMenu;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "NoteVO [content=" + content + ", id=" + id + ", refMenu=" + refMenu + ", title=" + title + "]";
	}

}
