package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Fpage;
@Repository
public class FpageDaoImpl implements FpageDao {
	@Autowired
	private SqlSession sessionTemplate;
	
	/* fpageNewsfeed */
	@Override
	public List<Fpage> fpageNewsfeedList(String f_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("fpageNewsfeedList",f_email);
	}
	@Override
	public Fpage fpageNewsfeedAjax(Fpage fpage) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("fpageNewsfeedAjax",fpage);
	}
	
	/* fpageContents */
	@Override
	public List<Fpage> fpageContentsList(Fpage fpage) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("fpageContentsList",fpage);
	}
	@Override
	public int fpageContentsListCount(String f_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("fpageContentsListCount",f_email);
	}

	/* fpageQuestion */
	@Override
	public List<Fpage> fpageQuestionList(Fpage fpage) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("fpageQuestionList", fpage);
	}
	@Override
	public int fpageQuestionListCount(String f_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("fpageQuestionListCount", f_email);
	}
	@Override
	public int fpageNewsfeedAjaxChk(Fpage fpage) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("fpageNewsfeedAjaxChk",fpage);
	}
}
