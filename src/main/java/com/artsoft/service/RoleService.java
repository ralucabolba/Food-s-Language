package com.artsoft.service;

import com.artsoft.bean.Role;

public interface RoleService {
	public Role findById(long id);

	public Role findByRole(String role);

	public Role save(Role role);

	public void delete(Role role);
}
