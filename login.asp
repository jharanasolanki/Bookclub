<%
	if session("uname")="" then
		server.execute("databasecon.asp")
	else
		response.redirect("profile.asp?uname="&session("uname"))
	end if
%>
<html>

	<link rel="stylesheet" type="text/css" href="css/login.css"> 
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins">
	<!--#include file="navbar.asp"-->
	<body>
		<div class="loginform">
			<form method="post" action="checkuserlogin.asp?gobackto=<%response.write(Request.ServerVariables("HTTP_REFERER"))%>">
				
				<%
					if session("error")=1 then
						response.write("<label>Incorrect Username or Password!</label>")
					end if
				%>
				<label>Enter Username:</label><br>
				<input type="text" name="uname">
				<label>Enter Password:</label><br>
				<input type="password" name="pass"><br>
				<input type="submit" value="Submit">
			</form>
			<label>Don't have an account? <a href="signup.asp" class="signuplink">Sign Up</a></label>
		</div>
	</body>
	<!--#include file="footer.asp"-->
</html>
