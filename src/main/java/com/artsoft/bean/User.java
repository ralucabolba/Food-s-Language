package com.artsoft.bean;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name = "users")
public class User implements Serializable {
	private static final long serialVersionUID = -5011259324796393705L;

	@Id
	@GeneratedValue
	private long id;

	private String name;

	@Temporal(TemporalType.DATE)
	private Date birthDate;

	private String email;

	private String username;

	private String password;

	@Transient
	private String confirmationPassword;

	@ManyToOne
	@JoinColumn(name = "roleId")
	private Role role;

	public User() {

	}

	public User(String name, Date birthDate, String email, String username, String password,
			String confirmationPassword) {
		super();
		this.name = name;
		this.birthDate = birthDate;
		this.email = email;
		this.username = username;
		this.password = password;
		this.confirmationPassword = confirmationPassword;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmationPassword() {
		return confirmationPassword;
	}

	public void setConfirmationPassword(String confirmationPassword) {
		this.confirmationPassword = confirmationPassword;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}
