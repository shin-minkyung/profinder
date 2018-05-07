package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Visited;

public interface VisitedService {
	public int insertVisit(Visited visit);
	public int chkifVisitedtoday(Visited visit);
	public int getVisitTodayCnt(String p_email);
	public int getVisitTotalCnt(String p_email);
	public List<Visited> getmyFinderVisitorToday(Visited host);
	public List<Visited> getmyFinderVisitorAll(Visited host);
}
