package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Favorite;
@Repository
public class FavoriteDaoImpl implements FavoriteDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Favorite> favoriteMainBannerPromembers() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("favoriteMainBannerPromembers");
	}

	@Override
	public List<Favorite> favoriteMainBannerPromembersAjax(Favorite favorite) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("favoriteMainBannerPromembersAjax",favorite);
	}
	@Override
	public List<Favorite> topEduPros6() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topEduPros6");
	}
	@Override
	public int insertJjim(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertJjim", jjim);
	}
	@Override
	public List<Favorite> topEduPros(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topEduPros", jjim);
	}
	@Override
	public List<Favorite> topBizPros(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topBizPros", jjim);
	}
	@Override
	public List<Favorite> topPros(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("topPros",jjim);
	}

	@Override
	public List<Favorite> getJjimList(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getJjimList", jjim);
	}

	@Override
	public int getJjimCnt(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getJjimCnt", p_email);
	}

	@Override
	public int jjimChk(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("jjimChk", jjim);
	}

	@Override
	public int deleteJjim(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteJjim", jjim);
	}
	@Override
	public List<Favorite> getmyJjimList(Favorite finder) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyJjimList", finder);
	}

	@Override
	public int getmyJjimCnt(String f_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getmyJjimCnt",f_email);
	}
}
