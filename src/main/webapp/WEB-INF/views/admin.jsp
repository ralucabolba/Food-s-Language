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

<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Cookie|Raleway|Open+Sans"
	rel="stylesheet">

</head>
<body onload="fetchUsers()">

	<c:import url="nav-client.jsp"/>
	
	<section id="admin-cover">
		<div class="container" id="admin-container">
			
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