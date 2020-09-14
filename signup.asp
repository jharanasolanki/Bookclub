
<html>
	<!--#include file="navbar.asp"-->
	<body>
	<div class="signup">
		<form method="post" id="signupform">
			<label>First Name:</label>
			<input type="text" name="fname" id="fname" placeholder="First Name"><br>
			<div id="err1" class="err"></div>
			<label>Last Name:</label>
			<input type="text" name="lname" id="lname" placeholder="Last Name" ><br>
			<div id="err2" class="err"></div>
			<label>Username:</label>
			<input type="text" name="username" id="username" placeholder="Userame" ><br>
			<div id="err3" class="err"></div>
			<label>Password:</label>
			<input type="password" name="password" id="password" placeholder="Password" ><br>
			<div id="err4" class="err"></div>
			<label>Enter password again:</label>
			<input type="password" name="password2" id="password2" placeholder="Password" ><br>
			<div id="err5" class="err"></div>
			<label>Email:</label>
			<input type="email" name="email" id="email" placeholder="Email" ><br>
			<div id="err6" class="err"></div>
			<label>Phone no:</label>
			<input type="number" name="phone" id="phone" placeholder="Phone" ><br>
			<div id="err7" class="err"></div>
			<input type="submit" value="Sign Up" onclick="return validate()" class="registerbtn">
		</form>
	</div>
	</body>
	</script>
	<script type="text/javascript">
		function validate()
		{
			alert("hello");
			if(document.getElementById("fname").value=="")
				document.getElementById("err1").innerHTML="Field Required";
			else
				document.getElementById("err1").innerHTML="";
			if(document.getElementById("lname").value=="")
				document.getElementById("err2").innerHTML="Field Required";
			else
				document.getElementById("err2").innerHTML="";
			if(document.getElementById("username").value=="")
				document.getElementById("err3").innerHTML="Field Required";
			else
				document.getElementById("err3").innerHTML="";
			if(document.getElementById("password").value=="")
				document.getElementById("err4").innerHTML="Field Required";
			else
				document.getElementById("err4").innerHTML="";
			if(document.getElementById("password2").value=="")
				document.getElementById("err5").innerHTML="Field Required";
			else
				document.getElementById("err5").innerHTML="";
			if(document.getElementById("email").value=="")
				document.getElementById("err6").innerHTML="Field Required";
			else
				document.getElementById("err6").innerHTML="";
			if(document.getElementById("phone").value=="")
				document.getElementById("err7").innerHTML="Field Required";
			else
				document.getElementById("err7").innerHTML="";

			if(document.getElementById("password").value!=document.getElementById("password2").value)
				document.getElementById("err4").innerHTML="Passwords don't match";
			else
				document.getElementById("err4").innerHTML="";

			if(document.getElementById("phone").value.length<10)
				document.getElementById("err7").innerHTML="Enter valid Phone Number";
			else
				document.getElementById("err7").innerHTML="";

			const re =/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

			if(!re.test(document.getElementById("email").value))
				document.getElementById("err6").innerHTML="Enter valid Email Address";
			else
				document.getElementById("err6").innerHTML="";

			alert(document.getElementById("err1"));
			var i;
			var x="err";
			for(i=1;i<8;i++)
			{
				if(document.getElementById(x+i).innerHTML!="")
				{
					break;
				}
			}
			if(i==8)
			{
				<%
					con.close
					con=nothing
					rs.close
					rs=nothing
				%>
				document.getElementById("signupform").submit();
			}

			return false;
		}
		
	</script>
<!--#include file="footer.asp"-->
</html>