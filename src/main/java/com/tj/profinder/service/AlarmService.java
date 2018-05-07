package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Alarm;

public interface AlarmService {
	public int getAlarmCnt(String al_receiver);
	public List<Alarm> getAlarmList(String al_receiver);
	public int deleteAlarm(Alarm alarm);
}
