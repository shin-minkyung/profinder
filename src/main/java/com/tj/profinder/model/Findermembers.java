package com.tj.profinder.model;

import java.sql.Timestamp;

public class Findermembers {
	private String f_email;
	private String f_pw;
	private String f_name;
	private String f_nickname;
	private String f_tel1;
	private String f_tel2;
	private String f_tel3;
	private String f_accountnum;
	private String f_bank;
	private String f_area;
	private int f_point;
	private String f_photo1;
	private int f_drop;
	private int f_suspend;
	private Timestamp f_date;
	private String f_message;
	private String f_photo2;
	
	public Findermembers() {}

	public Findermembers(String f_email, String f_pw, String f_name, String f_nickname, String f_tel1, String f_tel2,
			String f_tel3, String f_accountnum, String f_bank, String f_area, int f_point, String f_photo1, int f_drop,
			int f_suspend, Timestamp f_date, String f_message, String f_photo2) {
		super();
		this.f_email = f_email;
		this.f_pw = f_pw;
		this.f_name = f_name;
		this.f_nickname = f_nickname;
		this.f_tel1 = f_tel1;
		this.f_tel2 = f_tel2;
		this.f_tel3 = f_tel3;
		this.f_accountnum = f_accountnum;
		this.f_bank = f_bank;
		this.f_area = f_area;
		this.f_point = f_point;
		this.f_photo1 = f_photo1;
		this.f_drop = f_drop;
		this.f_suspend = f_suspend;
		this.f_date = f_date;
		this.f_message = f_message;
		this.f_photo2 = f_photo2;
	}

	public String getF_email() {
		return f_email;
	}

	public void setF_email(String f_email) {
		this.f_email = f_email;
	}

	public String getF_pw() {
		return f_pw;
	}

	public void setF_pw(String f_pw) {
		this.f_pw = f_pw;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_nickname() {
		return f_nickname;
	}

	public void setF_nickname(String f_nickname) {
		this.f_nickname = f_nickname;
	}

	public String getF_tel1() {
		return f_tel1;
	}

	public void setF_tel1(String f_tel1) {
		this.f_tel1 = f_tel1;
	}

	public String getF_tel2() {
		return f_tel2;
	}

	public void setF_tel2(String f_tel2) {
		this.f_tel2 = f_tel2;
	}

	public String getF_tel3() {
		return f_tel3;
	}

	public void setF_tel3(String f_tel3) {
		this.f_tel3 = f_tel3;
	}

	public String getF_accountnum() {
		return f_accountnum;
	}

	public void setF_accountnum(String f_accountnum) {
		this.f_accountnum = f_accountnum;
	}

	public String getF_bank() {
		return f_bank;
	}

	public void setF_bank(String f_bank) {
		this.f_bank = f_bank;
	}

	public String getF_area() {
		return f_area;
	}

	public void setF_area(String f_area) {
		this.f_area = f_area;
	}

	public int getF_point() {
		return f_point;
	}

	public void setF_point(int f_point) {
		this.f_point = f_point;
	}

	public String getF_photo1() {
		return f_photo1;
	}

	public void setF_photo1(String f_photo1) {
		this.f_photo1 = f_photo1;
	}

	public int getF_drop() {
		return f_drop;
	}

	public void setF_drop(int f_drop) {
		this.f_drop = f_drop;
	}

	public int getF_suspend() {
		return f_suspend;
	}

	public void setF_suspend(int f_suspend) {
		this.f_suspend = f_suspend;
	}

	public Timestamp getF_date() {
		return f_date;
	}

	public void setF_date(Timestamp f_date) {
		this.f_date = f_date;
	}

	public String getF_message() {
		return f_message;
	}

	public void setF_message(String f_message) {
		this.f_message = f_message;
	}

	public String getF_photo2() {
		return f_photo2;
	}

	public void setF_photo2(String f_photo2) {
		this.f_photo2 = f_photo2;
	}

	@Override
	public String toString() {
		return "Findermembers [f_email=" + f_email + ", f_pw=" + f_pw + ", f_name=" + f_name + ", f_nickname="
				+ f_nickname + ", f_tel1=" + f_tel1 + ", f_tel2=" + f_tel2 + ", f_tel3=" + f_tel3 + ", f_accountnum="
				+ f_accountnum + ", f_bank=" + f_bank + ", f_area=" + f_area + ", f_point=" + f_point + ", f_photo1="
				+ f_photo1 + ", f_drop=" + f_drop + ", f_suspend=" + f_suspend + ", f_date=" + f_date + ", f_message="
				+ f_message + ", f_photo2=" + f_photo2 + "]";
	}
	
}
