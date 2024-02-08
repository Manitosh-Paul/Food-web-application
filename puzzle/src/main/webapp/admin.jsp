<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>puzzle-admin</title>
<link rel="stylesheet" href="css/administrator.css">
<script>
	function show(){
		var ask = confirm("Are you sure you want to delete this item?");
		if(ask==true){
			window.open("menudelete.jsp");
			return true;
		}
		else{
			window.open("admin.jsp");
			return false;
		}
	}
	function ordershow(){
		var ask = confirm("Are you sure you want to delete this order?");
		if(ask==true){
			window.open("ordersdelete.jsp");
			return true;
		}
		else{
			window.open("admin.jsp#Order");
			return false;
		}
	}
	function empshow(){
		var ask = confirm("Are you sure you want to delete this employee?");
		if(ask==true){
			window.open("empdelete.jsp");
			return true;
		}
		else{
			window.open("admin.jsp#Employee");
			return false;
		}	
	}
	function usershow(){
		var ask = confirm("Are you sure you want to delete this user?");
		if(ask==true){
			window.location("userdelete.jsp");
			return true;
		}
		else{
			window.open("admin.jsp#User");
			return false;
		}	
	}
	function careershow(){
		if(confirm("Are you sure you want to delete?")){
			window.open("careerdelete.jsp");
		}
		else{
			window.open("admin.jsp#Career);
			return false;
		}
	}
</script>
</head>
<body>
<!-- ----------------------------------------Header Section---------------------------------------- -->
<header class="container" id="Menu">

<!-- ----------------------------------------Nav Section---------------------------------------- -->

        <nav>
            <div class="logo">
                <h1>puzzle</h1>
            </div>
            <div class="navlinks">
                <a href="#Menu">Menu</a>
                <a href="#Order">Order</a>
                <a href="#Employee">Employee</a>
                <a href="#User">User</a>
                <a href="#Career">Career</a>
            </div>
            <div class="dropdown">
                <button class="add_btn">Add</button>
                <div class="addopt">
                    <a href="menuadd.jsp" target="_blank">Item</a>
                    <a href="empadd.jsp" target="_blank">Employee</a>
                </div>
            </div>
            <div class="logout">
                <!-- <a href="index.jsp">Logout</a> -->
                <a href="logout.jsp">Logout</a>
            </div>
        </nav>
<!-- ----------------------------------------Nav Section---------------------------------------- -->
        
<!-- ----------------------------------------Menu Section---------------------------------------- -->
        <div class="content">
        	<div class="image">
                <img src="image/menu.jpg" alt="">
            </div>
            <div class="blur"></div>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String sql = "select * from item";
	PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs = pst.executeQuery();	
%>
<table class="t_container">
	<thead>
		<tr>
			<th>Item Code</th>
			<th>Image Url</th>
			<th>Item Name</th>
			<th>Categorie</th>
			<th>Price</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
<%		
	while(rs.next())
		{
			int id = rs.getInt(1);
%>
			<tr>
				<td><%= id %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %> Rs.</td>
				<td><a href="menuedit.jsp?id=<%= id %>" class="edit">Edit</a></td>
				<td><a href="menudelete.jsp?id=<%= id %>" class="edit" onclick="show()">Delete</a></td>
			</tr>
<%			
		}
%>
	</tbody>
</table>
<%
	}
catch(Exception e)
	{
	out.println(e);
	}
%>
        </div>
<!-- ----------------------------------------Menu Section---------------------------------------- -->
</header>
<!-- ----------------------------------------Header Section---------------------------------------- -->

<!-- ----------------------------------------Order Section---------------------------------------- -->

<section id="Order">
        <div class="content">
        	<div class="image">
                <img src="image/orders.jpg" alt="">
            </div>
            <div class="blur"></div>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
		String sql = "select * from orders";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();	
%>
<table class="t_container">
	<thead>
		<tr>
			<th>Order Code</th>
			<th>Item code</th>
			<th>User Id</th>
			<th>Order Date</th>
			<th>Order Bill</th>
			<th>Order Time</th>
			<th>Details</th>
			<th>Delete</th>
		</tr>
	</thead>
	<tbody>
<%		
	while(rs.next())
		{
		int id = rs.getInt(1);
%>
			<tr>
				<td><%= rs.getInt(1) %></td>
				<td><%= rs.getInt(7) %></td>
				<td><%= rs.getInt(4) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><a href="ordersdelete.jsp?id=<%= id %>" class="edit" onclick="ordershow()">Delete</a></td>
			</tr>
<%			
		}
%>
	</tbody>
</table>
<%
	}
catch(Exception e){
	out.println(e);
}
%>
        </div>
</section>

<!-- ----------------------------------------Order Section---------------------------------------- -->

<!-- ----------------------------------------Employee Section---------------------------------------- -->
<section id="Employee">
	<div class="content">
			<div class="image">
                <img src="image/employees.jpeg" alt="">
            </div>
            <div class="blur"></div>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
		String sql = "select * from employee";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();	
%>
<table class="t_container">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Email</th>
			<th>Password</th>
			<th>Address1</th>
			<th>Address2</th>
			<th>Designation</th>
			<th>Outlet</th>
			<th>Salary</th>
			<th>Phone Number</th>
			<th>Date of birth</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
	</thead>
<tbody>
<%		
	while(rs.next())
		{
			int id = rs.getInt(1);
%>
			<tr>
				<td><%= id %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
				<td><%= rs.getString(7) %></td>
				<td><%= rs.getString(8) %></td>
				<td><%= rs.getString(9) %></td>
				<td><%= rs.getString(10) %></td>
				<td><%= rs.getString(11) %></td>
				<td><a href="empedit.jsp?id=<%= id %>" class="edit">Edit</a> </td>
				<td><a href="empdelete.jsp?id=<%= id %>" class="edit" onclick="empshow()">Delete</a> </td>
			</tr>
<%			
		}
%>
	</tbody>
</table>
<%
}
catch(Exception e){
	out.println(e);
}
%>
	</div>
</section>

<!-- ----------------------------------------Employee Section---------------------------------------- -->

<!-- ----------------------------------------User Section---------------------------------------- -->
<section id="User">
	<div class="content">
	<div class="image">
                <img src="image/users.jpg" alt="">
            </div>
            <div class="blur"></div>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
		String sql = "select * from user";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();	
%>
<table class="t_container">
	<thead>
		<tr>
			<th>User Id</th>
			<th>Email</th>
			<th>Password</th>
			<th>City</th>
			<th>Pincode</th>
			<th>Mobile</th>
			<th>Date of Birth</th>
			<th>Delete</th>
		</tr>
	</thead>
<tbody>
<%		
	while(rs.next())
	{
		int id = rs.getInt(1);
%>
		<tr>
			<td><%= id %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td><%= rs.getString(7) %></td>
			<td><a href="userdelete.jsp?id=<%= id %>" class="edit" onclick="usershow()">Delete</a></td>
		</tr>
<%			
	}
%>
	</tbody>
</table>
<%
}
catch(Exception e){
	out.println(e);
}
%>
        </div>
</section>

<!-- ----------------------------------------User Section---------------------------------------- -->

<!-- ----------------------------------------Career Section---------------------------------------- -->
<section id="Career">
	<div class="content">
	<div class="image">
                <img src="image/careernew.jpg" alt="">
            </div>
            <div class="blur"></div>
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
		String sql = "select * from career";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();	
%>
<table class="t_container">
	<thead>
		<tr>
			<th>Name</th>
			<th>Phone Number</th>
			<th>Date of birth</th>
			<th>Education</th>
			<th>Intrested</th>
			<th>Experience</th>
			<th>Outlet</th>
			<th>Under</th>
			<th>Status</th>
			<th>Email</th>
			<th>Address</th>
			<th>Delete</th>
		</tr>
	</thead>
<tbody>
<%		
	while(rs.next())
	{
			int id = rs.getInt(1);
%>
		<tr>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
			<td><%= rs.getString(6) %></td>
			<td><%= rs.getString(7) %></td>
			<td><%= rs.getString(8) %></td>
			<td><%= rs.getString(9) %></td>
			<td><%= rs.getString(10) %></td>
			<td><%= rs.getString(11) %></td>
			<td><%= rs.getString(12) %></td>
			<td><a href="careerdelete.jsp?id=<%= id %>" class="edit" onclick="careershow()">Delete</a></td>
		</tr>
<%			
	}
%>
	</tbody>
</table>
<%
}
catch(Exception e){
	out.println(e);
}
%>
	</div>
</section>

<!-- ----------------------------------------Career Section---------------------------------------- -->
</body>
</html>