<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<title>Navigation bar</title>
</head>
<body>
	<nav id="nav-main" class="navbar navbar-dark bg-inverse navbar-full">
		<div class="container">
			<button class="navbar-toggler hidden-sm-up" type="button"
				data-toggle="collapse" data-target="#menu" aria-controls="menu"
				aria-expanded="false" aria-label="Toggle navigation">&#9776;</button>
			<div class="collapse navbar-toggleable-xs" id="menu"
				style="width: 70%">
				<a id="logo" class="navbar-brand" href="home">Food's Language</a>
				<ul id="menu-list" class="nav navbar-nav" style="padding-top: 8px">
					<li class="nav-item active"><a class="nav-link"
						href="http://localhost:8585/ResponsiveWebsite/client/home">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Recipes</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>

					<li class="nav-item"><p style="color: white; padding-top: 8px">
							Hello,&nbsp;&nbsp;<a href="http://localhost:8585/ResponsiveWebsite/client" id="user-name"
								style="color: palevioletred"> </a>
						</p></li>

					<li class="nav-item"><a id="logout" class="nav-link"
						href="javascript:void(0)">Log out</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<!-- Form for performing logout -->
	<form action="<c:url value="/logout"/>" method="post" id="logout-form">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

	<!-- Bootstrap Javascript -->
	<script
		src="https://www.atlasestateagents.co.uk/javascript/tether.min.js"></script>
	
</body>
</html>