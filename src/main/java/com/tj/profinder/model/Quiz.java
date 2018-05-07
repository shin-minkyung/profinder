package com.tj.profinder.model;

public class Quiz {
	private String quiz_num;
	private String p_email;
	private String quiz_group;
	private String quiz_answer;
	private String quiz_img;
	private String quiz_select1;
	private String quiz_select2;
	private String quiz_select3;
	private String quiz_select4;
	private int quiz_price;
	
	public Quiz() {}

	public Quiz(String quiz_num, String p_email, String quiz_group, String quiz_answer, String quiz_img,
			String quiz_select1, String quiz_select2, String quiz_select3, String quiz_select4, int quiz_price) {
		super();
		this.quiz_num = quiz_num;
		this.p_email = p_email;
		this.quiz_group = quiz_group;
		this.quiz_answer = quiz_answer;
		this.quiz_img = quiz_img;
		this.quiz_select1 = quiz_select1;
		this.quiz_select2 = quiz_select2;
		this.quiz_select3 = quiz_select3;
		this.quiz_select4 = quiz_select4;
		this.quiz_price = quiz_price;
	}

	@Override
	public String toString() {
		return "Quiz [quiz_num=" + quiz_num + ", p_email=" + p_email + ", quiz_group=" + quiz_group + ", quiz_answer="
				+ quiz_answer + ", quiz_img=" + quiz_img + ", quiz_select1=" + quiz_select1 + ", quiz_select2="
				+ quiz_select2 + ", quiz_select3=" + quiz_select3 + ", quiz_select4=" + quiz_select4 + ", quiz_price="
				+ quiz_price + "]";
	}

	public String getQuiz_num() {
		return quiz_num;
	}

	public void setQuiz_num(String quiz_num) {
		this.quiz_num = quiz_num;
	}

	public String getP_email() {
		return p_email;
	}

	public void setP_email(String p_email) {
		this.p_email = p_email;
	}

	public String getQuiz_group() {
		return quiz_group;
	}

	public void setQuiz_group(String quiz_group) {
		this.quiz_group = quiz_group;
	}

	public String getQuiz_answer() {
		return quiz_answer;
	}

	public void setQuiz_answer(String quiz_answer) {
		this.quiz_answer = quiz_answer;
	}

	public String getQuiz_img() {
		return quiz_img;
	}

	public void setQuiz_img(String quiz_img) {
		this.quiz_img = quiz_img;
	}

	public String getQuiz_select1() {
		return quiz_select1;
	}

	public void setQuiz_select1(String quiz_select1) {
		this.quiz_select1 = quiz_select1;
	}

	public String getQuiz_select2() {
		return quiz_select2;
	}

	public void setQuiz_select2(String quiz_select2) {
		this.quiz_select2 = quiz_select2;
	}

	public String getQuiz_select3() {
		return quiz_select3;
	}

	public void setQuiz_select3(String quiz_select3) {
		this.quiz_select3 = quiz_select3;
	}

	public String getQuiz_select4() {
		return quiz_select4;
	}

	public void setQuiz_select4(String quiz_select4) {
		this.quiz_select4 = quiz_select4;
	}

	public int getQuiz_price() {
		return quiz_price;
	}

	public void setQuiz_price(int quiz_price) {
		this.quiz_price = quiz_price;
	}
	
	
}
