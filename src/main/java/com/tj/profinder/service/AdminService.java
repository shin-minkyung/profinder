package com.tj.profinder.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.tj.profinder.model.Admin;

public interface AdminService {		
	public int adidChk(Admin id);
	public Admin getAdmin(Admin id);
	public int adminLoginChk(Admin admin);
}
