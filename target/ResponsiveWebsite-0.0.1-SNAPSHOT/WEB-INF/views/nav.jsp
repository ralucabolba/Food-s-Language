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
				data-toggle="collapse" data-target="#menu"
				aria-controls="menu" aria-expanded="false"
				aria-label="Toggle navigation">&#9776;</button>
			<div class="collapse navbar-toggleable-xs" id="menu">
				<a id="logo" class="navbar-brand" href="login">Food's Language</a>
				<ul id="menu-list" class="nav navbar-nav" style="padding-top: 8px">
					<li class="nav-item active"><a class="nav-link" href="http://localhost:8585/ResponsiveWebsite/login">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Recipes</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="http://localhost:8585/ResponsiveWebsite/signup">Register</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>