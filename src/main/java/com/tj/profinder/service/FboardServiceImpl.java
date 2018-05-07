package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.FboardDao;
import com.tj.profinder.model.Fboard;
@Service
public class FboardServiceImpl implements FboardService {
	@Autowired
	private FboardDao fDao;
	@Override
	public List<Fboard> fboardList() {
		return fDao.fboardList();
	}

	@Override
	public int fboardTotal() {
		return fDao.fboardTotal();
	}

	@Override
	public int fboardInsert(Fboard fboard) {
		return fDao.fboardInsert(fboard);
	}

	@Override
	public Fboard fboardModifyView(String fb_num) {
		return fDao.fboardModifyView(fb_num);
	}

	@Override
	public int fboardDelete(String fb_num) {
		return fDao.fboardDelete(fb_num);
	}

	@Override
	public int fboardModify(Fboard fboard) {
		return fDao.fboardModify(fboard);
	}

	@Override
	public int fboardHitup(String fb_num) {
		return fDao.fboardHitup(fb_num);
	}

	@Override
	public List<Fboard> fboardSearch(Fboard fboard) {
		return fDao.fboardSearch(fboard);
	}

	@Override
	public Fboard fboardListajax(int rn) {
		return fDao.fboardListajax(rn);
	}

	@Override
	public void autoFboard() {
		// TODO Auto-generated method stub
		Fboard fboard = new Fboard();
		for(int i=1;i<101;i++) {
			fboard.setFb_ip("127.0.0.1");
			fboard.setFb_name("FINDER"+i+"Nick");
			fboard.setFb_title("fboardTitle"+i);
			fboard.setFb_content("fboardContent"+i);
			fboard.setFb_photo("noimg_finder.png");
			fDao.fboardInsert(fboard);
		}
	}

	@Override
	public int fboardLikeCnt(String fb_num) {
		// TODO Auto-generated method stub
		return fDao.fboardLikeCnt(fb_num);
	}

	@Override
	public int fboardTotal(String fb_num) {
		// TODO Auto-generated method stub
		return fDao.fboardTotal(fb_num);
	}
	

}
