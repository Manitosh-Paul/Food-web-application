<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/orderbill.css">
</head>
<body>
<div class="container">
        <div class="image">
            <img src="image/order.png" alt="....">
        </div>
        <div class="blur"></div>
        <a href="index.jsp#menu" class="cancel">
            <div class="line line1"></div>
            <div class="line line2"></div>
        </a>
        <div class="billcontainer">
            <div class="logo">
                <h2 class="linear_grad">puzzle</h2>
            </div>
            <div class="bill">
                <h3>Order Bill</h3>
            </div>
<%
String time = (String)request.getAttribute("time");
int user_id = Integer.parseInt((String)session.getAttribute("x"));
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String sql = "select order_code, item_name, order_date, order_time, order_bill, details from item natural join orders where user_id='"+user_id+"' and order_time='"+time+"';";
	PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs = pst.executeQuery();	
	while(rs.next()){	
%>
            <div class="itembill">
                <p>Order Code: <span><%= rs.getInt(1) %></span></p>
                <p>Item Name: <span><%= rs.getString(2) %></span></p>
                <p>Order Date: <span><%= rs.getString(3) %></span></p>
                <p>Order Time: <span><%= rs.getString(4) %></span></p>
                <p>Delivery Time: <span>Your order will be delivered within 15-30 minutes.</span></p>
                <p>Order Bill: <span><%= rs.getString(5) %> Rs.</span></p>
                <p>Delivery Address: <span><%= rs.getString(6) %></span></p>
            </div>
<%
	}
	}
	catch(Exception e){
		out.println(e);
	}
%>
        </div>
    </div>
</body>
</html>