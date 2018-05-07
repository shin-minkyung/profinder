package com.tj.profinder.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tj.profinder.model.Alarm;
import com.tj.profinder.service.AlarmService;

@Controller
public class AlarmController {
	@Autowired
	private AlarmService alarmSerive;
	
	@RequestMapping(value="getAlarmCnt",method=RequestMethod.GET)
	public String getAlarmCnt(String al_receiver, Model model) {
		int alarmCnt=0;
		alarmCnt=alarmSerive.getAlarmCnt(al_receiver);
		model.addAttribute("alarmCnt", alarmCnt);
		return  "alarm/alarmCnt";
	}
	
	@RequestMapping(value="getAlarmList", method=RequestMethod.GET)
	public String getAlarmList(String al_receiver, Model model) {
		ArrayList<Alarm> alarmList = (ArrayList<Alarm>) alarmSerive.getAlarmList(al_receiver);
		model.addAttribute("alarmList", alarmList);		
		return "alarm/alarmView";
	}
	
	@RequestMapping(value="deleteAlarm", method=RequestMethod.GET)
	public void deleteAlarm(Alarm alarm) {
		alarmSerive.deleteAlarm(alarm);
	}
}
