package com.kh.market.servicecenter.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ServiceCenterQnaReply {
	private int q_num; // 게시글 번호
	private int qr_num; // 댓글 번호
	private String qr_content;
	private String qr_writer;
	private Date qr_date;
	private String qr_thank;
	private String qr_status;
	
	public ServiceCenterQnaReply() {
		super();
	}

	public ServiceCenterQnaReply(int q_num, int qr_num, String qr_content, String qr_writer, Date qr_date,
			String qr_thank, String qr_status) {
		super();
		this.q_num = q_num;
		this.qr_num = qr_num;
		this.qr_content = qr_content;
		this.qr_writer = qr_writer;
		this.qr_date = qr_date;
		this.qr_thank = qr_thank;
		this.qr_status = qr_status;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public int getQr_num() {
		return qr_num;
	}

	public void setQr_num(int qr_num) {
		this.qr_num = qr_num;
	}

	public String getQr_content() {
		return qr_content;
	}

	public void setQr_content(String qr_content) {
		this.qr_content = qr_content;
	}

	public String getQr_writer() {
		return qr_writer;
	}

	public void setQr_writer(String qr_writer) {
		this.qr_writer = qr_writer;
	}

	public Date getQr_date() {
		return qr_date;
	}

	public void setQr_date(Date qr_date) {
		this.qr_date = qr_date;
	}

	public String getQr_thank() {
		return qr_thank;
	}

	public void setQr_thank(String qr_thank) {
		this.qr_thank = qr_thank;
	}

	public String getQr_status() {
		return qr_status;
	}

	public void setQr_status(String qr_status) {
		this.qr_status = qr_status;
	}

	@Override
	public String toString() {
		return "ServiceCenterQnaReply [q_num=" + q_num + ", qr_num=" + qr_num + ", qr_content=" + qr_content
				+ ", qr_writer=" + qr_writer + ", qr_date=" + qr_date + ", qr_thank=" + qr_thank + ", qr_status="
				+ qr_status + "]";
	}

	
	
	
	
	
	
	
}
