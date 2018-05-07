package com.tj.profinder.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.profinder.model.Category;
import com.tj.profinder.model.Findermembers;

public interface FindermembersService {
	public List<Category> categorySelect();
	public int findermembersConfirmEmail(String f_email);
	public int findermembersInsert(MultipartHttpServletRequest mRequest, HttpSession httpSession);
	public int findermembersConfirmNickName(String f_nickname);
	public void insert100Finders();
	public Findermembers getFindermember(String f_email);
	public int pointUp(Findermembers upPoint);
	public int getFinderIDChk(Findermembers findermembers);
	public Findermembers loginFinder(Findermembers findermembers, HttpServletRequest request);
	public Findermembers finderSearchID(Findermembers findermembers);
	public Findermembers finderSearchPW(Findermembers findermembers);
	public int cotnentsDownload(Findermembers findermembers);
}
