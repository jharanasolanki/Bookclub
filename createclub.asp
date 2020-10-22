<%
	if session("uname")="" then
		server.execute("databasecon.asp")
		response.redirect("login.asp")
	end if
%>
<html>
	<link rel="stylesheet" type="text/css" href="css/createaclub.css">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins"> 
	<!--#include file="navbar.asp"-->
	<script type="text/javascript" language="javascript">
		function validate()
		{
			if(document.getElementById("uname").value=="" || document.getElementById("aboutclub").value=="" )
			{
				if(document.getElementById("uname").value=="")
				{	
					document.getElementById("uname").placeholder="Club name cannot be empty";
				}
				if(document.getElementById("aboutclub").value=="")
				{
					document.getElementById("aboutclub").placeholder="About club cannot be empty";
				}
			}
			<%
				server.execute("databasecon.asp")
				application("userdata").movefirst()
				do while not Application("userdata").eof
					response.write("else if(document.getElementById('uname').value.localeCompare('"&application("userdata")("username")&"')==0){alert('Name already taken!');}")
					application("userdata").movenext
				loop
				
				application("clubdata").movefirst()
				do while not Application("clubdata").eof
					response.write("else if(document.getElementById('uname').value.localeCompare('"&application("clubdata")("clubname")&"')==0){alert('Name already taken!');}")
					application("clubdata").movenext
				loop
				%>
				else 
					return true;
			return false;
		}
	</script>
	<body bgcolor="#ffffe6">
		<div class="clubform">
			<form method="post" onsubmit="return validate()" action="createclubdata.asp" class="aboutclubform">
				<label>Club Name:</label><br>
				<input type="text" name="uname" id="uname"><br>
				<label>About Club:</label><br>
				<textarea name="aboutclub" rows="5" cols="20" id="aboutclub"></textarea><br>
				<input type="submit" value="Create Club!">
			</form>
		</div>
	</body>
	
	<!--#include file="footer.asp"-->
</html>