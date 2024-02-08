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
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
		int id = Integer.parseInt(request.getParameter("id"));
		String sql = "delete from item where item_code='"+id+"'";
		PreparedStatement pst = con.prepareStatement(sql);
		int i = pst.executeUpdate();	
		if(i>0){
			response.sendRedirect("admin.jsp");
		}
		
	}
	catch(Exception e){
		out.println(e);
	}
%>
</body>
</html>