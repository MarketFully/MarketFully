package com.kh.market.recipe.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class BoardReply implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int rId;	//댓글번호
	private int bId;	//게시판번호
	private String content;	//댓글내용
	private String writer;	//작성자
	private Date cdate;		//작성일
	private int thank;		//좋아요
	
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public int getThank() {
		return thank;
	}
	public void setThank(int thank) {
		this.thank = thank;
	}
	@Override
	public String toString() {
		return "BoardReply [rId=" + rId + ", bId=" + bId + ", content=" + content + ", writer=" + writer + ", cdate="
				+ cdate + ", thank=" + thank + "]";
	}
	public BoardReply(int rId, int bId, String content, String writer, Date cdate, int thank) {
		
		this.rId = rId;
		this.bId = bId;
		this.content = content;
		this.writer = writer;
		this.cdate = cdate;
		this.thank = thank;
	}
	
	public BoardReply() {}
	
	
}
