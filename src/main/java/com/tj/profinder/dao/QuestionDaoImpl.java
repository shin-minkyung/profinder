package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao{
	@Autowired
	private SqlSession sessionTemplate;

	@Override
	public int questionInsert(Question question) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("questionInsert", question);
	}

	@Override
	public String questionNowNum() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("questionNowNum");
	}
	
	@Override
	public List<Question> questionList_Promembers(Question question) {
		System.out.println(question);
		return sessionTemplate.selectList("questionList_Promembers", question);
	}

	@Override
	public List<Question> questionList_findermembers(Question question) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("questionList_findermembers", question);
	}

	@Override
	public List<Question> questionList_category(Question question) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("questionList_category", question);
	}

	@Override
	public int questionTotal_Promembers(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("questionTotal_Promembers", p_email);
	}

	@Override
	public int questionTotal_findermembers(String f_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("questionTotal_findermembers", f_email);
	}

	@Override
	public int questionTotal_category(int cate_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("questionTotal_category", cate_num);
	}	

	@Override
	public int questionModify(Question question) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("questionModify", question);
	}	
		
	@Override
	public int questionDelete(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("questionDelete", q_num);
	}
	
	@Override
	public Question questionMainBanner(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("questionMainBanner",q_num);
	}
	@Override
	public int questionAutoInsert(Question dummydata) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("questionAutoInsert", dummydata);
	}

	@Override
	public Question getQuestion(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getQuestion", q_num);
	}

	@Override
	public List<Question> searchedQueforSM(Question searchQue) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("searchQueforSM", searchQue);
	}

	@Override
	public int searchedQueCnt(String searchWord) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("searchedQueCnt", searchWord);
	}

	@Override
	public int questionAccept(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("questionAccept", q_num);
	}

	@Override
	public int questionReject(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("questionReject", q_num);
	}

	@Override
	public int questionStanBy(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("questionStanBy", q_num);
	}

	@Override
	public int questionQ_star(Question question) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("questionQ_star", question);
	}

	@Override
	public int getQ_star(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getQ_star", q_num);
	}
	
	
	
}
