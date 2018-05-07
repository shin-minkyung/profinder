package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.PpageDao;
import com.tj.profinder.model.Favorite;
import com.tj.profinder.model.Ppage;

@Service
public class PpageServiceImpl implements PpageService{
	@Autowired
	private PpageDao ppageDao;
	
	/*ppageContent*/
	@Override
	public int ppageContentInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		return ppageDao.ppageContentInsert(ppage);
	}

	@Override
	public List<Ppage> ppageContentsList(Ppage ppage) {
		// TODO Auto-generated method stub
		return ppageDao.ppageContentsList(ppage);
	}

	@Override
	public int ppageContentListCount(String p_email) {
		// TODO Auto-generated method stub
		return ppageDao.ppageContentListCount(p_email);
	}

	/*ppageNewsfeed*/
	@Override
	public int ppageNewsfeedInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		return ppageDao.ppageNewsfeedInsert(ppage);
	}
	
	@Override
	public List<Ppage> ppageNewsfeedList(Ppage ppage) {
		// TODO Auto-generated method stub
		return ppageDao.ppageNewsfeedList(ppage);
	}
	

	@Override
	public int ppageNewsfeedListCount(String p_email) {
		// TODO Auto-generated method stub
		return ppageDao.ppageNewsfeedListCount(p_email);
	}
	
	/*ppageQuestion*/
	@Override
	public int ppageQuestionInsert(Ppage ppage) {
		// TODO Auto-generated method stub
		return ppageDao.ppageQuestionInsert(ppage);
	}

	@Override
	public List<Ppage> ppageQuestionList(Ppage ppage) {
		// TODO Auto-generated method stub
		return ppageDao.ppageQuestionList(ppage);
	}

	@Override
	public int ppageQuestionListCount(String p_email) {
		System.out.println(p_email);
		return ppageDao.ppageQuestionListCount(p_email);
	}

	@Override
	public void ppageNewsfeedAutoInsert() {
		// TODO Auto-generated method stub
		Ppage ppage = new Ppage();
		for(int i=1;i<201;i++) {
			ppage.setP_email("pro"+i+"@pro.com");
			ppage.setN_num("NEWSFEED"+i);
			System.out.println(i+"번째성공");
			ppageDao.ppageNewsfeedAutoInsert(ppage);
		}
	}

	@Override
	public void ppageContentsAutoInsert() {
		// TODO Auto-generated method stub
		Ppage ppage = new Ppage();
		for(int i=1;i<201;i++) {
			ppage.setP_email("pro"+i+"@pro.com");
			ppage.setCon_num("CONTENTS"+i);
			System.out.println(i+"번째성공");
			ppageDao.ppageContentsAutoInsert(ppage);
		}
	}

	@Override
	public void ppageQuestionAutoInsert() {
		// TODO Auto-generated method stub
		Ppage ppage = new Ppage();
		for(int i=1;i<201;i++) {
			ppage.setP_email("pro"+i+"@pro.com");
			ppage.setQ_num("QUESTION"+i);
			System.out.println(i+"번째성공");
			ppageDao.ppageQuestionAutoInsert(ppage);
		}
	}
	@Override
	public int ppageQuestionDelete(String q_num) {
		// TODO Auto-generated method stub
		return ppageDao.ppageQuestionDelete(q_num);
	}
	
}
