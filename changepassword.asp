<%
	if session("uname")="" then
		response.redirect("login.asp")
		server.execute("databasecon.asp")
	end if
%>
<%
if request.form("oldpass")<>"" and request.form("pass1")<>"" and request.form("pass2")<>"" then
	Application("userdata").MoveFirst()
	do until Application("userdata").eof
		if Application("userdata")("Username")=session("uname") and Application("userdata")("Password")=request.form("oldpass") then
			response.write("hey")
			exit do
		else
			Application("userdata").movenext
		end if
	loop
	if Application("userdata").eof then
		response.write("<script language=""javascript"">alert('Old Password Incorrect');</script>")
	else
		oldpass=Application("userdata")("Password")
		Application("userdata")("password")=request.form("pass1")
		Application("userdata").update
		response.write("<script language=""javascript"">alert('Password changed!');")
		response.write("</script>")
		response.redirect("homepage.asp")
	end if
	
end if
%>
<html>
	<link rel="stylesheet" type="text/css" href="css/changepassword.css"> 
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins">
	<!--#include file="navbar.asp"-->
	<body>
		<div class="changepassform">
		<form method="post" action="changepassword.asp" onsubmit="return validate()">
			<label>Old Password:</label><br>
			<input type="password" name="oldpass" id="oldpass"><br>
			<label>Enter new Password:</label><br>
			<input type="password" name="pass1" id="pass1"><br>
			<label>Enter new Password again:</label><br>
			<input type="password" name="pass2" id="pass2"><br>
			<input type="submit" value="Change Password!">
		</form>
	</div>
	</body>
	<script type="text/javascript" language="javascript">
		function validate()
		{
			if(document.getElementById("oldpass").value=="" || document.getElementById("pass1").value=="" || document.getElementById("pass2").value=="") 
			{
				if(document.getElementById("oldpass").value=="")
				{	
					document.getElementById("oldpass").placeholder="Old Password cannot be empty";
				}
				if(document.getElementById("pass1").value=="")
				{	
					document.getElementById("pass1").placeholder="New Password cannot be empty";
				}
				if(document.getElementById("pass2").value=="")
				{	
					document.getElementById("pass2").placeholder="New Password cannot be empty";
				}
			}
			else if(document.getElementById("pass1").value!=document.getElementById("pass2").value)
			{// if both passwords are not same
				alert("Passwords don't match");
			}
			else
			{
				return true;
			}
			return false;
		}
	</script>
	<!--#include file="footer.asp"-->
</html>