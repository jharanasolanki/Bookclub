
<html>
	<!--#include file="navbar.asp"-->
	<body>
		<div class="signup">
		<form method="post" id="signupform">
			<div id="errmsg"><p>Hello</p></div>
			<label>First Name:</label>
			<input type="text" name="fname" id="fname" placeholder="First Name"><br>
			<label>Last Name:</label>
			<input type="text" name="lname" id="lname" placeholder="Last Name" ><br>
			<label>Username:</label>
			<input type="text" name="username" id="username" placeholder="Userame" ><br>
			<label>Password:</label>
			<input type="password" name="password" id="password" placeholder="Password" ><br>
			<label>Enter password again:</label>
			<input type="password" name="password2" id="password2" placeholder="Password" ><br>
			<label>Email:</label>
			<input type="email" name="email" id="email" placeholder="Email" ><br>
			<label>Phone no:</label>
			<input type="number" name="phone" id="phone" placeholder="Phone" ><br>
			<input type="submit" value="Sign Up" onclick="return validate()" class="registerbtn">
		</form>
	</div>
	</body>
	<script type="text/javascript">
		function validate()
		{
			
			if(document.getElementById("fname").value=="" || document.getElementById("lname").value=="" || document.getElementById("username").value=="" || document.getElementById("password").value=="" || document.getElementById("password2").value=="" || document.getElementById("email").value=="" || document.getElementById("phone").value=="")
			{

				document.getElementById("errmsg").innerHTML="All fields should be filled";
				alert("hello")
			}
		}
	</script>
	<!--#include file="footer.asp"-->