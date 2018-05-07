package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.tj.profinder.dao.VisitedDao;
import com.tj.profinder.model.Visited;

@Service
public class VisitedServiceImpl implements VisitedService{
	@Autowired
	private VisitedDao visitedDao;

	@Override
	public int insertVisit(Visited visit) {
		// TODO Auto-generated method stub
		return visitedDao.insertVisit(visit);
	}

	@Override
	public int chkifVisitedtoday(Visited visit) {
		// TODO Auto-generated method stub
		return visitedDao.chkifVisited(visit);
	}

	@Override
	public int getVisitTodayCnt(String p_email) {
		// TODO Auto-generated method stub
		return visitedDao.getVisitTodayCnt(p_email);
	}

	@Override
	public int getVisitTotalCnt(String p_email) {
		// TODO Auto-generated method stub
		return visitedDao.getVisitTotalCnt(p_email);
	}

	@Override
	public List<Visited> getmyFinderVisitorToday(Visited host) {
		// TODO Auto-generated method stub
		return visitedDao.getmyFinderVisitorToday(host);
	}

	@Override
	public List<Visited> getmyFinderVisitorAll(Visited host) {
		// TODO Auto-generated method stub
		return visitedDao.getmyFinderVisitorAll(host);
	}
	
	
}
