package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Qanswer;

public interface QanswerService {
	public int qanswerInsert(Qanswer qanswer);
	public List<Qanswer> qanswerList(String q_num);
	public int qanswerContent(String q_num);
	public int qanswerModify(Qanswer qanswer);
	public int qanswerDelete(String q_num);	
	public void qAnswerAutoInsert();
	public Qanswer getQanswer(String q_num);
}
