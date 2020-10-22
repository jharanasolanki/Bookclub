<%
	if session("uname")="" then
		response.redirect("login.asp")
	end if
%>
<%
	cname=request.querystring("cname")
	if cname="" then
		response.redirect(Request.ServerVariables("HTTP_REFERER"))
	end if
	name=session("uname")
	server.execute("databasecon.asp")

	Application("clubdata").movefirst()
	do until Application("clubdata").eof
		if application("clubdata")("clubname")=cname then
			exit do
		end if
		application("clubdata").movenext
	loop	
	if application("clubdata")("owner")=name then
		response.redirect("editclub.asp?cname="&cname)
	end if

	Application("joinedclubs").MoveFirst
	ct=CInt(Application("joinedclubs")(name))
	Application("joinedclubs").Movenext
	i=1
	do while not application("joinedclubs").eof
		if application("joinedclubs")(name)=cname then
			exit do
		end if
		application("joinedclubs").movenext
		if i>=ct then
			exit do
		end if
		i=i+1
	loop
	if Application("joinedclubs").eof then
		Application("joinedclubs").addnew
		Application("joinedclubs")(cname)=name
		Application("joinedclubs").MoveFirst
		Application("joinedclubs")(name)=Application("joinedclubs")(name)+1
		Application("joinedclubs").update
	elseif i>=ct then
		Application("joinedclubs")(name)=cname
		Application("joinedclubs").MoveFirst
		Application("joinedclubs")(name)=Application("joinedclubs")(name)+1
		Application("joinedclubs").update
	end if

	Application("joinedclubs").MoveFirst
	ct=CInt(Application("joinedclubs")(cname))
	Application("joinedclubs").Movenext
	i=1
	do while not application("joinedclubs").eof
		if application("joinedclubs")(cname)=name then
			response.redirect("viewclub.asp?cname="&cname)
		end if
		application("joinedclubs").movenext
		if i>=ct then
			exit do
		end if
		i=i+1
	loop
	if Application("joinedclubs").eof then
		Application("joinedclubs").addnew
		Application("joinedclubs")(cname)=name
		Application("joinedclubs").MoveFirst
		Application("joinedclubs")(name)=Application("joinedclubs")(name)+1
		Application("joinedclubs").update
	else
		Application("joinedclubs")(cname)=name
		Application("joinedclubs").MoveFirst
		Application("joinedclubs")(name)=Application("joinedclubs")(name)+1
		Application("joinedclubs").update
	end if
	response.redirect("viewclub.asp?cname="&cname)
%>