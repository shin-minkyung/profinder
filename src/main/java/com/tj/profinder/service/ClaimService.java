package com.tj.profinder.service;

import java.util.List;

import com.tj.profinder.model.Claim;

public interface ClaimService {
	public int claimInsert(Claim claim);
	public List<Claim> claimList(Claim claim);
	public List<Claim> claimAdminList(Claim claim);
	public int claimAnswerComplete(String cl_num);
	public int claimListCount(String cl_email);
	public int claimModify(Claim claim);
	public int claimDelete(String cl_num);
	public int totalClaim();
	public int totalClaimBefore();
	public int totalClaimAfter();
	public List<Claim> claimAdminListBefore(Claim claim);
	public List<Claim> claimAdminListAfter(Claim claim);
	public List<Claim> claimAdminSearchListBefore(Claim claim);
	public List<Claim> claimAdminSearchListAfter(Claim claim);
	public int totalClaimAdminSearchListBefore(Claim claim);
	public int totalClaimAdminSearchListAfter(Claim claim);
	public int totalClaimAdminSearchList(Claim claim);
	public List<Claim> claimAdminSearchList(Claim claim);
	public Claim getClaim(String cl_num);
}
