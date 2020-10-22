<%
	set Application("database")=server.createobject("ADODB.Connection")
	Application("database").Provider="Microsoft.Jet.OLEDB.4.0"
	Application("database").open "F:\bookclub\database\bookclubdatabase.mdb"

	set Application("userdata")=server.createobject("ADODB.Recordset")
	Application("userdata").open "userdata",application("database"),2,3,2

	set Application("clubdata")=server.createobject("ADODB.Recordset")
	Application("clubdata").open "clubdata",application("database"),2,3,2

	set Application("favoritebook")=server.createobject("ADODB.Recordset")
	Application("favoritebook").open "favoritebook",application("database"),2,3,2


	set Application("joinedclubs")=server.createobject("ADODB.Recordset")
	Application("joinedclubs").open "joinedclubs",application("database"),2,3,2


	set Application("myclubs")=server.createobject("ADODB.Recordset")
	Application("myclubs").open "myclubs",application("database"),2,3,2


	set Application("readbook")=server.createobject("ADODB.Recordset")
	Application("readbook").open "readbook",application("database"),2,3,2


	set Application("toreadbook")=server.createobject("ADODB.Recordset")
	Application("toreadbook").open "toreadbook",application("database"),2,3,2

	set Application("meetdata")=server.createobject("ADODB.Recordset")
	Application("meetdata").open "meetingdata",application("database"),2,3,2

	set Application("sql")=Server.CreateObject("ADODB.command")

%>