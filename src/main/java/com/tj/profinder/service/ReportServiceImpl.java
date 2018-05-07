package com.tj.profinder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.ReportDao;
import com.tj.profinder.model.Report;
@Service
public class ReportServiceImpl implements ReportService{
	@Autowired
	private ReportDao rDao;
	@Override
	public int ReportInsert(Report report) {
		return rDao.ReportInsert(report);
	}
	
}
