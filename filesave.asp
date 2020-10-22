<%@ language=vbscript %>
<%

  'Use one of the following lines, depending on the version of csASPUpload
  'Set Upload = Server.CreateObject("csASPUpload32.Process")
  Set Upload = Server.CreateObject("csASPUpload32Trial.Process")
  'Set Upload = Server.CreateObject("csASPUpload64.Process")
  'Set Upload = Server.CreateObject("csASPUpload64Trial.Process")

  'For the earlier version of csASPUpload:
  'Set Upload = Server.CreateObject("csASPUpload.Process")
  'Set Upload = Server.CreateObject("csASPUploadTrial.Process")

%>
<html>
<head>
<title>Saving file</title>

</head>

<body>
<%
  'Read the upload
  Upload.Read

  'Check there is a file before trying to save it

  If Upload.FileQty > 0 Then

   Upload.FileSave Server.MapPath("./files/") & "\" &  Upload.FileName(0), 0

%>
   <p>The file has been stored</p>
   <p><a href="fileupload.htm">Upload</a> another file.</p>
   <p><a href="view.asp">View</a> files already uploaded.</p>
<%
  Else
%>
   <p>No file was received</p>
   <p><a href="fileupload.htm">Upload</a> another file.</p>
   <p><a href="view.asp">View</a> files already uploaded.</p>
<%
  End If
%>
</body>
</html>
