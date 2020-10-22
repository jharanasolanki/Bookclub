<%
	if session("uname")="" then
		server.execute("databasecon.asp")
		response.redirect("login.asp")
	end if
%>
<html>
	<link rel="stylesheet" type="text/css" href="css/joinclub.css">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins"> 
	<!--#include file="navbar.asp"-->
	<body bgcolor="#ffffe6" onload="document.getElementById('srcval').focus();">
		<div class="findform">
			<div class="searchbox">
				<form method="post" action="joinclub.asp" id="fform" >
					<input type="text" name="srcval" id="srcval" class="srcval" oninput="document.getElementById('fform').submit();" value="<%response.write(request.form("srcval"))%>" >
					<input type="submit" value="Search" class="srcbtn">
				</form>
			</div>
			<div class="optsview">
			<%
				
				if request.form("srcval")<>"" then
					da=request.form("srcval")
					qr="clubname LIKE '"&da&"*'"
					Application("clubdata").Filter=qr	
				end if
				if not Application("clubdata").eof then 
					Application("clubdata").movefirst
				do while not Application("clubdata").eof
					response.write("<div class='parts'>")
					server.execute("clubbox.asp")
					response.write("</div>")
					Application("clubdata").movenext
				loop
				end if
				server.execute("databasecon.asp")
			%>
			</div>
		</div>
	</body>
	<!--#include file="footer.asp"-->
</html>