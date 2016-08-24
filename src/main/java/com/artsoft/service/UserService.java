package com.artsoft.service;

import java.util.List;

import com.artsoft.bean.User;

public interface UserService {
	public User findById(long id);
	
	public User findByUsername(String username);
	
	public List<User> findAll();
	
	public User add(User user);
	
	public User update(User user);
	
	public void delete(User user);
}
