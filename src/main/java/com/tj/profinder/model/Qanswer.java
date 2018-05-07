package com.tj.profinder.model;

import java.sql.Timestamp;

public class Qanswer {
	private String q_num;
	private String qa_content;
	private Timestamp qa_date;
	private String p_nickname;
	
	public Qanswer() {}

	public Qanswer(String q_num, String qa_content, Timestamp qa_date) {
		super();
		this.q_num = q_num;
		this.qa_content = qa_content;
		this.qa_date = qa_date;
	}
	

	public String getP_nickname() {
		return p_nickname;
	}

	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}

	public String getQ_num() {
		return q_num;
	}

	public void setQ_num(String q_num) {
		this.q_num = q_num;
	}

	public String getQa_content() {
		return qa_content;
	}

	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}

	public Timestamp getQa_date() {
		return qa_date;
	}

	public void setQa_date(Timestamp qa_date) {
		this.qa_date = qa_date;
	}
	
}
