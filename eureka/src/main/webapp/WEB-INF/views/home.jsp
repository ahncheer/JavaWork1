<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<div style="height: 1000px; width : 80%; margin-left: 10%; background-color: #ddd; align-items: center;">
		<%@ include file="mobMain.jsp" %>
</div>
</body>
</html>
