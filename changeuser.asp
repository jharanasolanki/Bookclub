<%
	Application("userdata").MoveFirst()
	do until Application("userdata").eof
		if Application("userdata")("Username")=Session("uname") then
			exit do
		else
			Application("userdata").movenext
		end if
	loop
	Application("userdata")("Fname")=Request.form("name")
	Application("userdata")("Phoneno")=Request.form("phoneno")
	Application("userdata")("Emailid")=Request.form("emailaddr")
	Application("userdata").update
	response.redirect("profile.asp")
%>