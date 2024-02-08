<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	if(session.getAttribute("x") != null){
		session.removeAttribute("x");
		response.sendRedirect("index.jsp");
	}
	else{
		response.sendRedirect("login.jsp");
	}
}
catch(Exception e){
	out.println();
}
%>
</body>
</html>