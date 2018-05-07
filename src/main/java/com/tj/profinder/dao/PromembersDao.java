package com.tj.profinder.dao;

import java.util.List;

import com.tj.profinder.model.Promembers;
import com.tj.profinder.model.SearchPro;

public interface PromembersDao {
	public int promembersConfirmEmail(String p_email);
	public int promembersInsert(Promembers promembers);
	public Promembers getPromembers(String p_email);
	public int promembersConfirmNickName(String p_nickname);
	public int proInsert(Promembers pro);
	public List<Promembers> searchProforSM(SearchPro searchPro);
	public int searchProforSMCnt(SearchPro searchPro);
	public int getProIDChk(Promembers promembers);
	public Promembers LoginPro(Promembers promembers);
	public Promembers proSearchID(Promembers promembers);
	public Promembers proSearchPW(Promembers promembers);
	public int contentsPointUp(Promembers promembers);
}
