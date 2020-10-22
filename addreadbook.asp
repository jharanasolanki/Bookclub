<%
	if session("uname")="" then
		response.redirect("login.asp")
	end if
%>
<%
	server.execute("databasecon.asp")
	Application("readbook").MoveFirst	
	Application("readbook")(request.querystring("name"))=Application("readbook")(request.querystring("name"))+1
	Application("readbook").addnew
	Application("readbook")(request.querystring("name"))=request.form("readbook")
	Application("readbook").update
	response.redirect(Request.ServerVariables("HTTP_REFERER"))
%>