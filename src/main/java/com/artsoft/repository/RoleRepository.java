package com.artsoft.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.artsoft.bean.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long> {
	
	public Role findById(long id);
	
	public Role findByRole(String role);
	
	public Role save(Role role);
	
	public void delete(Role role);
}
