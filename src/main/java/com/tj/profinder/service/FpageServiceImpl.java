package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.FpageDao;
import com.tj.profinder.model.Fpage;
@Service
public class FpageServiceImpl implements FpageService {
	@Autowired
	private FpageDao fpageDao;
	
	/* fpageNewssfeed */
	@Override
	public List<Fpage> fpageNewsfeedList(String f_email) {
		// TODO Auto-generated method stub
		return fpageDao.fpageNewsfeedList(f_email);
	}
	@Override
	public Fpage fpageNewsfeedAjax(Fpage fpage) {
		// TODO Auto-generated method stub
		return fpageDao.fpageNewsfeedAjax(fpage);
	}
	
	/* fpgaeContents */
	@Override
	public List<Fpage> fpageContentsList(Fpage fpage) {
		// TODO Auto-generated method stub
		return fpageDao.fpageContentsList(fpage);
	}
	@Override
	public int fpageContentsListCount(String f_email) {
		// TODO Auto-generated method stub
		return fpageDao.fpageContentsListCount(f_email);
	}
	
	/* fpgaeQuestion */
	@Override
	public List<Fpage> fpageQuestionList(Fpage fpage) {
		// TODO Auto-generated method stub
		return fpageDao.fpageQuestionList(fpage);
	}
	@Override
	public int fpageQuestionListCount(String f_email) {
		// TODO Auto-generated method stub
		return fpageDao.fpageQuestionListCount(f_email);
	}
	@Override
	public int fpageNewsfeedAjaxChk(Fpage fpage) {
		// TODO Auto-generated method stub
		return fpageDao.fpageNewsfeedAjaxChk(fpage);
	}

}
