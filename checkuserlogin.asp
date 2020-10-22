<%
	Application("userdata").MoveFirst()
	do until Application("userdata").eof
		if Application("userdata")("Username")=request.form("uname") and Application("userdata")("Password")=request.form("pass") then
			Session("uname")=Application("userdata")("Username")
			response.write(Request.QueryString("gobackto"))
		end if
		Application("userdata").movenext
	loop
	Session("error")=1
	server.execute("login.asp")
%>