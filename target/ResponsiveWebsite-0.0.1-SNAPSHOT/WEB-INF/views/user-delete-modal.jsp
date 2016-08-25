<!DOCTYPE html>
<html>
<head>
<title>Delete modal</title>
</head>
<body>
	<!-- Delete confirmation dialog-->
	<div id="delete-user-modal" class="modal fade">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Delete product?</h4>
				</div>
				<div class="modal-body">
					<p>The user will be permanently deleted and cannot be
						recovered. Are you sure?</p>
				</div>
				<div class="modal-footer">
					<button id="dialog-close" type="button" class="btn btn-outline-primary"
						data-dismiss="modal">Close</button>
					<input type="hidden" id="rowNo">
					<button id="delete-user-button" type="button" class="btn btn-outline-danger">Delete</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>