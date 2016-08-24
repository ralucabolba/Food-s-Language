<!DOCTYPE>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<title>Register for free</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="dist/css/bootstrap.min.css">

<!-- Custom css -->
<link rel="stylesheet" href="css/custom.css">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Cookie|Raleway|Open+Sans"
	rel="stylesheet">

</head>
<body>

	<!-- Add the nav bar -->
	<c:import url="nav.jsp"></c:import>

	<section id="signup-cover">
		<div class="container" id="signup-container">
			<div class="col-sm-12 col-sm-offset-1">
				<h2>Register now for free</h2>
				
				<br><br>
				
				<form id="signup-form" class="form-horizontal">

					<div class="form-group row">
						<label for="name-signup" class="col-xs-4 col-form-label">Name</label>
						<div class="col-xs-8">
							<input class="form-control" type="text" pattern="[a-zA-Z- ]*"
								placeholder="Name" id="name-signup" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="birth-date-signup" class="col-xs-4 col-form-label">Birth
							date</label>
						<div class="col-xs-8">
							<input class="form-control" type="date" placeholder="Birth date"
								id="birth-date-signup" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="email-signup" class="col-xs-4 col-form-label">Email</label>
						<div class="col-xs-8">
							<input class="form-control" type="email" placeholder="Email"
								id="email-signup" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="username-signup" class="col-xs-4 col-form-label">Username</label>
						<div class="col-xs-8">
							<input class="form-control" type="text" pattern=".{6,32}"
								title="The username must contain between 6 and 32 characters "
								placeholder="Username" id="username-signup" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="password-signup" class="col-xs-4 col-form-label">Password</label>
						<div class="col-xs-8">
							<input class="form-control" type="password" pattern=".{6,32}"
								title="The password must contain between 6 and 32 characters "
								placeholder="Password" id="password-signup" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="confirmation-password-signup"
							class="col-xs-4 col-form-label">Confirmation password</label>
						<div class="col-xs-8">
							<input class="form-control" type="password" pattern=".{6,32}"
								title="The password must contain between 6 and 32 characters "
								placeholder="Confirmation password"
								id="confirmation-password-signup" required>
						</div>
					</div>

					<button type="submit" class="btn btn-info">Sign up</button>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
				</form>
			</div>
		</div>
	</section>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

	<!-- Bootstrap Javascript -->
	<script
		src="https://www.atlasestateagents.co.uk/javascript/tether.min.js"></script>
		
	<script src="dist/js/bootstrap.min.js" type="text/javascript"></script>
	
	<!-- Custom Javascript -->
	<script src="<c:url value="/javascript/main.js" />" type="text/javascript"></script>
</body>
</html>