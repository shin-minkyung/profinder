package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Fboard;
@Repository
public class FboardDaoImpl implements FboardDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public List<Fboard> fboardList() {
		return sessionTemplate.selectList("fboardList");
	}

	@Override
	public int fboardTotal() {
		return sessionTemplate.selectOne("fboardTotal");
	}

	@Override
	public int fboardInsert(Fboard fboard) {
		return sessionTemplate.insert("fboardInsert", fboard);
	}

	@Override
	public Fboard fboardModifyView(String fb_num) {
		return sessionTemplate.selectOne("fboardModifyView", fb_num);
	}

	@Override
	public int fboardDelete(String fb_num) {
		return sessionTemplate.delete("fboardDelete", fb_num);
	}

	@Override
	public int fboardModify(Fboard fboard) {
		System.out.println(fboard);
		return sessionTemplate.update("fboardModify", fboard);
	}

	@Override
	public int fboardHitup(String fb_num) {
		return sessionTemplate.update("fboardHitup", fb_num);
	}

	@Override
	public List<Fboard> fboardSearch(Fboard fboard) {
		return sessionTemplate.selectList("fboardSearch", fboard);
	}

	@Override
	public Fboard fboardListajax(int rn) {
		System.out.println("rn = "+rn);
		return sessionTemplate.selectOne("fboardListajax", rn);
	}

	@Override
	public int fboardLikeCnt(String fb_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("fboardLikeCnt",fb_num);
	}

	@Override
	public int fboardTotal(String fb_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("fboardTotal",fb_num);
	}

}
