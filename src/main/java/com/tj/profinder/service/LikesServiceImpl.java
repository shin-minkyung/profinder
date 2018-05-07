package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.LikesDao;
import com.tj.profinder.model.Likes;
@Service
public class LikesServiceImpl implements LikesService {
	@Autowired
	private LikesDao likesDao;
	@Override
	public List<Likes> likesMainBannerNewsfeed() {
		// TODO Auto-generated method stub
		return likesDao.likesMainBannerNewsfeed();
	}
	@Override
	public List<Likes> likesMainBannerNewsfeedAjax(Likes likes) {
		// TODO Auto-generated method stub
		return likesDao.likesMainBannerNewsfeedAjax(likes);
	}
	@Override
	public List<Likes> likesMainBannerContents() {
		// TODO Auto-generated method stub
		return likesDao.likesMainBannerContents();
	}
	@Override
	public List<Likes> likesMainBannerContentsAjax(Likes likes) {
		// TODO Auto-generated method stub
		return likesDao.likesMainBannerContentsAjax(likes);
	}
	@Override
	public List<Likes> likesMainBannerQuestion() {
		// TODO Auto-generated method stub
		return likesDao.likesMainBannerQuestion();
	}
	@Override
	public List<Likes> likesMainBannerQuestionAjax(Likes likes) {
		// TODO Auto-generated method stub
		return likesDao.likesMainBannerQuestionAjax(likes);
	}
	@Override
	public void questionAutolike() {
		// TODO Auto-generated method stub
		Likes autolikes = new Likes();
		for(int i=1; i<201; i++) {
			autolikes.setL_num("QUESTION"+i);
			for(int j=i; j<201; j++) {
				autolikes.setL_liker("finder"+j+"@finder.com");
				likesDao.like(autolikes);
				System.out.println(i+"th Question Auto like Success");
			}		
		}
	}
	@Override
	public List<Likes> topEduQuestion6() {		
		return likesDao.topEduQuestion6();
	}
	@Override
	public List<Likes> topQuestions(Likes rowscate) {			
		return likesDao.topQuestions(rowscate);
	}
	@Override
	public void contentsAutolike() {
		// TODO Auto-generated method stub
		Likes autolikes = new Likes();
		for(int i=1; i<201; i++) {
			autolikes.setL_num("CONTENTS"+i);
			for(int j=i; j<201; j++) {
				autolikes.setL_liker("finder"+j+"@finder.com");
				likesDao.like(autolikes);
				System.out.println(i+"th Contents Auto like Success");
			}		
		}
	}
	@Override
	public void newsfeedAutolike() {
		// TODO Auto-generated method stub
		Likes autolikes = new Likes();
		for(int i=1; i<201; i++) {
			autolikes.setL_num("NEWSFEED"+i);
			for(int j=i; j<201; j++) {
				autolikes.setL_liker("finder"+j+"@finder.com");
				likesDao.like(autolikes);
				System.out.println(i+"th Newsfeed Auto like Success");
			}		
		}
	}
	@Override
	public int likeInsert(Likes likes) {
		return likesDao.like(likes);
	}
	@Override
	public int fboardLikesChk(Likes likes) {
		return likesDao.fboardLikesChk(likes);
	}

}
