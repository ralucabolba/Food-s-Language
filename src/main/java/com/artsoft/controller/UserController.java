package com.artsoft.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.artsoft.bean.Role;
import com.artsoft.bean.User;
import com.artsoft.service.RoleService;
import com.artsoft.service.UserService;

@RestController
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/success", method = RequestMethod.GET)
	public ModelAndView success() {
		ModelAndView model = new ModelAndView();

		/* Get the authenticated user */
		User user = userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());

		if (user.getRole().getRole().equals("ROLE_ADMIN")) {
			model.setViewName("redirect:/admin");
		} else if (user.getRole().getRole().equals("ROLE_USER")) {
			model.setViewName("redirect:/client");
		}

		return model;
	}

	@RequestMapping(value = "/client/fetch", method = RequestMethod.GET)
	public ModelAndView fetchUser() {
		ModelAndView model = new ModelAndView();

		User user = userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
		model.setViewName("redirect:/user/" + user.getId());

		return model;
	}
	
	@RequestMapping(value="/users", method=RequestMethod.GET)
	public Page<User> getUsers(Pageable pageable){
		Page<User> users = userService.findAllByPage(pageable);
		return users;
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public User getUser(@PathVariable long id) {
		return userService.findById(id);
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<User> addUser(@RequestBody User user) {
		if (userService.findByUsername(user.getUsername()) != null) {
			return new ResponseEntity<User>(HttpStatus.UNPROCESSABLE_ENTITY);
		} else {
			Role role = roleService.findByRole(user.getRole().getRole());

			if (role == null) {
				role = new Role();
				role.setRole(user.getRole().getRole());
				role = roleService.save(role);
			}
			user.setRole(role);
			User insertedUser = userService.add(user);
			return new ResponseEntity<User>(insertedUser, HttpStatus.CREATED);
		}
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<User> updateUser(@RequestBody User user) {
		User originalUser = userService.findById(user.getId());

		if (!user.getUsername().equals(originalUser.getUsername())
				&& userService.findByUsername(user.getUsername()) != null) {
			return new ResponseEntity<User>(HttpStatus.UNPROCESSABLE_ENTITY);
		}

		originalUser.setName(user.getName());
		originalUser.setBirthDate(user.getBirthDate());
		originalUser.setEmail(user.getEmail());
		originalUser.setUsername(user.getUsername());

		User updatedUser = userService.update(originalUser);

		return new ResponseEntity<User>(updatedUser, HttpStatus.OK);
	}
	
	@RequestMapping(value="/user/{id}", method = RequestMethod.DELETE, consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<User> deleteUser(@PathVariable("id") long id){
		userService.delete(userService.findById(id));
		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
	}
}
