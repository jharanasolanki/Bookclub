<%
	if session("uname")="" then
		response.redirect("login.asp")
	end if
%>
<%
	server.execute("databasecon.asp")
	Application("toreadbook").MoveFirst
	Application("toreadbook")(request.querystring("name"))=Application("toreadbook")(request.querystring("name"))+1
	Application("toreadbook").addnew
	Application("toreadbook")(request.querystring("name"))=request.form("toreadbook")
	Application("toreadbook").update
	response.redirect(Request.ServerVariables("HTTP_REFERER"))
%>