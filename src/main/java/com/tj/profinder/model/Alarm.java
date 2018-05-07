package com.tj.profinder.model;

public class Alarm {
	private String al_receiver;
	private String al_refnum;
	private String al_checknum;
	private String f_photo1;
	private String f_nickname;
	
	public Alarm() {}	

	public Alarm(String al_receiver, String al_refnum, String al_checknum, String f_photo1, String f_nickname) {
		super();
		this.al_receiver = al_receiver;
		this.al_refnum = al_refnum;
		this.al_checknum = al_checknum;
		this.f_photo1 = f_photo1;
		this.f_nickname = f_nickname;
	}

	@Override
	public String toString() {
		return "Alarm [al_receiver=" + al_receiver + ", al_refnum=" + al_refnum + ", al_checknum=" + al_checknum + "]";
	}
	
	
	public String getF_photo1() {
		return f_photo1;
	}

	public void setF_photo1(String f_photo1) {
		this.f_photo1 = f_photo1;
	}

	public String getF_nickname() {
		return f_nickname;
	}

	public void setF_nickname(String f_nickname) {
		this.f_nickname = f_nickname;
	}

	public String getAl_receiver() {
		return al_receiver;
	}

	public void setAl_receiver(String al_receiver) {
		this.al_receiver = al_receiver;
	}

	public String getAl_refnum() {
		return al_refnum;
	}

	public void setAl_refnum(String al_refnum) {
		this.al_refnum = al_refnum;
	}

	public String getAl_checknum() {
		return al_checknum;
	}

	public void setAl_checknum(String al_checknum) {
		this.al_checknum = al_checknum;
	}
	
	
}
