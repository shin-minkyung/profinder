package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Qanswer;

@Repository
public class QanswerDaoImple implements QanswerDao {
	@Autowired
	private SqlSession SessionTemplate;
	
	@Override
	public int qanswerInsert(Qanswer qanswer) {
		// TODO Auto-generated method stub
		return SessionTemplate.insert("qanswerInsert", qanswer);
	}

	@Override
	public List<Qanswer> qanswerList(String q_num) {
		// TODO Auto-generated method stub
		return SessionTemplate.selectList("qanswerList", q_num);
	}

	@Override
	public int qanswerContent(String q_num) {
		// TODO Auto-generated method stub
		return SessionTemplate.selectOne("qanswerContent", q_num);
	}

	@Override
	public int qanswerModify(Qanswer qanswer) {
		// TODO Auto-generated method stub
		return SessionTemplate.update("qanswerModify", qanswer);
	}

	@Override
	public int qanswerDelete(String q_num) {
		// TODO Auto-generated method stub
		return SessionTemplate.delete("qanswerDelete", q_num);
	}
	
	@Override
	public int qAnswerAutoInsert(Qanswer dummyanswer) {
		// TODO Auto-generated method stub
		return SessionTemplate.insert("qanwerAutoInsert", dummyanswer);
	}

	@Override
	public Qanswer getQanswer(String q_num) {
		// TODO Auto-generated method stub
		return SessionTemplate.selectOne("getQanswer", q_num);
	}
}
