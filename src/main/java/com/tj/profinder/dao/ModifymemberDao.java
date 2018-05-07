package com.tj.profinder.dao;

import com.tj.profinder.model.Findermembers;
import com.tj.profinder.model.Promembers;

public interface ModifymemberDao {
	/*파인더 멤버  사진 / 비밀번호 수정*/
	public int findermembersPwModify(Findermembers findermembers);
	/* 파인더 멤버 회원 탈퇴*/
	public int finderDropUpdate(String f_email);
	/* 파인더 기본정보 수정 */
	public int finderNomalUpdate(Findermembers findermembers);
	/* 파인더 부가정보 수정  */
	public int finderadditionUpdate(Findermembers findermembers);
	
	
	/* 프로 멤버 비밀번호 / 사진 수정*/
	public int promembersPwModify(Promembers promembers);
	/* 프로 멤버 회원 탈퇴*/
	public int proDropUpdate(String p_email);
	/* 프로 멤버 부가 정보 수정 */
	public int proadditionUpdate(Promembers promembers);
	/* 프로 기본정보 수정 */
	public int proNomalUpdate(Promembers promembers);
	
	/* 이메일 비교를 위한 메소드 */
	public int finderModifyChk(String f_email);
}
