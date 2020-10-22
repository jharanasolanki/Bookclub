
<link rel="stylesheet" type="text/css" href="css/clubboxc.css">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins">
		<div class="clubdata">
			<img src="profilepicture\<%response.write(Application("clubdata")("clubname")&".jpg")%>"" class="profpic">
			<table>
				<div class="username"><tr><td>Club name:</td><%response.write("<td>"&Application("clubdata")("clubname")&"</td>")%></tr></div>
				<div class="username"><tr><td>Owner name:</td><%response.write("<td>"&Application("clubdata")("owner")&"</td>")%></tr></div>
				<div class="username"><tr><td colspan="2">About:</td></tr></div>
				<div class="username"><tr><td colspan="2"><%response.write(Application("clubdata")("aboutclub"))%></td></tr></div>
				<tr><td><a href="addclub.asp?cname=<%response.write(Application("clubdata")("clubname"))%>" class="joinclubbutton">Join Club!</a></td></tr>
			</table>
		</div>