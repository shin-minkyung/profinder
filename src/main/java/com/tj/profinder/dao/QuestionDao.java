package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Question;

public interface QuestionDao {
	public int questionInsert(Question question);
	public String questionNowNum();	
	public List<Question> questionList_Promembers(Question question);
	public List<Question> questionList_findermembers(Question question);
	public List<Question> questionList_category(Question question);
	public int questionTotal_Promembers(String p_email);
	public int questionTotal_findermembers(String f_email);
	public int questionTotal_category(int cate_num);
	public int questionModify(Question question);
	public int questionAccept(String q_num);
	public int questionReject(String q_num);
	public int questionDelete(String q_num);	
	public Question questionMainBanner(String q_num);
	public int questionAutoInsert(Question dummydata);
	public Question getQuestion(String q_num);
	public List<Question> searchedQueforSM(Question searchQue);
	public int searchedQueCnt(String searchWord);
	public int questionStanBy(String q_num);
	public int questionQ_star(Question question);
	public int getQ_star(String q_num);
}
