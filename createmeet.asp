<%
	server.execute("databasecon.asp")
	d=(datediff("d",date(),Request.form("meetdate")))
	t=(datediff("n",time(),Request.form("meettime")))
	if d<0 then
		response.redirect(Request.ServerVariables("HTTP_REFERER")&"&meeterr=Cannot set meeting for older date or time")
	end if
	if d=0 and t<=0 then
		response.redirect(Request.ServerVariables("HTTP_REFERER")&"&meeterr=Cannot set meeting for older date or time")
	end if
	Application("meetdata").addnew
	Application("meetdata")("meetname")=request.form("meetname")
	Application("meetdata")("meetdate")=Request.form("meetdate")
	Application("meetdata")("meettime")=Request.form("meettime")
	Application("meetdata")("meetlink")=Request.form("meetlink")
	Application("meetdata").update
	response.redirect(Request.ServerVariables("HTTP_REFERER"))
%>