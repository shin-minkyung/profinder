package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.NewsfeedDao;
import com.tj.profinder.model.Newsfeed;

@Service
public class NewsfeedServiceImpl implements NewsfeedService {
	@Autowired
	private NewsfeedDao newsfeedDao;
	@Override
	public int newsfeedInsert(Newsfeed newsfeed) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedInsert(newsfeed);
	}
	@Override
	public List<Newsfeed> newsfeedMain() {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedMain();
	}
	@Override
	public Newsfeed newsfeedAjax(int rn) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedAjax(rn);
	}
	@Override
	public Newsfeed newsfeedMainBanner(String n_num) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedMainBanner(n_num);
	}
	@Override
	public String newsfeedNowNum() {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedNowNum();
	}
	@Override
	public Newsfeed newsfeedModifyView(String n_num) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedModifyView(n_num);
	}
	@Override
	public void newsfeedAutoInsert() {
		// TODO Auto-generated method stub
		Newsfeed newsfeed = new Newsfeed();
		for(int i=1;i<201;i++) {
			newsfeed.setP_email("pro"+i+"@pro.com");
			newsfeed.setN_title("newsfeed"+i+"title");
			newsfeed.setN_content("newsfeed"+i+"content");
			newsfeed.setN_hit(i);
			newsfeed.setN_ip("127.0.0.1");
			switch (i%8) {
			case 0:
				newsfeed.setCate_num(1);
				break;
			case 1:
				newsfeed.setCate_num(2);
				break;
			case 2:
				newsfeed.setCate_num(3);
				break;
			case 3:
				newsfeed.setCate_num(4);
				break;
			case 4:
				newsfeed.setCate_num(5);
				break;
			case 5:
				newsfeed.setCate_num(6);
				break;
			case 6:
				newsfeed.setCate_num(7);
				break;
			case 7:
				newsfeed.setCate_num(8);
				break;
			}			
			newsfeedDao.newsfeedAutoInsert(newsfeed);
			System.out.println(i+"th Newsfeed Insert Success");
		}
	}
	@Override
	public int newsfeedModify(Newsfeed newsfeed) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedModify(newsfeed);
	}
	@Override
	public Newsfeed newsfeedView(String n_num) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedView(n_num);
	}
	@Override
	public int newsfeedDelete(String n_num) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedDelete(n_num);
	}
	@Override
	public int newsfeedCommentCnt(String n_num) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedCommentCnt(n_num);
	}
	@Override
	public int newsfeedLikeCnt(String n_num) {
		// TODO Auto-generated method stub
		return newsfeedDao.newsfeedLikeCnt(n_num);
	}

}
