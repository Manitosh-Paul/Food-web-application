<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>xxxxxxxxx</title>
<script>
			 	function calc() {
			 		
		            var price = document.getElementById("price").innerHTML;
		            var num = document.getElementById("num").value;
		            var total = parseFloat(price) * num;
		            if (!isNaN(total) && num > 0) {
		                document.getElementById("total").value = total;
		            }
		        }
			 	function setdt(){
			 		var date = new Date().toLocaleDateString();
			 		var time = new Date().toLocaleTimeString();
			 		document.getElementById("time").value = time;
			 		document.getElementById("date").value = date;
			 		//window.open("insertorder.jsp");
			 	}
			 	
			</script>
</head>
<style>
.hidden{
	display: none;
}
</style>
<body>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	int oid = Integer.parseInt(request.getParameter("itemid"));
	String get = (String)session.getAttribute("x");
	int uid = Integer.parseInt(get);
	if(oid!=0 && uid!=0){
		String sql = "select * from item where item_code='"+oid+"';";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		while(rs.next())
		{	
			int price = Integer.parseInt(rs.getString(5));
%>
			<form action="insertorder.jsp" method="post">
			<input type="number" name="t0" value="<%= uid%>" class="hidden">
			<input type="number" name="t1" value="<%= oid%>" class="hidden">
			<input type="text" name="t2" placeholder="Enter delivery details">
			<input type="text" name="t4" id="date">
			<input type="text" name="t5" id="time">
			<label>
			Total Price: <input type="text" name="t3" id="total" readonly>  
			</label>
			<input type="submit" value="order" onclick="setdt()">
			</form>
			<p>Price: <span id="price"><%= price %></span></p>
			<input id="num" type="number" oninput="calc()">

<%
		}
	}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>
