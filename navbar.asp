<html>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel = "icon" href = "images/bookclublogo.png" type = "image/x-icon"> 
	<link rel="stylesheet" type="text/css" href="css/navbarc.css"> 
	<body>
		<ul class="navbarul">
			<a href="homepage.asp" class="home"><img src="images/bookclub.png" height="5%" width="80%" class="logo"></a>
			<li><a href="login.asp" class="rightnav"><% 
  				if session("uname")="" then
  					response.write("Log In")
  				else
  					response.write("Hey "&session("uname"))
  				end if
  			%>
  			</a></li>
  			<li><a href="joinclub.asp" class="rightnav">Join a Club</a></li>
        <li><a href="createclub.asp" class="rightnav">Create a Club!</a></li>
  			<li><a href="findpeople.asp" class="rightnav">Find People</a></li>
		</ul>
	</body>
</html>