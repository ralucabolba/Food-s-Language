package com.artsoft.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.artsoft.bean.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	public User findById(long id);
	
	public User findByUsername(String username);
	
	public List<User> findAll();
	
	public User save(User user);
	
	public void delete(User user);
}
