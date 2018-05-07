package com.tj.profinder.model;

import java.sql.Timestamp;

public class Fboard {
	private String fb_num;
	private String fb_name;
	private String fb_photo;
	private String fb_title;
	private String fb_content;
	private Timestamp fb_date;
	private int fb_hit;
	private int fb_del;
	private String fb_ip;
	private int total;
	private int rn;
	private int likecnt;
	private int startRow;
	private int endRow;
	
	public Fboard() {}

	
	
	public Fboard(String fb_num, String fb_name, String fb_photo, String fb_title, String fb_content, Timestamp fb_date,
			int fb_hit, int fb_del, String fb_ip, int total, int rn, int startRow, int endRow) {
		this.fb_num = fb_num;
		this.fb_name = fb_name;
		this.fb_photo = fb_photo;
		this.fb_title = fb_title;
		this.fb_content = fb_content;
		this.fb_date = fb_date;
		this.fb_hit = fb_hit;
		this.fb_del = fb_del;
		this.fb_ip = fb_ip;
		this.total = total;
		this.rn = rn;
		this.startRow = startRow;
		this.endRow = endRow;
	}


	
	public int getLikecnt() {
		return likecnt;
	}



	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}



	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getFb_photo() {
		return fb_photo;
	}

	public void setFb_photo(String fb_photo) {
		this.fb_photo = fb_photo;
	}

	public String getFb_num() {
		return fb_num;
	}

	public void setFb_num(String fb_num) {
		this.fb_num = fb_num;
	}

	public String getFb_name() {
		return fb_name;
	}

	public void setFb_name(String fb_name) {
		this.fb_name = fb_name;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public Timestamp getFb_date() {
		return fb_date;
	}

	public void setFb_date(Timestamp fb_date) {
		this.fb_date = fb_date;
	}

	public int getFb_hit() {
		return fb_hit;
	}

	public void setFb_hit(int fb_hit) {
		this.fb_hit = fb_hit;
	}

	public int getFb_del() {
		return fb_del;
	}

	public void setFb_del(int fb_del) {
		this.fb_del = fb_del;
	}

	public String getFb_ip() {
		return fb_ip;
	}

	public void setFb_ip(String fb_ip) {
		this.fb_ip = fb_ip;
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



	@Override
	public String toString() {
		return "Fboard [fb_num=" + fb_num + ", fb_name=" + fb_name + ", fb_photo=" + fb_photo + ", fb_title=" + fb_title
				+ ", fb_content=" + fb_content + ", fb_date=" + fb_date + ", fb_hit=" + fb_hit + ", fb_del=" + fb_del
				+ ", fb_ip=" + fb_ip + ", total=" + total + ", rn=" + rn + ", likecnt=" + likecnt + ", startRow="
				+ startRow + ", endRow=" + endRow + "]";
	}

	
	
	
}
