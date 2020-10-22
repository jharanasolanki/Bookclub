<%
	if session("uname")="" then
		server.execute("databasecon.asp")
	end if
%>
<html>

	<link rel="stylesheet" type="text/css" href="css/homepage.css"> 
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Poppins">
	<!--#include file="navbar.asp"-->
	<body bgcolor="#ffffe6">
		<div class="aboutclub">
			<p class="aboutclubdata">Do you love books?<br>Are you often looking for people to discuss literature with? Lots of people love to read, but it can be hard to find someone to discuss the book you're reading especially if you love an uncommon genre. If you're having a hard time finding people to talk with about your reading material, you might want to consider joining or starting a book club. They're also great opportunities to meet new people and make new friends with common interests.<br>It's common for groups of friends who enjoy reading to start book clubs, but if your friends aren't the literary type then you can find some here. Find people, clubs and books all at one place. This is where you can meet fellow booklovers from around, or other cities or even other countries!
			</p>
		</div>
		<div class="getbooks">
			<p class="getbooksdata">
			What is a book club?<br>
			A book club is a reading group, usually consisting of a number of people who read and talk about books based on a topic or an agreed-upon reading list. It's common for book clubs to choose a specific book to read and discuss at the same time. Formal book clubs meet on a regular basis at a set location. Most book clubs meet monthly in order to give members time to read the next book. Book clubs can be focused on literary critique or on less academic topics. Some book clubs are focused on a certain genre, such as romance or horror. There are even book clubs dedicated to a particular author or series. Whatever reading material you prefer, if you can't find a book club for it why not think about starting your own? </p>
		</div>
	</body>
	<!--#include file="footer.asp"-->
</html>
