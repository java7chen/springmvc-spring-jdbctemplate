<%@ page pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404</title>
</head>
<body>
	<h1>404</h1>
	RequestURI:
	<%=request.getAttribute("javax.servlet.error.request_uri")%>
</body>
</html>
