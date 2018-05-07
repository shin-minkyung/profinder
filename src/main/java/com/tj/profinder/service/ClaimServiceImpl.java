package com.tj.profinder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.profinder.dao.ClaimDao;
import com.tj.profinder.model.Claim;
@Service
public class ClaimServiceImpl implements ClaimService {
	@Autowired
	private ClaimDao claimDao;
	@Override
	public int claimInsert(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimInsert(claim);
	}
	@Override
	public List<Claim> claimList(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimList(claim);
	}
	@Override
	public List<Claim> claimAdminList(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimAdminList(claim);
	}
	@Override
	public int claimAnswerComplete(String cl_num) {
		// TODO Auto-generated method stub
		return claimDao.claimAnswerComplete(cl_num);
	}
	@Override
	public int claimListCount(String cl_email) {
		// TODO Auto-generated method stub
		return claimDao.claimListCount(cl_email);
	}
	@Override
	public int claimModify(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimModify(claim);
	}
	@Override
	public int claimDelete(String cl_num) {
		// TODO Auto-generated method stub
		return claimDao.claimDelete(cl_num);
	}
	@Override
	public int totalClaim() {
		// TODO Auto-generated method stub
		return claimDao.totalClaim();
	}
	@Override
	public int totalClaimBefore() {
		// TODO Auto-generated method stub
		return claimDao.totalClaimBefore();
	}
	@Override
	public int totalClaimAfter() {
		// TODO Auto-generated method stub
		return claimDao.totalClaimAfter();
	}
	@Override
	public List<Claim> claimAdminListBefore(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimAdminListBefore(claim);
	}
	@Override
	public List<Claim> claimAdminListAfter(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimAdminListAfter(claim);
	}
	@Override
	public List<Claim> claimAdminSearchListBefore(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimAdminSearchListBefore(claim);
	}
	@Override
	public List<Claim> claimAdminSearchListAfter(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimAdminSearchListAfter(claim);
	}
	@Override
	public int totalClaimAdminSearchListBefore(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.totalClaimAdminSearchListBefore(claim);
	}
	@Override
	public int totalClaimAdminSearchListAfter(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.totalClaimAdminSearchListAfter(claim);
	}
	@Override
	public int totalClaimAdminSearchList(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.totalClaimAdminSearchList(claim);
	}
	@Override
	public List<Claim> claimAdminSearchList(Claim claim) {
		// TODO Auto-generated method stub
		return claimDao.claimAdminSearchList(claim);
	}
	@Override
	public Claim getClaim(String cl_num) {
		// TODO Auto-generated method stub
		return claimDao.getClaim(cl_num);
	}

}
