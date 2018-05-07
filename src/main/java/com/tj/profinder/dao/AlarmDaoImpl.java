package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Alarm;
import com.tj.profinder.model.Favorite;

@Repository
public class AlarmDaoImpl implements AlarmDao{
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int getAlarmCnt(String al_receiver) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getAlarmCnt", al_receiver);
	}
	@Override
	public int insertJjimAlarm(Favorite jjim) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("insertJjimAlarm", jjim);
	}
	@Override
	public List<Alarm> getJjimAlarmList(String al_receiver) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("getjjimAlarmList", al_receiver);
	}
	@Override
	public int deleteAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("deleteAlarm", alarm);
	}

}
