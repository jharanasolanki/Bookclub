<%
	server.execute("databasecon.asp")
	dim fs
	Set fs=Server.CreateObject("Scripting.FileSystemObject")
	fs.CopyFile"F:\bookclub\images\defprofile.jpg","F:\bookclub\profilepicture\"&request.form("uname")&".jpg",true
	set fs=nothing
	Application("clubdata").addnew
	Application("clubdata")("clubname")=request.form("uname")
	Application("clubdata")("aboutclub")=Request.form("aboutclub")
	Application("clubdata")("owner")=session("uname")
	Application("clubdata").update
	cname=request.form("uname")

	Application("database").close
	Application("database").open "F:\bookclub\database\bookclubdatabase.mdb"
	qr="ALTER TABLE favoritebook ADD COLUMN "&request.form("uname")&" TEXT(10)"
	Application("database").execute(qr)

	Application("database").close
	Application("database").open "F:\bookclub\database\bookclubdatabase.mdb"
	qr="ALTER TABLE readbook ADD COLUMN "&request.form("uname")&" TEXT(10)"
	Application("database").execute(qr)

	Application("database").close
	Application("database").open "F:\bookclub\database\bookclubdatabase.mdb"
	qr="ALTER TABLE toreadbook ADD COLUMN "&request.form("uname")&" TEXT(10)"
	Application("database").execute(qr)
	
	Application("database").close
	Application("database").open "F:\bookclub\database\bookclubdatabase.mdb"
	qr="ALTER TABLE joinedclubs ADD COLUMN "&request.form("uname")&" TEXT(10)"
	Application("database").execute(qr)

	Application("database").close
	server.execute("databasecon.asp")
	dim name
	name=request.form("uname")

	if application("favoritebook").bof then
		application("favoritebook").addnew
	end if
	Application("favoritebook").MoveFirst
	Application("favoritebook")(name)=0
	Application("favoritebook").update

	if application("joinedclubs").bof then
		application("joinedclubs").addnew
	end if
	Application("joinedclubs").MoveFirst
	Application("joinedclubs")(name)=0
	Application("joinedclubs").update

	if application("readbook").bof then
		application("readbook").addnew
	end if
	Application("readbook").MoveFirst
	Application("readbook")(name)=0
	Application("readbook").update

	if application("toreadbook").bof then
		application("toreadbook").addnew
	end if
	Application("toreadbook").MoveFirst
	Application("toreadbook")(name)=0
	Application("toreadbook").update

	Application("myclubs").MoveFirst
	ct=CInt(Application("myclubs")(session("uname")))
	Application("myclubs").Movenext
	i=1
	do while not application("myclubs").eof
		application("myclubs").movenext
		if i>=ct then
			exit do
		end if
		i=i+1
	loop
	if Application("myclubs").eof then
		Application("myclubs").addnew
		Application("myclubs")(session("uname"))=cname
		Application("myclubs").MoveFirst
		Application("myclubs")(session("uname"))=Application("myclubs")(session("uname"))+1
		Application("myclubs").update
	elseif i>=ct then
		Application("myclubs")(session("uname"))=cname
		Application("myclubs").MoveFirst
		Application("myclubs")(session("uname"))=Application("myclubs")(session("uname"))+1
		Application("myclubs").update
	end if

	response.redirect("editclub.asp?cname="&request.form("uname")&"")
	
%>
%>