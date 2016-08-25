package com.artsoft.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.artsoft.bean.User;

public interface UserService {
	public User findById(long id);
	
	public User findByUsername(String username);
	
	public List<User> findAll();
	
	public User add(User user);
	
	public User update(User user);
	
	public void delete(User user);
	
	public Page<User> findAllByPage(Pageable pageable);
	
	public void evictCache();
}
