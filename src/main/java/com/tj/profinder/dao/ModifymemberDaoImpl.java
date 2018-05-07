package com.tj.profinder.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Findermembers;
import com.tj.profinder.model.Promembers;
@Repository
public class ModifymemberDaoImpl implements ModifymemberDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	/* 파인더 멤버 비밀번호 / 사진 변경 */
	@Override
	public int findermembersPwModify(Findermembers findermembers) {
		System.out.println(findermembers);
		return sessionTemplate.update("finderModifyPw", findermembers);
	}

	/* 파인더 멤버 회원 탈퇴 */
	@Override
	public int finderDropUpdate(String f_email) {
		return sessionTemplate.update("finderDropUpdate", f_email);
	}

	/* 프로 멤버 비밀번호 / 사진 변경 */
	@Override
	public int promembersPwModify(Promembers promembers) {
		return sessionTemplate.update("proModifyPw", promembers);
	}

	/* 프로 멤버 회원 탈퇴 */
	@Override
	public int proDropUpdate(String p_email) {
		return sessionTemplate.update("proDropUpdate", p_email);
	}

	/* 비교를 위한 메소드 */
	@Override
	public int finderModifyChk(String f_email) {
		return sessionTemplate.selectOne("finderModifyChk", f_email);
	}

	/* 프로 멤버 기본 정보 변경 */
	@Override
	public int proNomalUpdate(Promembers promembers) {
		return sessionTemplate.update("proNomalUpdate", promembers);
	}

	/* 파인더 멤버 기본정보 변경 */
	@Override
	public int finderNomalUpdate(Findermembers findermembers) {
		return sessionTemplate.update("finderNomalUpdate", findermembers);
	}

	/* 파인더 멤버 부가 정보 변경 */
	@Override
	public int finderadditionUpdate(Findermembers findermembers) {
		return sessionTemplate.update("finderadditionUpdate", findermembers);
	}

	/* 프로 멤버 부가 정보 변경 */
	@Override
	public int proadditionUpdate(Promembers promembers) {
		return sessionTemplate.update("proadditionUpdate", promembers);
	}

}
