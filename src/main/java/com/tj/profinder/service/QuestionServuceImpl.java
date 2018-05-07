package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.QuestionDao;
import com.tj.profinder.model.Question;

@Service
public class QuestionServuceImpl implements QuestionService {
	@Autowired
	private QuestionDao questionDao;

	@Override
	public int questionInsert(Question question) {		
		return questionDao.questionInsert(question);
	}
	
	@Override
	public String questionNownum() {
		// TODO Auto-generated method stub
		return questionDao.questionNowNum();
	}
	
	@Override
	public List<Question> questionList_Promembers(Question question) {
		System.out.println(question);
		return questionDao.questionList_Promembers(question);
	}

	@Override
	public List<Question> questionList_findermembers(Question question) {
		return questionDao.questionList_findermembers(question);
	}

	@Override
	public List<Question> questionList_category(Question question) {
		return questionDao.questionList_category(question);
	}

	@Override
	public int questionTotal_Promembers(String p_email) {
		return questionDao.questionTotal_Promembers(p_email);
	}

	@Override
	public int questionTotal_findermembers(String f_email) {
		return questionDao.questionTotal_findermembers(f_email);
	}

	@Override
	public int questionTotal_category(int cate_num) {
		return questionDao.questionTotal_category(cate_num);
	}

	@Override
	public int questionModify(Question question) {
		return questionDao.questionModify(question);
	}
		

	@Override
	public int questionDelete(String q_num) {
		return questionDao.questionDelete(q_num);
	}

	@Override
	public Question questionMainBanner(String q_num) {
		// TODO Auto-generated method stub
		return questionDao.questionMainBanner(q_num);
	}
	@Override
	public void questionAutoInsert() {
		Question dummydata = new Question();
		int randomstar;
		for(int i=1; i<201; i++) {
			dummydata.setP_email("pro"+i+"@pro.com");
			dummydata.setF_email("finder"+i+"@finder.com");
			dummydata.setQ_title("Question"+i+" Title");
			dummydata.setQ_content("Question"+i+" Contents Question"+i+" Contents");
			switch (i%8) {
			case 0:
				dummydata.setCate_num(8);
				break;
			case 1:
				dummydata.setCate_num(7);
				break;
			case 2:
				dummydata.setCate_num(6);
				break;
			case 3:
				dummydata.setCate_num(5);
				break;
			case 4:
				dummydata.setCate_num(4);
				break;
			case 5:
				dummydata.setCate_num(3);
				break;
			case 6:
				dummydata.setCate_num(2);
				break;
			case 7:
				dummydata.setCate_num(1);
				break;					
			}
			randomstar = (int)(Math.random()*5)+1; 
			dummydata.setQ_star(randomstar);
			questionDao.questionAutoInsert(dummydata);
			System.out.println(i+"th Question Insert Success");
		}//for
		
	}

	@Override
	public Question getQuestion(String q_num) {
		// TODO Auto-generated method stub
		return questionDao.getQuestion(q_num);
	}

	@Override
	public List<Question> searchQueforSM(Question searchQue) {
		// TODO Auto-generated method stub
		return questionDao.searchedQueforSM(searchQue);
	}

	@Override
	public int searchedQueCnt(String searchWord) {
		// TODO Auto-generated method stub
		return questionDao.searchedQueCnt(searchWord);
	}

	@Override
	public int questionAccept(String q_num) {
		// TODO Auto-generated method stub
		return questionDao.questionAccept(q_num);
	}

	@Override
	public int questionReject(String q_num) {
		// TODO Auto-generated method stub
		return questionDao.questionReject(q_num);
	}

	@Override
	public int questionStanBy(String q_num) {
		// TODO Auto-generated method stub
		return questionDao.questionStanBy(q_num);
	}

	@Override
	public int questionQ_star(Question question) {
		// TODO Auto-generated method stub
		return questionDao.questionQ_star(question);
	}

	@Override
	public int getQ_star(String q_num) {
		// TODO Auto-generated method stub
		return questionDao.getQ_star(q_num);
	}
	
}
