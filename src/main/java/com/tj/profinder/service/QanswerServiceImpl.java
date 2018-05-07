package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.QanswerDao;
import com.tj.profinder.model.Qanswer;

@Service
public class QanswerServiceImpl implements QanswerService {

	@Autowired
	private QanswerDao qanswerDao;
	@Override
	public int qanswerInsert(Qanswer qanswer) {
		// TODO Auto-generated method stub
		return qanswerDao.qanswerInsert(qanswer);
	}

	@Override
	public List<Qanswer> qanswerList(String q_num) {
		// TODO Auto-generated method stub
		return qanswerDao.qanswerList(q_num);
	}

	@Override
	public int qanswerContent(String q_num) {
		// TODO Auto-generated method stub
		return qanswerDao.qanswerContent(q_num);
	}

	@Override
	public int qanswerModify(Qanswer qanswer) {
		// TODO Auto-generated method stub
		return qanswerDao.qanswerModify(qanswer);
	}

	@Override
	public int qanswerDelete(String q_num) {
		// TODO Auto-generated method stub
		return qanswerDao.qanswerDelete(q_num);
	}
	
	@Override
	public void qAnswerAutoInsert() {
		// TODO Auto-generated method stub
		Qanswer dummyanswer = new Qanswer();
		for(int i=1; i<201; i++) { //Value i for q_num sequence. Be careful about parent key integrity
			//Check your q_num sequences in the table QUESTION before running this method
			dummyanswer.setQ_num("QUESTION"+i);
			dummyanswer.setQa_content("DUMMY ANSWER"+i);
			qanswerDao.qAnswerAutoInsert(dummyanswer);
			System.out.println("q_num: QUESTION"+i+" Insert Success");
		}
	}

	@Override
	public Qanswer getQanswer(String q_num) {
		// TODO Auto-generated method stub
		return qanswerDao.getQanswer(q_num);
	}

}
