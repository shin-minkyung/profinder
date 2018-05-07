package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.AlarmDao;
import com.tj.profinder.dao.FavoriteDao;
import com.tj.profinder.model.Favorite;
@Service
public class FavoriteServiceImpl implements FavoriteService {
	@Autowired
	private FavoriteDao favoriteDao;
	@Autowired
	private AlarmDao alarmDao;
	@Override
	public List<Favorite> favoriteMainBannerPromembers() {
		// TODO Auto-generated method stub
		return favoriteDao.favoriteMainBannerPromembers();
	}

	@Override
	public List<Favorite> favoriteMainBannerPromembersAjax(Favorite favorite) {
		// TODO Auto-generated method stub
		return favoriteDao.favoriteMainBannerPromembersAjax(favorite);
	}
	@Override
	public List<Favorite> topEduPros6() {
		// TODO Auto-generated method stub
		return favoriteDao.topEduPros6();
	}
	
	@Override
	public List<Favorite> topEduPros(Favorite jjim) {
		// TODO Auto-generated method stub
		return favoriteDao.topEduPros(jjim);
	}
	@Override
	public List<Favorite> topBizPros(Favorite jjim) {
		// TODO Auto-generated method stub
		return favoriteDao.topBizPros(jjim);
	}
	@Override
	public List<Favorite> topPros(Favorite jjim) {
		// TODO Auto-generated method stub
		return favoriteDao.topPros(jjim);
	}
	@Override
	public void autoInsertJjim() {
		// TODO Auto-generated method stub
		Favorite jjim = new Favorite();		
		for(int i=1; i<201; i++) {			
			jjim.setP_email("pro"+i+"@pro.com");
			System.out.println(i+"th Pro Jjim complete");
			for(int j=i; j<201; j++) {
				jjim.setF_email("finder"+j+"@finder.com");
				favoriteDao.insertJjim(jjim);
			}
		}		
	}
	
	@Override
	public List<Favorite> getJjimList(Favorite jjim) {
		// TODO Auto-generated method stub
		return favoriteDao.getJjimList(jjim);
	}

	@Override
	public int getJjimCnt(String p_email) {
		// TODO Auto-generated method stub
		return favoriteDao.getJjimCnt(p_email);
	}

	@Override
	public int jjimChk(Favorite jjim) {
		// TODO Auto-generated method stub
		return favoriteDao.jjimChk(jjim);
	}

	@Override
	public void insertJjim(Favorite jjim) {
		// TODO Auto-generated method stub		
		favoriteDao.insertJjim(jjim);
		alarmDao.insertJjimAlarm(jjim);
	}

	@Override
	public int deleteJjim(Favorite jjim) {
		// TODO Auto-generated method stub
		return favoriteDao.deleteJjim(jjim);
	}

	@Override
	public List<Favorite> getmyJjimList(Favorite finder) {
		// TODO Auto-generated method stub
		return favoriteDao.getmyJjimList(finder);
	}

	@Override
	public int getmyJjimCnt(String f_email) {
		// TODO Auto-generated method stub
		return favoriteDao.getmyJjimCnt(f_email);
	}

	

}
