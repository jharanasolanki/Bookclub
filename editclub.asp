<%
	if session("uname")="" then
		server.execute("databasecon.asp")
		response.redirect("login.asp")
	end if
	cname=request.querystring("cname")
	Application("clubdata").MoveFirst()
	do until Application("clubdata").eof
		if Application("clubdata")("clubname")=cname then
			exit do
		else
			Application("clubdata").movenext
		end if
	loop
	owner=(Application("clubdata")("owner"))
	if Application("clubdata")("owner")<>session("uname") then
		response.redirect("viewclub.asp?cname="&cname&"")		
	end if
%>
<html>
	<link rel="stylesheet" type="text/css" href="css/editclubc.css">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins"> 
	<!--#include file="navbar.asp"-->
	<script type="text/javascript" language="javascript">
		function trial(name)
		{
			 document.getElementById("editaboutclub").style.display = "none";
			 document.getElementById("editfavbook").style.display = "none";
			 document.getElementById("editreadbook").style.display = "none";
			 document.getElementById("edittoreadbook").style.display = "none";
			 document.getElementById("showmembers").style.display = "none";
			 document.getElementById("createmeeting").style.display = "none";
			 document.getElementById(name).style.display = "block";				 
		}
	</script>
	<body>
		<div class="profile">
			<div class="stats">
				<div class="club">
					<img src="profilepicture\<%response.write(cname&".jpg")%>"" class="profpic">
					<form method="post" enctype="multipart/form-data" action="saveprofilepicture.asp?name=<%response.write(cname)%>">
						<input type="file"  <%response.write("name='"&session("uname")&"'")%>><br>
						<input type="submit" value="Upload">
					</form>	
					<div class="username"><%response.write(cname)%></div>
				</div>
				<div class="statdata">
					<table cellpadding="2" cellspacing="5">
						<tr>
							<th>Members:</th>
							<td><%
								server.execute("databasecon.asp")
								if Application("joinedclubs").bof <> true and Application("joinedclubs").eof <> true then
									Application("joinedclubs").MoveFirst
									response.write(Application("joinedclubs")(cname))
								else
									response.write("0")
								end if
								%></td>
							<th>Books Read:</th>
							<td><%
								if Application("readbook").bof <> true and Application("readbook").eof <> true then
									Application("readbook").MoveFirst
									response.write(Application("readbook")(cname))
								else
									response.write("0")
								end if
								%></td>
						</tr>
						<tr>
							<th>Owner:</th>
							<td><a class="owner" href="viewprofile.asp?uname=<%response.write(Application("clubdata")("owner"))%>"><%response.write(owner)%></a></td>
							<th>Books To Read:</th>
							<td><%
								if Application("toreadbook").bof <> true and Application("toreadbook").eof <> true then
									Application("toreadbook").MoveFirst
									response.write(Application("toreadbook")(cname))
								else
									response.write("0")
								end if
								%></td>
						</tr>
					</table>
					<a href="viewclub.asp?cname=<%response.write(cname)%>" class="seeprof">See Profile</a>
				</div>
				<div class="invitelink">
					<label class="invitetext">Invite Link:</label><br>
					<label><a href="localhost:81/showclub.asp?cname=<%response.write(cname)%>" class="invitetext">localhost:81/showclub.asp?cname=<%response.write(cname)%></a></label>
				</div>
			</div>
			<div class="opts">
				<div class="optsname">
					<ul class="optlist">
						<li class="optitem" onclick="trial('editaboutclub')"><img src="images/abouticon.png" class="imgicon">About club</li>
						<li class="optitem" onclick="trial('editfavbook')"><img src="images/favoritebookicon.png" class="imgicon">Favorite Books</li>
						<li class="optitem" onclick="trial('editreadbook')"><img src="images/readbookicon.png" class="imgicon">Books we Read</li>
						<li class="optitem" onclick="trial('edittoreadbook')"><img src="images/toreadicon.png" class="imgicon">Books to Read</li>
						<li class="optitem" onclick="trial('showmembers')"><img src="images/clubicon.png" class="imgicon">Members</li>
						<li class="optitem" onclick="trial('createmeeting')"><img src="images/clubicon.png" class="imgicon">Meeting</li>
					</ul>
				</div>
				<div class="optsview" id="viewdata">
					<label id="meeterr"><%response.write(request.querystring("meeterr"))%></label>
					<div id="editaboutclub">
						<form method="post" action="aboutclub.asp?name=<%response.write(cname)%>">
							<label>About Club:</label><br>
							<textarea name="aboutclub" rows="5" cols="20"><%
									server.execute("databasecon.asp")
									Application("clubdata").Movefirst()
									do until Application("clubdata").eof
									if Application("clubdata")("clubname")=cname then
										exit do
									else
										Application("clubdata").movenext
									end if
									loop
									response.write(Application("clubdata")("aboutclub"))
								%></textarea><br>
							<input type="submit" value="Save Changes">
						</form>
					</div>
					<div id="editfavbook">
						<form method="post" action="adddata.asp?name=<%response.write(cname)%>&req=favoritebook"">
							<label>Book Name:</label><br>
							<input type="text" name="favbook"><br>
							<input type="submit" value="Add new Favorite book">
						</form>
					</div>
					<div id="editreadbook">
						<form method="post" action="adddata.asp?name=<%response.write(cname)%>&req=readbook"">
							<label>Book Name:</label><br>
							<input type="text" name="favbook"><br>
							<input type="submit" value="Add new Read book">
						</form>
					</div>
					<div id="edittoreadbook">
						<form method="post" action="adddata.asp?name=<%response.write(cname)%>&req=toreadbook"">
							<label>Book Name:</label><br>
							<input type="text" name="favbook"><br>
							<input type="submit" value="Add new To Read book">
						</form>
					</div>
					<div id="showmembers">Members
						<p><%
									Application("joinedclubs").Movefirst()
									Application("joinedclubs").MoveNext()
									response.write("<table>")
									do until Application("joinedclubs").eof
										if Application("joinedclubs")(cname)<>"" then
										response.write("<tr>")
										response.write("<td>"&Application("joinedclubs")(cname)&"</td>"&"<td><a class='visitbutton' href='viewprofile.asp?uname="&Application("joinedclubs")(cname)&"'>Visit!</a></td>")
											response.write("</tr>")
									end if
										Application("joinedclubs").MoveNext()
									loop
									response.write("</table>")
								%></p>
					</div>	
					<div id="createmeeting">
						<form method="post" action="createmeet.asp?cname=<%response.write(cname)%>">
							<label>Meeting Name:</label><br>
							<input type="text" name="meetname">
							<label>Meeting Date:</label><br>
							<input type="date" name="meetdate">
							<label>Meeting Time:</label><br>
							<input type="time" name="meettime">
							<label>Meeting Link:</label><br>
							<input type="text" name="meetlink">
							<input type="submit" value="Create meeting">
						</form>
					</div>
				</div>
			</div>
	</body>
	<!--#include file="footer.asp"-->
</html>