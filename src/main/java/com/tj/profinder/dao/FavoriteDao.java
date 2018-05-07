package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Favorite;

public interface FavoriteDao {
	public List<Favorite> favoriteMainBannerPromembers();
	public List<Favorite> favoriteMainBannerPromembersAjax(Favorite favorite);
	public List<Favorite> topEduPros6();
	public List<Favorite> topEduPros(Favorite jjim);
	public List<Favorite> topBizPros(Favorite jjim);
	public List<Favorite> topPros(Favorite jjim);
	public int insertJjim(Favorite jjim);
	public List<Favorite> getJjimList(Favorite jjim);
	public int getJjimCnt(String p_email);
	public int jjimChk(Favorite jjim);
	public int deleteJjim(Favorite jjim);
	public List<Favorite> getmyJjimList(Favorite finder);
	public int getmyJjimCnt(String f_email);
}
