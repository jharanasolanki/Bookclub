<%
	if session("uname")="" then
		response.redirect("login.asp")
	end if
%>
<%
	name=request.querystring("name")
	aname=request.querystring("aname")
	req=request.querystring("req")
	server.execute("databasecon.asp")
	Application(req).MoveFirst
	ct=CInt(Application(req)(name))
	Application(req).Movenext	
	i=0
	do while not application(req).eof
		response.write("hi "&i&" "&ct&"<br>")
		application(req).movenext
		if i>=ct-1 then
			response.write("hbf")
			exit do
		end if
		i=i+1
	loop
	if Application(req).eof then
		Application(req).addnew
	end if
	
	if request.form("favbook")="" and aname<>"" then
		Application(req).MoveFirst
		ct=CInt(Application(req)(name))
		Application(req).Movenext	
		i=0
		do while not application(req).eof
			response.write("hi "&i&" "&ct&"<br>")
			if i>=ct-1 then
				response.write("hbf")
				exit do
			end if
			i=i+1
			Application(req).Movenext	
		loop
		if Application(req).eof then
			Application(req).addnew
		end if
		Application(req)(name)=aname
	elseif request.form("favbook")="" then
		Application(req)(name)=session("uname")
	else
		Application(req)(name)=request.form("favbook")
	end if
	Application(req).MoveFirst
	Application(req)(name)=Application(req)(name)+1
	Application(req).update

	if req="joinedclubs" and aname="" then
		response.redirect("addfavbook.asp?req=joinedclubs&name="&session("uname")&"&aname="&name)
	end if
	response.redirect(Request.ServerVariables("HTTP_REFERER"))
%>