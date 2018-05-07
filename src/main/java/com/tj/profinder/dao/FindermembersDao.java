package com.tj.profinder.dao;

import com.tj.profinder.model.Findermembers;

public interface FindermembersDao {
	public int findermembersConfirmEmail(String f_email);
	public int findermembersInsert(Findermembers findermembers);
	public Findermembers getFindermember(String f_email);
	public int findermembersConfirmNickName(String f_nickname);
	public int finderInsert(Findermembers finder);
	public int pointUp(Findermembers upPoint);
	public int getFinderIDChk(Findermembers findermembers);
	public Findermembers loginFinder(Findermembers findermembers);
	public Findermembers finderSearchID(Findermembers findermembers);
	public Findermembers finderSearchPW(Findermembers findermembers);
	public int cotnentsDownload(Findermembers findermembers);
}
