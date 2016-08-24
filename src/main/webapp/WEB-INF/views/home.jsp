<!DOCTYPE html>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<title>Food's Language</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value="/dist/css/bootstrap.min.css"/>">

<!-- Custom css -->
<link rel="stylesheet" href="<c:url value="/css/custom.css"/>">

<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Cookie|Raleway|Open+Sans"
	rel="stylesheet">

</head>
<body onload="writeName()">
	<c:import url="nav-client.jsp"></c:import>

	<section id="carousel">
		<div id="carousel-home" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-home" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-home" data-slide-to="1"></li>
				<li data-target="#carousel-home" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="carousel-item active">
					<img src="<c:url value="/css/img/pink-flower.jpg"/>" alt="Pink flowers">
					<div class="carousel-caption">
						<h3>Spring</h3>
						<p>"You will find that it is necessary to let things go; simply for the reason that they are heavy. So let them go, let go of them. I tie no weights to my ankles." - C. JoyBell C.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value="/css/img/fruit.jpg"/>" alt="Fresh yummy fruits">
					<div class="carousel-caption">
						<h3>Yummyy</h3>
						<p>"One day, in retrospect, the years of struggle will strike you as the most beautiful." - Sigmund Freud</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="<c:url value="/css/img/coffee.jpg"/>" alt="Cup of coffee">
					<div class="carousel-caption">
						<h3>Good morning, coffee</h3>
						<p>"The unhappiest people in this world, are those who care the most about what other people think." - C. JoyBell C.</p>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#carousel-home" role="button" data-slide="prev">
				<span class="icon-prev" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#carousel-home" role="button" data-slide="next">
				<span class="icon-next" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</section>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

	<!-- Bootstrap Javascript -->
	<script src="<c:url value="/dist/js/bootstrap.min.js"/>" type="text/javascript"></script>

	<script src="<c:url value="/javascript/main.js"/>"
		type="text/javascript"></script>
</body>
</html>