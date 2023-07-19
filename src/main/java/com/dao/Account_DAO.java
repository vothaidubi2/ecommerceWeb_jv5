package com.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.entities.Account;

public interface Account_DAO extends JpaRepository<Account, Integer>{
	@Query("select acc from Account acc where acc.username=:username and acc.password=:password")
	List<Account> findByUsernamePassword(@Param("username")String username,@Param("password") String password);
	
	Optional<Account> findByUsername(String username);
	
	Optional<Account> findByEmail(String email);
}
