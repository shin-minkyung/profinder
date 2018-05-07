package com.tj.profinder.model;

public class Report {
	private String rep_num;
	private String rep_reporter;
	private String rep_why;
	
	public Report() {}

	public Report(String rep_num, String rep_reporter, String rep_why) {
		super();
		this.rep_num = rep_num;
		this.rep_reporter = rep_reporter;
		this.rep_why = rep_why;
	}

	@Override
	public String toString() {
		return "Report [rep_num=" + rep_num + ", rep_reporter=" + rep_reporter + ", rep_why=" + rep_why + "]";
	}

	public String getRep_num() {
		return rep_num;
	}

	public void setRep_num(String rep_num) {
		this.rep_num = rep_num;
	}

	public String getRep_reporter() {
		return rep_reporter;
	}

	public void setRep_reporter(String rep_reporter) {
		this.rep_reporter = rep_reporter;
	}

	public String getRep_why() {
		return rep_why;
	}

	public void setRep_why(String rep_why) {
		this.rep_why = rep_why;
	}
	
	
}
