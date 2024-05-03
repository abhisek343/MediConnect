<%-- 
    Document   : logout
    Created on : Dec 6, 2022, 10:55:19 PM
    Author : Abhisek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
	<body>
            <script>window.alert(Logout);</script>
		<% session.invalidate(); %> <!-- HERE WE ARE INVALIDATE THE SESSION, SO THAT NO VALUES WILL BE PRESENT IN SESSION -->
		<jsp:forward page="index.jsp"/>
	</body>
</html>
