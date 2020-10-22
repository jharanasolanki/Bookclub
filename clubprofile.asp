<%
	if session("uname")="" then
		response.redirect("login.asp")
	end if
%>
<%
	Application("userdata").MoveFirst()
	do until Application("userdata").eof
		if Application("userdata")("username")=session("uname") then
			exit do
		else
		Application("userdata").movenext
		end if
	loop
	cname=request.querystring("uname")
%>
<html>
	<link rel="stylesheet" type="text/css" href="css/profile.css">
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins"> 
	<!--#include file="navbar.asp"-->
	<script type="text/javascript" language="javascript">
		function trial(name)
		{
			 document.getElementById("aboutme").style.display = "none";
			 document.getElementById("favbook").style.display = "none";
			 document.getElementById("readbooks").style.display = "none";
			 document.getElementById("toreadbooks").style.display = "none";
			 document.getElementById("myclubs").style.display = "none";
			 document.getElementById(name).style.display = "block";
		}
	</script>
	<body>
		<div class="profile">
			<div class="stats">
				<div class="user">
					<img src="profilepicture\<%response.write(session("uname")&".jpg")%>"" class="profpic">
					<form method="post" enctype="multipart/form-data" action="saveprofilepicture.asp">
						<input type="file"  <%response.write("name='"&session("uname")&"'")%>><br>
						<input type="submit" value="Upload">
					</form>	
					<div class="username">
						<%
							response.write(session("uname"))
						%></div>
				</div>
				<div class="statdata">
					<%server.execute("databasecon.asp")%>
					<table cellpadding="2" cellspacing="5">
						<tr>
							<th>Clubs Owned:</th>
							<td><%
								if Application("myclubs").bof <> true and Application("myclubs").eof <> true then
									Application("myclubs").MoveFirst
									response.write(Application("myclubs")(session("uname")))
								else
									response.write("0")
								end if
								%></td>
							<th>Books Read:</th>
							<td><%
								if Application("readbook").bof <> true and Application("readbook").eof <> true then
									Application("readbook").MoveFirst
									response.write(Application("readbook")(session("uname")))
								else
									response.write("0")
								end if
								%></td>
						</tr>
						<tr>
							<th>Clubs Joined:</th>
							<td><%
								if Application("joinedclubs").bof <> true and Application("joinedclubs").eof <> true then
									Application("joinedclubs").MoveFirst
									response.write(Application("joinedclubs")(session("uname")))
								else
									response.write("0")
								end if
								%></td>
							<th>Books To Read:</th>
							<td>
								<%
								if Application("toreadbook").bof <> true and Application("toreadbook").eof <> true then
									Application("toreadbook").MoveFirst
									response.write(Application("toreadbook")(session("uname")))
								else
									response.write("0")
								end if
								%>
							</td>
						</tr>
					</table><br>
					<a href="viewprofile.asp?uname=<%response.write(session("uname"))%>" class="editprofbutton">See Profile</a>
				</div>
				<div class="settings">
					<table cellpadding="2" cellspacing="5">
						<tr>
							<th><a href="editprofile.asp" class="editprofbutton">Edit Profile</a></th>
						</tr>
						<tr>
							<th><a href="changepassword.asp" class="passwordbutton">Change Password</a></th>
						</tr>
						<tr>
							<th><a href="signout.asp" class="passwordbutton">Sign Out</a></th>
						</tr>
					</table>
				</div>
			</div>
			<div class="opts">
				<div class="optsname">
					<ul class="optlist">
						<li class="optitem" onclick="trial('aboutme')"><img src="images/abouticon.png" class="imgicon">About me</li>
						<li class="optitem" onclick="trial('favbook')"><img src="images/favoritebookicon.png" class="imgicon">Favorite Books</li>
						<li class="optitem" onclick="trial('readbooks')"><img src="images/readbookicon.png" class="imgicon">Books I Read</li>
						<li class="optitem" onclick="trial('toreadbooks')"><img src="images/toreadicon.png" class="imgicon">Books I want to Read</li>
						<li class="optitem" onclick="trial('myclubs')"><img src="images/clubicon.png" class="imgicon">My Clubs</li>
					</ul>
				</div>
				<div class="optsview">
					<div id="aboutme">
							<form method="post" action="aboutme.asp">
								<label>About Me:</label><br>
								<textarea name="aboutme" rows="5" cols="20"><%response.write(Application("userdata")("aboutme"))%>
								</textarea><br>
								<input type="submit" value="Submit">
							</form>
					</div>
					<div id="favbook">
						<form method="post" action="addfavbook.asp">
							<label>Add Favorite Book:</label><br>
							<input type="text" name="favbook">
							<input type="submit" value="Submit">
						</form>
					</div>
					<div id="readbooks">
						<form method="post" action="addreadbook.asp">
							<label>Add Book that you've read:</label><br>
							<input type="text" name="readbook">
							<input type="submit" value="Submit">
						</form>
					</div>
					<div id="toreadbooks">
						<form method="post" action="addtoreadbook.asp">
							<label>Add Book you want to Read:</label><br>
							<input type="text" name="toreadbook">
							<input type="submit" value="Submit">
						</form>
					</div>
					<div id="myclubs">
						<label>Clubs:</label><br>
								<p><%
									Application("myclubs").Movefirst()
									Application("myclubs").MoveNext()
									do until Application("myclubs").eof
										response.write(Application("myclubs")(name)&"<br>")
										Application("myclubs").MoveNext()
									loop
									Application("joinedclubs").Movefirst()
									Application("joinedclubs").MoveNext()
									do until Application("joinedclubs").eof
										response.write(Application("joinedclubs")(name)&"<br>")
										Application("joinedclubs").MoveNext()
									loop
								%></p>
					</div>
				</div>
			</div>
	</body>
	<!--#include file="footer.asp"-->
</html>