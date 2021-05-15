<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-Up here</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body
	style="background: url(D:/Eclipse-Workspace-JavaEE/advJava_registration/src/main/webapp/img/bgimg.jpg); background-size: cover; background-attachment: fixed;">
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card transparent">
					<div class="card-content">
						<h3 class="teal-text text-accent-3 center-align">Register
							Here</h3>
						<h5 id="msg" class="center-align"></h5>
						<div class="form center-align">
							<form action="register" method="post" id="regform" enctype="multipart/form-data">
								<input type="text" name="user_name"
									class="teal-text text-accent-3" placeholder="Enter name here" />
								<input type="password" class="teal-text text-accent-3"
									name="user_pass" placeholder="Enter password here" /> <input
									type="email" class="teal-text text-accent-3" name="user_mail"
									placeholder="Enter email here" />
								<div class="file-field input-field">
									<div class="btn">
										<span>File</span> <input name="user_file" type="file">
									</div>
									<div class="file-path-wrapper">
										<input class="file-path validate teal-text text-accent-3" type="text">
									</div>
								</div>
								<button type="submit" style="margin-top: 10px"
									class="btn pulse amber darken-2">Register</button>
							</form>
						</div>
						<div class="loader center-align"
							style="margin-top: 10px; display: none">
							<div class="progress">
								<div class="indeterminate"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#regform').on("submit", function(event) {
			event.preventDefault();
			//var f = $(this).serialize();
			let f = new FormData(this);
			$(".loader").show();
			$(".form").hide();
			$.ajax({
				url : "register",
				data : f,
				type : "POST",
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					$(".loader").hide();
					$(".form").show();
					if (data.trim() === "done") {
						$("#msg").html("Registration Successful");
						$("#msg").addClass("green-text");
					} else {
						$("#msg").html("Registration Failed");
						$("#msg").addClass("red-text");
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log(data);
					$(".loader").hide();
					$(".form").show();
					$("#msg").html("Registration Failed");
					$("#msg").addClass("red-text");
				},
				processData: false,
				contentType: false
			})
		})
	})
</script>
</html>