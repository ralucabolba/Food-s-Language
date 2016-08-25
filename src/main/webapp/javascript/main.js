function loadinfo() {
	$.ajax({
		url : "client/fetch",
		type : "GET",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},

		success : function(user) {
			var birthDate = new Date(user.birthDate);

			var day = ("0" + birthDate.getDate()).slice(-2);
			var month = ("0" + (birthDate.getMonth() + 1)).slice(-2);

			var date = birthDate.getFullYear()+"-"+(month)+"-"+(day) ;

			
			$("#id-update").val(user.id);
			$("#name-update").val(user.name);
			$("#birth-date-update").val(date);
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
	$("#user-name").append(localStorage.getItem("name-user"));
}

function showError(error) {
	alert(error);
}

function getPages(){
	var content = "";

	fetchUsers(0);
	localStorage.setItem("name-user", "Administrator");
	writeName();
	
	$.ajax({
		url : "users?size=12",
		type : "GET",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},

		success : function(users) {
			var noPages = users.totalPages;
			
			if(noPages > 0){
				content += '<nav aria-label="..."> <ul id="users-pag" class="pagination">';
				for(var index = 0; index < noPages; index++){
					content += '<li class="page-item users-page-item"><a class="page-link" href="javascript:void(0)">'+ (index + 1) +'</a></li>';
				}
				
				content += '</ul></nav>';
			}
			
			$("#admin-container").append(content);
		}
	});
}

function fetchUsers(pageNo) {
	var i = 0;
	var content = "";

	$("#users-container").empty();
	
	$.ajax({
		url : "users?page=" + pageNo + "&size=12",
		type : "GET",

		beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept", "application/json");
			xhr.setRequestHeader("Content-Type", "application/json");
		},

		success : function(users) {
			$.each(users.content, function(i, user){
				if (i % 4 === 0) {
					content += '<div class="row">';
				}

				content += '<div class="col-sm-3">'
						+ '<div class="card card-block">'
						+ '<h5 class="card-title">' + user.name + '</h5>'
						+ '<label id="' + user.id +'"></label>'
						+ '<p class="card-text username-card">' + user.username + "<br>"
						+ user.email + '</p>'
						+ '<a href="#" class="details"><i class="ion-ios-help-outline"></i></a>' 
					/*	+ '<a href="#" class="edit"><i class="ion-ios-gear-outline"></i></a>' */
						+ '<a href="#" class="delete"><i class="ion-ios-close-outline"></i></a>'
						+ '</div> </div>';

				if ((i + 1) % 4 === 0) {
					content += '</div>';
				}
			});
			
			$("#users-container").append(content);
		}
	});
}
$(document).ready(function() {
	/* Csrf parameter needed for spring security */
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");

	/*Submit form responsible for logout operation*/
	$("#logout").click(function() {
		$("#logout-form").submit();
	});

	/*Show the user info when admin presses on info button from a card*/
	$("div#users-container").on("click", "a.details", function(){
		var id = $(this).parent("div").children("label").attr("id");
		
		$.ajax({
			url: "user/" + id,
			type: "GET",
			
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
			},

			success : function(user) {
				var birthDate = new Date(user.birthDate);

				var day = ("0" + birthDate.getDate()).slice(-2);
				var month = ("0" + (birthDate.getMonth() + 1)).slice(-2);

				var date = birthDate.getFullYear()+"-"+(month)+"-"+(day);
				
				$(".name-cell").html(user.name);
				$(".birth-date-cell").html(date);
				$(".email-cell").html(user.email);
				$(".username-cell").html(user.username);
				$(".role-cell").html(user.role.role);
				
				$("#info-modal").modal('show');
			}
		});
	});

	/*Show the confirmation modal when admin presses the delete button from a card*/
	$("div#users-container").on("click", "a.delete", function(){
		var id = $(this).parent("div").children("label").attr("id");
		
		localStorage.setItem("user-id", id);
		
		$("#delete-user-modal").modal("show");
	});
	
	/*Delete the user when the delete button from modal is pressed*/
	$("#delete-user-button").click(function(){
		var id = localStorage.getItem("user-id");
		localStorage.clear();
		
		$.ajax({
			url: "user/" + id,
			type:"DELETE",
			
			beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept", "application/json");
				xhr.setRequestHeader("Content-Type", "application/json");
				xhr.setRequestHeader(header, token);
			},

			complete : function(xhr) {
				if(xhr.status === 204){
					alert("User deleted successfully");
					location.reload();
				}
				else{
					alert("Something went wrong..");
				}
			}
		});
	});
	
	/*Pagination processing*/
	$("div").on("click", "li.users-page-item", function(){
		var pageNo = $(this).children("a").text();
		fetchUsers(pageNo-1);
	});

	/*Show add user modal when '+' button is pressed*/
	$("#add-user").click(function(){
		$("#add-user-modal").modal("show");
	});
	
	/*Submit add form*/
	$("#add-user-form").submit(function(e){
		e.preventDefault();
		
		var role = $("#role-user-add option:selected").text();
		var name = $("#name-user-add").val();
		var birthDate = $("#birth-date-user-add").val();
		var email = $("#email-user-add").val();
		var username = $("#username-user-add").val();
		var password = $("#password-user-add").val();
		var confirmationPassword = $("#confirmation-password-user-add").val();
		
		var role = {
			'role' : role
		};
		
		var user = {
			'name' : name,
			'birthDate' : birthDate,
			'email' : email,
			'username' : username,
			'password' : password,
			'confirmationPassword' : confirmationPassword,
			'role': role
		};
	
		$.ajax({
			url: "user",
			type: "POST",
			dataType: "json",
			data: JSON.stringify(user),
			
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
					location.reload();
				}
			},

			complete : function(xhr) {
				if (xhr.status === 422) {
					alert("The username already exists.");
				} else if (xhr.status === 201) {
					alert("Account created");
					location.reload();
				}
			}
		});
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
					// window.location = "login";
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