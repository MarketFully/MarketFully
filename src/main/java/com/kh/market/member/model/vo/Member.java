package com.kh.market.member.model.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Component;

@Component
public class Member {
	private int mem_num;
	private String mem_id;
	private String mem_pwd;
	private String mem_email;
	private String mem_phone;
	private String mem_addr;
	private String mem_name;
	private String mem_gender;
	private String mem_birth;
	private int mem_point;
	private String mem_profile;
	private String mem_status;
	private int shipping_code;
	private String mem_grade;
	private String mem_cert;
	private String mem_sms_agree;
	private String mem_email_agree;
	
	public Member() {
		super();
	}

	
	
	public Member(String mem_id, String mem_email, String mem_name) {
		super();
		this.mem_id = mem_id;
		this.mem_email = mem_email;
		this.mem_name = mem_name;
	}



	public Member(int mem_num, String mem_id, String mem_pwd, String mem_email, String mem_phone, String mem_addr,
			String mem_name, String mem_gender, String mem_birth, int mem_point, String mem_profile, String mem_status,
			int shipping_code, String mem_grade, String mem_cert, String mem_sms_agree, String mem_email_agree) {
		super();
		this.mem_num = mem_num;
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_email = mem_email;
		this.mem_phone = mem_phone;
		this.mem_addr = mem_addr;
		this.mem_name = mem_name;
		this.mem_gender = mem_gender;
		this.mem_birth = mem_birth;
		this.mem_point = mem_point;
		this.mem_profile = mem_profile;
		this.mem_status = mem_status;
		this.shipping_code = shipping_code;
		this.mem_grade = mem_grade;
		this.mem_cert = mem_cert;
		this.mem_sms_agree = mem_sms_agree;
		this.mem_email_agree = mem_email_agree;
	}

	public int getMem_num() {
		return mem_num;
	}

	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public int getMem_point() {
		return mem_point;
	}

	public void setMem_point(int mem_point) {
		this.mem_point = mem_point;
	}

	public String getMem_profile() {
		return mem_profile;
	}

	public void setMem_profile(String mem_profile) {
		this.mem_profile = mem_profile;
	}

	public String getMem_status() {
		return mem_status;
	}

	public void setMem_status(String mem_status) {
		this.mem_status = mem_status;
	}

	public int getShipping_code() {
		return shipping_code;
	}

	public void setShipping_code(int shipping_code) {
		this.shipping_code = shipping_code;
	}

	public String getMem_grade() {
		return mem_grade;
	}

	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}

	public String getMem_cert() {
		return mem_cert;
	}

	public void setMem_cert(String mem_cert) {
		this.mem_cert = mem_cert;
	}

	public String getMem_sms_agree() {
		return mem_sms_agree;
	}

	public void setMem_sms_agree(String mem_sms_agree) {
		this.mem_sms_agree = mem_sms_agree;
	}

	public String getMem_email_agree() {
		return mem_email_agree;
	}

	public void setMem_email_agree(String mem_email_agree) {
		this.mem_email_agree = mem_email_agree;
	}

	@Override
	public String toString() {
		return "Member [mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_email=" + mem_email
				+ ", mem_phone=" + mem_phone + ", mem_addr=" + mem_addr + ", mem_name=" + mem_name + ", mem_gender="
				+ mem_gender + ", mem_birth=" + mem_birth + ", mem_point=" + mem_point + ", mem_profile=" + mem_profile
				+ ", mem_status=" + mem_status + ", shipping_code=" + shipping_code + ", mem_grade=" + mem_grade
				+ ", mem_cert=" + mem_cert + ", mem_sms_agree=" + mem_sms_agree + ", mem_email_agree=" + mem_email_agree
				+ "]";
	}

	
	
}
