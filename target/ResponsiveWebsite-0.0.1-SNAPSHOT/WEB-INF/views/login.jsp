<!DOCTYPE html>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>Food's Language</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="dist/css/bootstrap.min.css">

<!-- Custom css -->
<link rel="stylesheet" href="css/custom.css">

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Cookie|Raleway|Open+Sans"
	rel="stylesheet">

</head>
<body>
	<c:import url="nav.jsp"></c:import>

	<section id="cover">
		<div id="cover-caption">
			<div class="container">
				<div class="col-sm-12 col-sm-offset-1">
					<h1 class="display-3">Welcome</h1>
					<p>
						Sign in so you can discover more. If you don't have an account, <a
							href="#">create one</a> for free.
					</p>

					<form class="form-inline" action="<c:url value="/login"/>"
						method="post">
						<div class="form-group">
							<label class="sr-only">Username</label> <input type="text"
								name="username" class="form-control form-control-md"
								placeholder="Username">
						</div>

						<div class="form-group">
							<label class="sr-only">Password</label> <input type="password"
								name="password" class="form-control form-control-md"
								placeholder="Password">
						</div>

						<button type="submit" class="btn btn-success btn-md">Sign
							in</button>

						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}">
					</form>
				</div>
			</div>
		</div>
	</section>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

	<!-- Bootstrap Javascript -->
	<script src="dist/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>