package com.kh.market.recipe.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class Board {
	
	private int mb_num;
	private String mb_title;
	private String mb_content;
	private Date mb_cdate;
	private String mb_writer;
	//private String mb_image; //요거슨 이미지 파일 변경으로 인해서 변경되었음 20/04/19 기준
	private String mb_origin;
	private String mb_rename;
	private int mb_thank;
	private int mb_count;
	private int mb_rcount;
	private String mb_status;
	private String mb_type;		//요거슨 아직 안쓰는거로 알고 이씀 20/04/19 기준
	private int mc_cate_num;
	
	private int mb_serving;
	private int mb_time; 
	private int mb_level; 
	
	private Menu_Category mc;
	
	
	
	public int getMb_serving() {
		return mb_serving;
	}

	public void setMb_serving(int mb_serving) {
		this.mb_serving = mb_serving;
	}

	public int getMb_time() {
		return mb_time;
	}

	public void setMb_time(int mb_time) {
		this.mb_time = mb_time;
	}
	
	public int getMb_level() {
		return mb_level;
	}

	public void setMb_level(int mb_level) {
		this.mb_level = mb_level;
	}

	public int getMb_num() {
		return mb_num;
	}

	public void setMb_num(int mb_num) {
		this.mb_num = mb_num;
	}

	public String getMb_title() {
		return mb_title;
	}

	public void setMb_title(String mb_title) {
		this.mb_title = mb_title;
	}

	public String getMb_content() {
		return mb_content;
	}

	public void setMb_content(String mb_content) {
		this.mb_content = mb_content;
	}

	public Date getMb_cdate() {
		return mb_cdate;
	}

	public void setMb_cdate(Date mb_cdate) {
		this.mb_cdate = mb_cdate;
	}

	public String getMb_writer() {
		return mb_writer;
	}

	private ArrayList<BoardReply> brlist;	//��ۿ�
	private ArrayList<BoardExp> belist;	//�����
	private ArrayList<BoardProduct> bplist; //��ǰ��
	
	

	public ArrayList<BoardReply> getBrlist() {
		return brlist;
	}

	public void setBrlist(ArrayList<BoardReply> brlist) {
		this.brlist = brlist;
	}

	public ArrayList<BoardExp> getBelist() {
		return belist;
	}

	public void setBelist(ArrayList<BoardExp> belist) {
		this.belist = belist;
	}

	public ArrayList<BoardProduct> getBplist() {
		return bplist;
	}

	public void setBplist(ArrayList<BoardProduct> bplist) {
		this.bplist = bplist;
	}

	public void setMb_writer(String mb_writer) {
		this.mb_writer = mb_writer;
	}


	public int getMb_thank() {
		return mb_thank;
	}

	public void setMb_thank(int mb_thank) {
		this.mb_thank = mb_thank;
	}

	public int getMb_count() {
		return mb_count;
	}

	public void setMb_count(int mb_count) {
		this.mb_count = mb_count;
	}

	public int getMb_rcount() {
		return mb_rcount;
	}

	public void setMb_rcount(int mb_rcount) {
		this.mb_rcount = mb_rcount;
	}

	public String getMb_status() {
		return mb_status;
	}

	public void setMb_status(String mb_status) {
		this.mb_status = mb_status;
	}

	public String getMb_type() {
		return mb_type;
	}

	public void setMb_type(String mb_type) {
		this.mb_type = mb_type;
	}

	public int getMc_cate_num() {
		return mc_cate_num;
	}

	public void setMc_cate_num(int mc_cate_num) {
		this.mc_cate_num = mc_cate_num;
	}

	public Menu_Category getMc() {
		return mc;
	}

	public void setMc(Menu_Category mc) {
		this.mc = mc;
	}

	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMb_origin() {
		return mb_origin;
	}

	public void setMb_origin(String mb_origin) {
		this.mb_origin = mb_origin;
	}

	public String getMb_rename() {
		return mb_rename;
	}

	public void setMb_rename(String mb_rename) {
		this.mb_rename = mb_rename;
	}

	


	

	@Override
	public String toString() {
		return "Board [mb_num=" + mb_num + ", mb_title=" + mb_title + ", mb_content=" + mb_content + ", mb_cdate="
				+ mb_cdate + ", mb_writer=" + mb_writer + ", mb_origin=" + mb_origin + ", mb_rename=" + mb_rename
				+ ", mb_thank=" + mb_thank + ", mb_count=" + mb_count + ", mb_rcount=" + mb_rcount + ", mb_status="
				+ mb_status + ", mb_type=" + mb_type + ", mc_cate_num=" + mc_cate_num + ", mb_serving=" + mb_serving
				+ ", mb_time=" + mb_time + ", mb_level=" + mb_level + ", mc=" + mc + ", brlist=" + brlist + ", belist="
				+ belist + ", bplist=" + bplist + "]";
	}

	public Board(int mb_num, String mb_title, String mb_content, Date mb_cdate, String mb_writer, String mb_origin,
			String mb_rename, int mb_thank, int mb_count, int mb_rcount, String mb_status, String mb_type,
			int mc_cate_num, int mb_serving, int mb_time, int mb_level, Menu_Category mc, ArrayList<BoardReply> brlist,
			ArrayList<BoardExp> belist, ArrayList<BoardProduct> bplist) {
		super();
		this.mb_num = mb_num;
		this.mb_title = mb_title;
		this.mb_content = mb_content;
		this.mb_cdate = mb_cdate;
		this.mb_writer = mb_writer;
		this.mb_origin = mb_origin;
		this.mb_rename = mb_rename;
		this.mb_thank = mb_thank;
		this.mb_count = mb_count;
		this.mb_rcount = mb_rcount;
		this.mb_status = mb_status;
		this.mb_type = mb_type;
		this.mc_cate_num = mc_cate_num;
		this.mb_serving = mb_serving;
		this.mb_time = mb_time;
		this.mb_level = mb_level;
		this.mc = mc;
		this.brlist = brlist;
		this.belist = belist;
		this.bplist = bplist;
	}

	
	
	
}
