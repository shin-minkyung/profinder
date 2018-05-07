package com.tj.profinder.model;

import java.sql.Timestamp;

public class FbComment {
	private String fc_num;
	private String fb_num;
	private String fc_name;
	private String fc_photo;
	private String fc_content;
	private String fc_group;
	private String fc_group2;
	private int fc_indent;
	private String fc_ref;
	private Timestamp fc_date;
	private int fc_del;
	private String fc_ip;
	
	public FbComment() {}

	public FbComment(String fc_num, String fb_num, String fc_name, String fc_photo, String fc_content, String fc_group,
			String fc_group2, int fc_indent, String fc_ref, Timestamp fc_date, int fc_del, String fc_ip) {
		super();
		this.fc_num = fc_num;
		this.fb_num = fb_num;
		this.fc_name = fc_name;
		this.fc_photo = fc_photo;
		this.fc_content = fc_content;
		this.fc_group = fc_group;
		this.fc_group2 = fc_group2;
		this.fc_indent = fc_indent;
		this.fc_ref = fc_ref;
		this.fc_date = fc_date;
		this.fc_del = fc_del;
		this.fc_ip = fc_ip;
	}

	public String getFc_num() {
		return fc_num;
	}

	public void setFc_num(String fc_num) {
		this.fc_num = fc_num;
	}

	public String getFb_num() {
		return fb_num;
	}

	public void setFb_num(String fb_num) {
		this.fb_num = fb_num;
	}

	public String getFc_name() {
		return fc_name;
	}

	public void setFc_name(String fc_name) {
		this.fc_name = fc_name;
	}

	public String getFc_photo() {
		return fc_photo;
	}

	public void setFc_photo(String fc_photo) {
		this.fc_photo = fc_photo;
	}

	public String getFc_content() {
		return fc_content;
	}

	public void setFc_content(String fc_content) {
		this.fc_content = fc_content;
	}

	public String getFc_group() {
		return fc_group;
	}

	public void setFc_group(String fc_group) {
		this.fc_group = fc_group;
	}

	public String getFc_group2() {
		return fc_group2;
	}

	public void setFc_group2(String fc_group2) {
		this.fc_group2 = fc_group2;
	}

	public int getFc_indent() {
		return fc_indent;
	}

	public void setFc_indent(int fc_indent) {
		this.fc_indent = fc_indent;
	}

	public String getFc_ref() {
		return fc_ref;
	}

	public void setFc_ref(String fc_ref) {
		this.fc_ref = fc_ref;
	}

	public Timestamp getFc_date() {
		return fc_date;
	}

	public void setFc_date(Timestamp fc_date) {
		this.fc_date = fc_date;
	}

	public int getFc_del() {
		return fc_del;
	}

	public void setFc_del(int fc_del) {
		this.fc_del = fc_del;
	}

	public String getFc_ip() {
		return fc_ip;
	}

	public void setFc_ip(String fc_ip) {
		this.fc_ip = fc_ip;
	}

	@Override
	public String toString() {
		return "FbComment [fc_num=" + fc_num + ", fb_num=" + fb_num + ", fc_name=" + fc_name + ", fc_photo=" + fc_photo
				+ ", fc_content=" + fc_content + ", fc_group=" + fc_group + ", fc_group2=" + fc_group2 + ", fc_indent="
				+ fc_indent + ", fc_ref=" + fc_ref + ", fc_date=" + fc_date + ", fc_del=" + fc_del + ", fc_ip=" + fc_ip
				+ "]";
	}
	
}
