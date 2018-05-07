package com.tj.profinder.model;

import java.sql.Timestamp;

public class NewsComment {
	private String nc_num;
	private String n_num;
	private String nc_name;
	private String nc_content;
	private Timestamp nc_date;
	private int nc_del;
	private String nc_ip;
	
	public NewsComment() {}

	public NewsComment(String nc_num, String n_num, String nc_name, String nc_content, Timestamp nc_date, int nc_del,
			String nc_ip) {
		super();
		this.nc_num = nc_num;
		this.n_num = n_num;
		this.nc_name = nc_name;
		this.nc_content = nc_content;
		this.nc_date = nc_date;
		this.nc_del = nc_del;
		this.nc_ip = nc_ip;
	}

	@Override
	public String toString() {
		return "NewsComment [nc_num=" + nc_num + ", n_num=" + n_num + ", nc_name=" + nc_name + ", nc_content="
				+ nc_content + ", nc_date=" + nc_date + ", nc_del=" + nc_del + ", nc_ip=" + nc_ip + "]";
	}

	public String getNc_num() {
		return nc_num;
	}

	public void setNc_num(String nc_num) {
		this.nc_num = nc_num;
	}

	public String getN_num() {
		return n_num;
	}

	public void setN_num(String n_num) {
		this.n_num = n_num;
	}

	public String getNc_name() {
		return nc_name;
	}

	public void setNc_name(String nc_name) {
		this.nc_name = nc_name;
	}

	public String getNc_content() {
		return nc_content;
	}

	public void setNc_content(String nc_content) {
		this.nc_content = nc_content;
	}

	public Timestamp getNc_date() {
		return nc_date;
	}

	public void setNc_date(Timestamp nc_date) {
		this.nc_date = nc_date;
	}

	public int getNc_del() {
		return nc_del;
	}

	public void setNc_del(int nc_del) {
		this.nc_del = nc_del;
	}

	public String getNc_ip() {
		return nc_ip;
	}

	public void setNc_ip(String nc_ip) {
		this.nc_ip = nc_ip;
	}
	
}
