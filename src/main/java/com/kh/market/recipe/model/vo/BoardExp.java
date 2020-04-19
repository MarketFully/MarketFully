package com.kh.market.recipe.model.vo;

import java.io.Serializable;

public class BoardExp implements Serializable {

	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int bId; 	//게시판번호
	private String origin;	//원본파일명
	private String rename;	//리네임 파일명
	private String content;	//내용
	private int seq;	//순서
	
	public BoardExp() {}

	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getRename() {
		return rename;
	}

	public void setRename(String rename) {
		this.rename = rename;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	@Override
	public String toString() {
		return "BoardExp [bId=" + bId + ", origin=" + origin + ", rename=" + rename + ", content=" + content + ", seq="
				+ seq + "]";
	}

	public BoardExp(int bId, String origin, String rename, String content, int seq) {
		super();
		this.bId = bId;
		this.origin = origin;
		this.rename = rename;
		this.content = content;
		this.seq = seq;
	}
	
	
	
}
