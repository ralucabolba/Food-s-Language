<!DOCTYPE html5>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
</head>
<body>
	<!-- Info modal -->
	<div class="modal fade" id="info-modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">User Information</h4>
				</div>
				<div class="modal-body">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th>Name</th>
								<td class="name-cell"></td>
							</tr>

							<tr>
								<th>Birth date</th>
								<td class="birth-date-cell"></td>
							</tr>

							<tr>
								<th>Email</th>
								<td class="email-cell"></td>
							</tr>

							<tr>
								<th>Username</th>
								<td class="username-cell"></td>
							</tr>

							<tr>
								<th>Role</th>
								<td class="role-cell"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>