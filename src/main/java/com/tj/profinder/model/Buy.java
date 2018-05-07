package com.tj.profinder.model;

import java.sql.Timestamp;

public class Buy {
	private String f_email;
	private String buy_num;
	private Timestamp buy_date;
	public Buy() {}

	public Buy(String f_email, String buy_num) {
		super();
		this.f_email = f_email;
		this.buy_num = buy_num;
	}

	@Override
	public String toString() {
		return "Buy [e_email=" + f_email + ", buy_num=" + buy_num + "]";
	}

	public Timestamp getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Timestamp buy_date) {
		this.buy_date = buy_date;
	}

	public String getF_email() {
		return f_email;
	}

	public void setF_email(String f_email) {
		this.f_email = f_email;
	}

	public String getBuy_num() {
		return buy_num;
	}

	public void setBuy_num(String buy_num) {
		this.buy_num = buy_num;
	}
	
	
}
