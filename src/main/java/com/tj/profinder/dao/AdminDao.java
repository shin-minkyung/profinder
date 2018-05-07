package com.tj.profinder.dao;

import com.tj.profinder.model.Admin;

public interface AdminDao {
	public int adidChk(Admin id);
	public Admin getAdmin(Admin id);
}
