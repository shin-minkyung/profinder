package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Qanswer;

public interface QanswerDao {
	public int qanswerInsert(Qanswer qanswer);
	public List<Qanswer> qanswerList(String q_num);
	public int qanswerContent(String q_num);
	public int qanswerModify(Qanswer qanswer);
	public int qanswerDelete(String q_num);	
	public int qAnswerAutoInsert(Qanswer dummyanswer);
	public Qanswer getQanswer(String q_num);
}
