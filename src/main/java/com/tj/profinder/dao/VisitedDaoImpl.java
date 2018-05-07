package com.tj.profinder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tj.profinder.model.Visited;
@Repository
public class VisitedDaoImpl implements VisitedDao{
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int insertVisit(Visited visited) {
		return sessionTemplate.insert("insertVisit", visited);
	}

	@Override
	public int chkifVisited(Visited visited) {
		return sessionTemplate.selectOne("chkifVisitedtoday", visited);
	}

	@Override
	public int getVisitTodayCnt(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getVisitTodayCnt", p_email);
	}

	@Override
	public int getVisitTotalCnt(String p_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getVisitTotalCnt", p_email);
	}

	@Override
	public List<Visited> getmyFinderVisitorToday(Visited host) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyFinderTodayVisitor", host);
	}

	@Override
	public List<Visited> getmyFinderVisitorAll(Visited host) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getmyFinderVisitorAll", host);
	}

}
