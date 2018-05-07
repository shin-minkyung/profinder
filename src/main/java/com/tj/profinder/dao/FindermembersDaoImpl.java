package com.tj.profinder.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Findermembers;

@Repository
public class FindermembersDaoImpl implements FindermembersDao {
	@Autowired
	private SqlSession sessionTemplate;
	
	@Override
	public int findermembersConfirmEmail(String f_email) {
		return sessionTemplate.selectOne("findermembersConfirmEmail", f_email);
	}

	@Override
	public int findermembersInsert(Findermembers findermembers) {
		System.out.println("DAO : "+findermembers.toString());
		return sessionTemplate.insert("findermembersInsert", findermembers);
	}

	
	@Override
	public int findermembersConfirmNickName(String f_nickname) {
		return sessionTemplate.selectOne("findermembersConfirmNickName", f_nickname);
	}

	@Override
	public int finderInsert(Findermembers finder) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("finderInsert", finder);
	}

	@Override
	public Findermembers getFindermember(String f_email) {
		System.out.println(f_email);
		return sessionTemplate.selectOne("getFindermember", f_email);
	}

	@Override
	public int pointUp(Findermembers upPoint) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("pointUp", upPoint);
	}

	@Override
	public int getFinderIDChk(Findermembers findermembers) {
		return sessionTemplate.selectOne("getFinderIDChk", findermembers);
	}

	@Override
	public Findermembers loginFinder(Findermembers findermembers) {
		return sessionTemplate.selectOne("loginFinder", findermembers);
	}

	@Override
	public Findermembers finderSearchID(Findermembers findermembers) {
		return sessionTemplate.selectOne("finderSearchID", findermembers);
	}

	@Override
	public Findermembers finderSearchPW(Findermembers findermembers) {
		return sessionTemplate.selectOne("finderSearchPW", findermembers);
	}
	@Override
	public int cotnentsDownload(Findermembers findermembers) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("cotnentsDownload",findermembers);
	}

}
