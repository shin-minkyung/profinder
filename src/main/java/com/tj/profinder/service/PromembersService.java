package com.tj.profinder.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.model.Category;
import com.tj.profinder.model.Promembers;
import com.tj.profinder.model.SearchPro;

public interface PromembersService {
	public List<Category> categorySelect();
	public int promembersConfirmEmail(String p_email);
	public int promembersInsert(MultipartHttpServletRequest mRequest, HttpSession httpSession);
	public Promembers getPromembers(String p_email);
	public int promembersConfirmNickName(String p_nickname);
	public void insert100pros();
	public List<Promembers> searchProforSM(SearchPro searchPro);
	public int searchProforSMCnt(SearchPro searchPro);
	public int getProIDChk(Promembers promembers);
	public Promembers LoginPro(Promembers promembers, HttpServletRequest request);
	public Promembers proSearchID(Promembers promembers);
	public Promembers proSearchPW(Promembers promembers);
	public int contentsPointUp(Promembers promembers);
}
