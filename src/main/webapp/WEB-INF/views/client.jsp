<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="dist/css/bootstrap.min.css">

<!-- Custom css -->
<link rel="stylesheet" href="css/custom.css">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Cookie|Raleway|Open+Sans"
	rel="stylesheet">

<title>User page</title>
</head>
<body onload="loadinfo()">

	<c:import url="nav-client.jsp"></c:import>

	<section id="update-cover">
		<div class="container" id="update-container">
			<div class="col-sm-12 col-sm-offset-1">
				<h2>My account</h2>

				<br> <br>

				<form id="update-form" class="form-horizontal">
					<input type="hidden" id="id-update">
					
					<div class="form-group row">
						<label for="name-update" class="col-xs-4 col-form-label">Name</label>
						<div class="col-xs-8">
							<input class="form-control" type="text" pattern="[a-zA-Z- ]*"
								placeholder="Name" id="name-update" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="birth-date-update" class="col-xs-4 col-form-label">Birth
							date</label>
						<div class="col-xs-8">
							<input class="form-control" type="date" placeholder="Birth date"
								id="birth-date-update" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="email-update" class="col-xs-4 col-form-label">Email</label>
						<div class="col-xs-8">
							<input class="form-control" type="email" placeholder="Email"
								id="email-update" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="username-update" class="col-xs-4 col-form-label">Username</label>
						<div class="col-xs-8">
							<input class="form-control" type="text" pattern=".{6,32}"
								title="The username must contain between 6 and 32 characters "
								placeholder="Username" id="username-update" required readonly>
						</div>
					</div>


					<button type="submit" class="btn btn-info">Update</button>

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
		
	<script src="<c:url value="/javascript/main.js"/>"
		type="text/javascript"></script>

</body>
</html>