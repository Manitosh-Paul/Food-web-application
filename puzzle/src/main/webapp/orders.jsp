<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
    function calc() {

        var price = document.getElementById("price").innerHTML;
        var num = document.getElementById("num").value;
        var total = parseFloat(price) * num;
        if (!isNaN(total) && num > 0) {
            document.getElementById("total").value = total;
        }
    }
    function setdt() {
        var date = new Date().toLocaleDateString();
        var time = new Date().toLocaleTimeString();
        document.getElementById("time").value = time;
        document.getElementById("date").value = date;
        //window.open("insertorder.jsp");
    }
</script>
<link rel="stylesheet" href="css/orders.css">
</head>
<body>
<%
String getuid = (String)session.getAttribute("x");
if(getuid!=null && getuid!="")
{
%>
<div class="container">
        <div class="image">
            <img src="image/order.png" alt="....">
        </div>
        <div class="blur"></div>
        <a href="index.jsp#menu" class="cancel">
            <div class="line line1"></div>
            <div class="line line2"></div>
        </a>
        <div class="fillorders">
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
            <div class="itemcontainer">
                <div class="pimage">
                    <img src="image/<%= rs.getString(2) %>.png" alt="">
                </div>
                <div class="pimgdetails">
                    <h2 class="linear_grad"><%= rs.getString(3) %></h2>
                    <p>Category: <span><%= rs.getString(4) %></span></p>
                    <p>Price: <span id="price"><%= rs.getString(5) %></span>Rs.</p>
                </div>
            </div>
            <div class="ordersform">
                <div class="left">
                    <form action="insertorder.jsp" method="post">
                        <div class="input">
                            <label>Address</label>
                            <textarea name="t1" cols="5" rows="10"
                                style="width: 80%; margin-left: 15px; padding-left: 5px; padding-top: 3px; border: none; outline: none;"></textarea>
                        </div>
                        <div class="input">
                            <label>Total Price(In Rs.):</label>
                            <input type="text" name="t2" value="0" id="total" readonly>
                        </div>
                        <div class="input" id="hidden">
                            <label>User Id</label>
                            <input type="text" name="t3" value="<%= uid%>">
                        </div>
                        <div class="input" id="hidden">
                            <label>Date</label>
                            <input type="text" name="t4" id="date">
                        </div>
                        <div class="input" id="hidden">
                            <label>time</label>
                            <input type="text" name="t5" id="time">
                        </div>
                        <div class="input" id="hidden">
                            <label>Item Code</label>
                            <input type="text" name="t6" value="<%= oid%>">
                        </div>
                        <!-- <div class="input" id="hidden">
                            <label>Delivery time</label>
                            <input type="text" name="t7">
                        </div> -->
                        <div class="input">
                            <input type="submit" value="Order" class="submit" onclick="setdt()">
                        </div>
                    </form>
                </div>
<%
		}
	}
}
catch(Exception e){
	out.println(e);
}
%>
                <div class="right">
                    <div style="margin-top: auto; margin-bottom: auto;">
                        <div class="input">
                            <label>Quantity</label>
                            <input type="number" value="0" id="num" oninput="calc()">
                        </div>
                        <div class="note" style="margin-top: 20px;">
                            <p style="color: var(--bg);">Note:</p>
                            <p style="color: var(--pure);">For now we are only accepting COD(Cash On Delivery)</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%	
}
else{
%>
<script>
alert("Please Login first");
window.open("index.jsp#menu", "_self");
</script>
<%
}
%>
</body>
</html>