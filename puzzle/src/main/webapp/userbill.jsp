<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>
<%
String time = (String)request.getAttribute("time");
int user_id = Integer.parseInt((String)session.getAttribute("x"));
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String sql = "select * from orders where user_id='"+user_id+"' and order_time='"+time+"'";
	PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs = pst.executeQuery();	
	while(rs.next()){
		out.println(rs.getInt(1) + "" + rs.getString(2) + "" + rs.getString(3) + "" + rs.getString(4) + "" + rs.getString(5) + "" + rs.getString(6) + "" + rs.getString(7));
	}
}
catch(Exception e){
	out.println(e);
}
%>
</h1>
</body>
</html>