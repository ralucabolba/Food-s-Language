function loadinfo() {
	$.ajax({
		url : "client/fetch",
		type : "GET",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},

		success : function(user) {
			$("#id-update").val(user.id);
			$("#name-update").val(user.name);
			$("#birth-date-update").val(user.birthDate);
			$("#email-update").val(user.email);
			$("#username-update").val(user.username);

			if (!localStorage.getItem("name-user")) {
				localStorage.setItem("name-user", user.name);
			}

			$("#user-name").append(user.name);
		}
	});
}

function writeName() {
	console.log(localStorage.getItem("name-user"));
	$("#user-name").append(localStorage.getItem("name-user"));
}

function showError(error) {
	alert(error);
}

function fetchUsers() {
	var i = 0;
	var content = "";

	$.ajax({
		url : "users",
		type : "GET",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},

		success : function(users) {
			for (user in users) {
				if (i % 4 === 0) {
					content += '<div class="row">';
				}

				content += '<div class="col-sm-4">'
						+ '<div class="card card-block">'
						+ '<h3 class="card-title">' + user.name + '</h3>'
						+ '<p class="card-text">' + user.username + "<br>"
						+ user.email + '</p>'
						+ '<a href="#" class="btn btn-info">More details</a>'
						+ '</div> </div>';

				if ((i + 1) % 4 === 0) {
					content += '</div>';
				}
			}
			
			$("#admin-container").append(content);
		}
	});
}
$(document).ready(function() {
	/* Csrf parameter needed for spring security */
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");

	$("#logout").click(function() {
		$("#logout-form").submit();
	});

	/* Submit signup form */
	$("#signup-form").submit(function(e) {
		e.preventDefault();

		var name = $("#name-signup").val();
		var birthDate = $("#birth-date-signup").val();
		var email = $("#email-signup").val();
		var username = $("#username-signup").val();
		var password = $("#password-signup").val();
		var confirmationPassword = $("#confirmation-password-signup").val();

		var user = {
			'name' : name,
			'birthDate' : birthDate,
			'email' : email,
			'username' : username,
			'password' : password,
			'confirmationPassword' : confirmationPassword
		};

		$.ajax({
			url : "user",
			type : "POST",
			dataType : "json",
			data : JSON.stringify(user),

			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},

			success : function(xhr) {
				if (xhr.status === 422) {
					alert("The username already exists.");
				} else if (xhr.status === 201) {
					alert("Account created");
					window.location = "login";
				}
			},

			complete : function(xhr) {
				if (xhr.status === 422) {
					alert("The username already exists.");
				} else if (xhr.status === 201) {
					alert("Account created");
					window.location = "login";
				}
			}

		});
	});

	/* Submit update form */
	$("#update-form").submit(function(e) {
		e.preventDefault();

		var id = $("#id-update").val();
		var name = $("#name-update").val();
		var birthDate = $("#birth-date-update").val();
		var email = $("#email-update").val();
		var username = $("#username-update").val();

		var user = {
			'id' : id,
			'name' : name,
			'birthDate' : birthDate,
			'email' : email,
			'username' : username
		};

		$.ajax({
			url : "user/" + id,
			type : "PUT",
			dataType : "json",
			data : JSON.stringify(user),

			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},

			success : function(user, xhr) {
				if (xhr.status === 422) {
					alert("The username already exists.");
				} else if (xhr.status === 200) {
					alert("Account updated");
					location.reload();
				}
			},

			complete : function(xhr) {
				if (xhr.status === 422) {
					alert("The username already exists.");
				} else if (xhr.status === 200) {
					alert("Account updated");
					location.reload();
				}
			}
		})
	});

});