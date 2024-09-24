package com.fashion.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.fashion.model.Users;
public interface UserRepository extends JpaRepository<Users	, Integer>{
	@Query("select e from Users e where email=?1 and password=?2")
	public Users checkemplogin(String email, String pwd);

}
