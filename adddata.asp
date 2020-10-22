<%
	if session("uname")="" then
		response.redirect("login.asp")
	end if
%>
<%
	name=request.querystring("name")
	req=request.querystring("req")
	data=request.form("favbook")
	server.execute("databasecon.asp")
	Application(req).MoveFirst
	ct=CInt(Application(req)(name))
	Application(req).Movenext	
	i=1
	do while not application(req).eof
		if application(req)(name)=data then
			response.redirect(Request.ServerVariables("HTTP_REFERER"))
		end if
		application(req).movenext
		if i>=ct then
			exit do
		end if
		i=i+1
	loop
	if Application(req).eof then
		Application(req).addnew
		Application(req)(name)=data
		Application(req).MoveFirst
		Application(req)(name)=Application(req)(name)+1
		Application(req).update
	else 
		Application(req)(name)=data
		Application(req).MoveFirst
		Application(req)(name)=Application(req)(name)+1
		Application(req).update
	end if
	response.redirect(Request.ServerVariables("HTTP_REFERER"))
%>