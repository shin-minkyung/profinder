package com.tj.profinder.model;

import java.sql.Timestamp;

public class Visited {
	private String p_email;
	private String v_visitor;
	private Timestamp v_date;
	private int startRow;
	private int endRow;
	private String f_photo1;
	
	public Visited() {}

	

	public Visited(String p_email, String v_visitor, Timestamp v_date, int startRow, int endRow, String f_photo1) {
		super();
		this.p_email = p_email;
		this.v_visitor = v_visitor;
		this.v_date = v_date;
		this.startRow = startRow;
		this.endRow = endRow;
		this.f_photo1 = f_photo1;
	}
	


	public int getStartRow() {
		return startRow;
	}



	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}



	public int getEndRow() {
		return endRow;
	}



	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}



	public String getF_photo1() {
		return f_photo1;
	}



	public void setF_photo1(String f_photo1) {
		this.f_photo1 = f_photo1;
	}



	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getV_visitor() {
		return v_visitor;
	}

	public void setV_visitor(String v_visitor) {
		this.v_visitor = v_visitor;
	}

	public Timestamp getV_date() {
		return v_date;
	}

	public void setV_date(Timestamp v_date) {
		this.v_date = v_date;
	}

}
