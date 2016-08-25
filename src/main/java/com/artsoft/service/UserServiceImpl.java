package com.artsoft.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artsoft.bean.User;
import com.artsoft.repository.UserRepository;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	@Cacheable(value = "users", key = "#id")
	public User findById(long id) {
		return userRepository.findById(id);
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	@CachePut(value = "users", key = "#result.id")
	public User add(User user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
		return userRepository.save(user);
	}

	@Override
	@CachePut(value = "users", key = "#user.id")
	public User update(User user) {
		return userRepository.save(user);
	}

	@Override
	@CacheEvict(value = "users", key = "#user.id")
	public void delete(User user) {
		userRepository.delete(user);
	}

	@Override
	public Page<User> findAllByPage(Pageable pageable) {
		return userRepository.findAll(pageable);
	}

	@Override
	@CacheEvict(value = "users", allEntries = true)
	public void evictCache() {

	}

}
