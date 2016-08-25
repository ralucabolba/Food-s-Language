<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Admin</title>

<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="dist/css/bootstrap.min.css">

<!-- Custom css -->
<link rel="stylesheet" href="css/custom.css">

<!-- icons -->
<link rel="stylesheet"
	href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Cookie|Raleway|Open+Sans"
	rel="stylesheet">

</head>
<body onload="getPages()">

	<c:import url="nav-admin.jsp" />

	<section id="admin-cover">
		<div class="container" id="admin-container">
			<div class="row">
				<div class="col-lg-11">
					<h2>Registered users</h2>
				</div>
				<div class="col-lg-1">
					<a href="#" id="add-user"><i class="ion-ios-plus"></i></a>
				</div>
			</div>

			<br> <br>
			<div class="col-sm-12" id="users-container"></div>
		</div>
	</section>

	<c:import url="user-info-modal.jsp"></c:import>

	<c:import url="user-delete-modal.jsp"></c:import>
	
	<c:import url="user-add-modal.jsp"></c:import>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

	<!-- Bootstrap Javascript -->
	<script
		src="https://www.atlasestateagents.co.uk/javascript/tether.min.js"></script>

	<!-- Bootstrap Javascript -->
	<script src="<c:url value="/dist/js/bootstrap.min.js"/>"
		type="text/javascript"></script>

	<script src="<c:url value="/javascript/main.js"/>"
		type="text/javascript"></script>
</body>
</html>