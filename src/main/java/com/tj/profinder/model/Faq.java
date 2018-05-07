package com.tj.profinder.model;

public class Faq {
	private String faq_num;
	private int faq_catenum;
	private String faq_title;
	private String faq_content;
	
	public Faq() {}

	public Faq(String faq_num, int faq_catenum, String faq_title, String faq_content) {
		super();
		this.faq_num = faq_num;
		this.faq_catenum = faq_catenum;
		this.faq_title = faq_title;
		this.faq_content = faq_content;
	}

	@Override
	public String toString() {
		return "Faq [faq_num=" + faq_num + ", faq_catenum=" + faq_catenum + ", faq_title=" + faq_title
				+ ", faq_content=" + faq_content + "]";
	}

	public String getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(String faq_num) {
		this.faq_num = faq_num;
	}

	public int getFaq_catenum() {
		return faq_catenum;
	}

	public void setFaq_catenum(int faq_catenum) {
		this.faq_catenum = faq_catenum;
	}

	public String getFaq_title() {
		return faq_title;
	}

	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	
	
}
