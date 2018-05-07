package com.tj.profinder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.profinder.model.Claim;
@Repository
public class ClaimDaoImpl implements ClaimDao {
	@Autowired
	private SqlSession sessionTemplate;
	@Override
	public int claimInsert(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.insert("claimInsert",claim);
	}
	@Override
	public List<Claim> claimList(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("claimList",claim);
	}
	@Override
	public List<Claim> claimAdminList(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("claimAdminList",claim);
	}
	@Override
	public int claimAnswerComplete(String cl_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("claimAnswerComplete",cl_num);
	}
	@Override
	public int claimListCount(String cl_email) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("claimListCount",cl_email);
	}
	@Override
	public int claimModify(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("claimModify",claim);
	}
	@Override
	public int claimDelete(String cl_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.delete("claimDelete",cl_num);
	}
	@Override
	public int totalClaim() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("totalClaim");
	}
	@Override
	public int totalClaimBefore() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("totalClaimBefore");
	}
	@Override
	public int totalClaimAfter() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("totalClaimAfter");
	}
	@Override
	public List<Claim> claimAdminListBefore(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("claimAdminListBefore",claim);
	}
	@Override
	public List<Claim> claimAdminListAfter(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("claimAdminListAfter",claim);
	}
	@Override
	public List<Claim> claimAdminSearchListBefore(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("claimAdminSearchListBefore",claim);
	}
	@Override
	public List<Claim> claimAdminSearchListAfter(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("claimAdminSearchListAfter",claim);
	}
	@Override
	public int totalClaimAdminSearchListBefore(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("totalClaimAdminSearchListBefore",claim);
	}
	@Override
	public int totalClaimAdminSearchListAfter(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("totalClaimAdminSearchListAfter",claim);
	}
	@Override
	public int totalClaimAdminSearchList(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("totalClaimAdminSearchList",claim);
	}
	@Override
	public List<Claim> claimAdminSearchList(Claim claim) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("claimAdminSearchList",claim);
	}
	@Override
	public Claim getClaim(String cl_num) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("getClaim",cl_num);
	}

}
