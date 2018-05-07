package com.tj.profinder.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.AlarmDao;
import com.tj.profinder.model.Alarm;

@Service
public class AlarmServiceImpl implements AlarmService{
	@Autowired
	private AlarmDao alarmDao;

	@Override
	public int getAlarmCnt(String al_receiver) {
		// TODO Auto-generated method stub
		return alarmDao.getAlarmCnt(al_receiver);
	}

	@Override
	public List<Alarm> getAlarmList(String al_receiver) {
		// TODO Auto-generated method stub		
		ArrayList<Alarm> alarmList = new ArrayList<Alarm>(); 
		//The object "alarmList" is every type of alarmList combined. 
		//You can add new types of alarm ArrayList later.
		ArrayList<Alarm> jjimAlarm = (ArrayList<Alarm>) alarmDao.getJjimAlarmList(al_receiver);
		alarmList.addAll(jjimAlarm);
		return alarmList;
	}

	@Override
	public int deleteAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return alarmDao.deleteAlarm(alarm);
	}
	
}
