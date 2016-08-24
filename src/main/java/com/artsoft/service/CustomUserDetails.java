package com.artsoft.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artsoft.repository.UserRepository;

@Service
@Transactional(readOnly = true)
public class CustomUserDetails implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		com.artsoft.bean.User user;

		try {
			user = userRepository.findByUsername(username);
			if (user == null) {
				throw new UsernameNotFoundException("Username not found.");
			}
		} catch (Exception e) {
			throw new UsernameNotFoundException("Database error");
		}

		return buildUserFromUserEntity(user);
	}

	private User buildUserFromUserEntity(com.artsoft.bean.User user) {
		String username = user.getUsername();
		String password = user.getPassword();

		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(user.getRole().getRole()));

		return new User(username, password, authorities);
	}

}
