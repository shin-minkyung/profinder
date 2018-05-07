package com.tj.profinder.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Report;
@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired
	private SqlSession SessionTemplate;
	@Override
	public int ReportInsert(Report report) {
		return SessionTemplate.insert("ReportInsert", report);
	}

}
