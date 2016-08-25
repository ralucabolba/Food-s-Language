<!DOCTYPE>

<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

</head>
<body>

	<!-- Add user modal -->
	<div class="modal fade" id="add-user-modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Add new user</h4>
				</div>
				<div class="modal-body">
					<form id="add-user-form" class="form-horizontal">
						<div class="form-group row">
							<label for="role-user-add" class="col-xs-4 col-form-label">Role</label>
							<div class="col-xs-8">
								<select class="form-control" id="role-user-add">
									<option>ROLE_USER</option>
									<option>ROLE_ADMIN</option>
								</select>
							</div>
						</div>

						<div class="form-group row">
							<label for="name-user-add" class="col-xs-4 col-form-label">Name</label>
							<div class="col-xs-8">
								<input class="form-control" type="text" pattern="[a-zA-Z- ]*"
									placeholder="Name" id="name-user-add" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="birth-date-user-add" class="col-xs-4 col-form-label">Birth
								date</label>
							<div class="col-xs-8">
								<input class="form-control" type="date" placeholder="Birth date"
									id="birth-date-user-add" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="email-user-add" class="col-xs-4 col-form-label">Email</label>
							<div class="col-xs-8">
								<input class="form-control" type="email" placeholder="Email"
									id="email-user-add" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="username-user-add" class="col-xs-4 col-form-label">Username</label>
							<div class="col-xs-8">
								<input class="form-control" type="text" pattern=".{6,32}"
									title="The username must contain between 6 and 32 characters "
									placeholder="Username" id="username-user-add" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="password-user-add" class="col-xs-4 col-form-label">Password</label>
							<div class="col-xs-8">
								<input class="form-control" type="password" pattern=".{6,32}"
									title="The password must contain between 6 and 32 characters "
									placeholder="Password" id="password-user-add" required>
							</div>
						</div>

						<div class="form-group row">
							<label for="confirmation-password-user-add"
								class="col-xs-4 col-form-label">Confirmation password</label>
							<div class="col-xs-8">
								<input class="form-control" type="password" pattern=".{6,32}"
									title="The password must contain between 6 and 32 characters "
									placeholder="Confirmation password"
									id="confirmation-password-user-add" required>
							</div>
						</div>

						<button type="submit" class="btn btn-outline-info">Add user</button>

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>