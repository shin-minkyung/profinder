package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Favorite;

public interface FavoriteService {
	public List<Favorite> favoriteMainBannerPromembers();
	public List<Favorite> favoriteMainBannerPromembersAjax(Favorite favorite);
	public List<Favorite> topEduPros6();
	public List<Favorite> topEduPros(Favorite jjim);
	public List<Favorite> topBizPros(Favorite jjim);
	public List<Favorite> topPros(Favorite jjim);
	public void autoInsertJjim();
	public List<Favorite> getJjimList(Favorite jjim);//for propage
	public int getJjimCnt(String p_email);//for propage
	public int jjimChk(Favorite jjim);
	public void insertJjim(Favorite jjim);
	public int deleteJjim(Favorite jjim);
	public List<Favorite> getmyJjimList(Favorite finder);//for finderpage
	public int getmyJjimCnt(String f_email);//for finderpage	
}
