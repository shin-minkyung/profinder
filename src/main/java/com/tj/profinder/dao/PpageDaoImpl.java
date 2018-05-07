package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Ppage;
@Repository
public class PpageDaoImpl implements PpageDao {
	@Autowired
	private SqlSession sessionTemplate;
	
	/* ppageContent */
	@Override
	public int ppageContentInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("ppageContentInsert",ppage);
	}
	@Override
	public List<Ppage> ppageContentsList(Ppage ppage) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("ppageContentsList",ppage);
	}
	@Override
	public int ppageContentListCount(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("ppageContentListCount",p_email);
	}
	
	/* ppageNewsfeed */
	@Override
	public int ppageNewsfeedListCount(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("ppageNewsfeedListCount",p_email);
	}
	@Override
	public List<Ppage> ppageNewsfeedList(Ppage ppage) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("ppageNewsfeedList",ppage);
	}
	@Override
	public int ppageNewsfeedInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("ppageNewsfeedInsert",ppage);
	}
	
	/* ppageQuestion */
	@Override
	public int ppageQuestionInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("ppageQuestionInsert",ppage);
	}
	@Override
	public List<Ppage> ppageQuestionList(Ppage ppage) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("ppageQuestionList", ppage);
	}
	@Override
	public int ppageQuestionListCount(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("ppageQuestionListCount", p_email);
	}
	@Override
	public void ppageNewsfeedAutoInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		sessionTemplate.insert("ppageNewsfeedAutoInsert",ppage);
	}
	@Override
	public void ppageContentsAutoInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		sessionTemplate.insert("ppageContentsAutoInsert",ppage);
	}
	@Override
	public void ppageQuestionAutoInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		sessionTemplate.insert("ppageQuestionAutoInsert",ppage);
	}
	@Override
	public int ppageQuestionDelete(String q_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("ppageQuestionDelete", q_num);
	}

}
