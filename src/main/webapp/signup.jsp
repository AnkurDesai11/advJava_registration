<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign-Up here</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="col m6 offset-m3">
			<div class="card">
				<div class="content">
					<h3>Sign-Up Here</h3>
					<div class="form">
						<form action="register" method="post">
							<input type="text" name="user_name" placeholder="Enter name here"/>
							<input type="password" name="user_pass" placeholder="Enter password here"/>
							<input type="email" name="user_mail" placeholder="Enter email here"/>
							
						</form>	
					</div>
					<div class="loader">
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>