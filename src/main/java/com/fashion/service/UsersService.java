package com.fashion.service;

import com.fashion.model.Users;

public interface UsersService 
{
	public  String adduser(Users emp);
	public String updateuser(Users emp);
	public Users viewuserbyid(int eid);
	public Users checkemplogin(String email, String pwd);
	
}
