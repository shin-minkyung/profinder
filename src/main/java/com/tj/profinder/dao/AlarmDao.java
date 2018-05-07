package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Alarm;
import com.tj.profinder.model.Favorite;

public interface AlarmDao {
	public int getAlarmCnt(String al_receiver);
	public int insertJjimAlarm(Favorite jjim);
	public List<Alarm> getJjimAlarmList(String al_receiver);
	public int deleteAlarm(Alarm alarm);
}
