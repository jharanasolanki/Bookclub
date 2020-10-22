<%
	Application("userdata").Movefirst()
	do until Application("userdata").eof
		if Application("userdata")("username")=request.querystring("name") then
			exit do
		else
		Application("userdata").movenext
		end if
	loop
	Application("userdata")("aboutme")=request.form("aboutme")
	Application("userdata").update
	response.redirect(Request.ServerVariables("HTTP_REFERER"))
%>