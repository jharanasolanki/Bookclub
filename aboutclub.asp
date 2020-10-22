<%
	Application("clubdata").Movefirst()
	do until Application("clubdata").eof
		if Application("clubdata")("clubname")=request.querystring("name") then
			exit do
		else
		Application("clubdata").movenext
		end if
	loop
	Application("clubdata")("aboutclub")=request.form("aboutclub")
	Application("clubdata").update
	response.redirect(Request.ServerVariables("HTTP_REFERER"))
%>