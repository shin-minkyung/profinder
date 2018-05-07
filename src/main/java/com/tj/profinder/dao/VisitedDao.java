package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Visited;

public interface VisitedDao {
	public int insertVisit(Visited visited);
	public int chkifVisited(Visited visited);
	public int getVisitTodayCnt(String p_email);
	public int getVisitTotalCnt(String p_email);
	public List<Visited> getmyFinderVisitorToday(Visited host);
	public List<Visited> getmyFinderVisitorAll(Visited host);
}
