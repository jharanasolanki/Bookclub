<%	
	server.execute("databasecon.asp")
	dim fs
	Set fs=Server.CreateObject("Scripting.FileSystemObject")
	fs.CopyFile"F:\bookclub\images\defprofile.jpg","F:\bookclub\profilepicture\"&request.form("uname")&".jpg",true
	set fs=nothing
	Application("userdata").addnew
	Application("userdata")("Username")=request.form("uname")
	Application("userdata")("Password")=Request.form("pass1")
	Application("userdata")("Fname")=Request.form("name")
	Application("userdata")("Phoneno")=Request.form("phoneno")
	Application("userdata")("Emailid")=Request.form("emailaddr")
	Application("userdata").update
	
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
	qr="ALTER TABLE myclubs ADD COLUMN "&request.form("uname")&" TEXT(10)"
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

	if application("myclubs").bof then
		application("myclubs").addnew
	end if
	Application("myclubs").MoveFirst
	Application("myclubs")(name)=0
	Application("myclubs").update

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

	response.redirect("login.asp")
	
%>