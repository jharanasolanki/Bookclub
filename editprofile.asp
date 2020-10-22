<%
	if session("uname")="" then
		server.execute("databasecon.asp")
		response.redirect("login.asp")
	end if
%>
<html>

	<link rel="stylesheet" type="text/css" href="css/profileedit.css"> 
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins">
	<!--#include file="navbar.asp"-->
	<body>
		<div class="editprofileform">
			<form method="post" action="changeuser.asp">
				<label>Enter Name</label>
				<input type="text" name="name">
				<label>Enter Phone Number:</label>
				<input type="number" name="phoneno">
				<label>Enter Email address:</label>
				<input type="email" name="emailaddr">
				<input type="submit" value="Submit">
			</form>
		</div>
	</body>
	<!--#include file="footer.asp"-->
</html>
