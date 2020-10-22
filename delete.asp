<%@ language=vbscript %>
<%

  Path = server.MapPath("./files/")
  Set FSO = Server.CreateObject("Scripting.FileSystemObject")
  FSO.DeleteFile(Path & "\" & Request.Form("FileName"))

%>
<html>
<head>
<title>Deleting file</title>

</head>

<body>
<p>File deleted.</p>
<p><a href="view.asp">Back to view page.</a></p>

</body>
</html>
