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
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String t1 = request.getParameter("t1"); //details
	String t2 = request.getParameter("t2"); //order_bill
	int t3 = Integer.parseInt(request.getParameter("t3")); //user id
	String t4 = request.getParameter("t4"); //date
	String t5 = request.getParameter("t5"); //time
	int t6 = Integer.parseInt(request.getParameter("t6")); //itemcode
	if(t3!=0 && t6!=0 && t1!=null && t1!="" && t2!=null && t2!="" && t4!=null && t4!="" && t5!=null && t5!=""){
		String sql = "insert into orders(order_date,order_bill, user_id, order_time,details, item_code) values('"+t4+"', '"+t2+"', '"+t3+"', '"+t5+"', '"+t1+"', '"+t6+"') ;";
		PreparedStatement pst = con.prepareStatement(sql);
		int i = pst.executeUpdate();	
		if(i>0){
			request.setAttribute("time", t5);
			RequestDispatcher rd = request.getRequestDispatcher("orderbill.jsp");
			rd.forward(request, response);
		}
	}
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>