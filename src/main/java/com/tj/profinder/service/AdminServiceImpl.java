package com.tj.profinder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.AdminDao;
import com.tj.profinder.model.Admin;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Override
	public int adidChk(Admin id) {
		// TODO Auto-generated method stub
		return adminDao.adidChk(id);
	}

	@Override
	public Admin getAdmin(Admin id) {
		// TODO Auto-generated method stub
		return adminDao.getAdmin(id);
	}

	@Override
	public int adminLoginChk(Admin admin) {
		// TODO Auto-generated method stub
		int result=0;
		String id = admin.getAd_id();
		String pw = admin.getAd_pw();
		int idCnt = adminDao.adidChk(admin);
		if(idCnt==1) {
			Admin adminDB= adminDao.getAdmin(admin);
			System.out.println("db의 비번"+adminDB.getAd_pw());
			System.out.println("입력한 비번 "+pw);
			if(pw.equals(adminDB.getAd_pw()) || pw==adminDB.getAd_pw()) {
				result=1;
			}else if(!pw.equals(adminDB.getAd_pw()) || pw!=adminDB.getAd_pw()) {
				result=0;
			}
		}else if(idCnt==0){
			result=-1;
		}
		return result;
	}

}
