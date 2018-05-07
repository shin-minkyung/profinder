package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Fboard;

public interface FboardDao {
	public List<Fboard> fboardList();
	public int fboardTotal();
	public int fboardInsert(Fboard fboard);
	public Fboard fboardModifyView(String fb_num);
	public int fboardDelete(String fb_num);
	public int fboardModify(Fboard fboard);
	public int fboardHitup(String fb_num);
	public List<Fboard> fboardSearch(Fboard fboard);
	public Fboard fboardListajax(int rn);
	public int fboardLikeCnt(String fb_num);
	public int fboardTotal(String fb_num);
}
