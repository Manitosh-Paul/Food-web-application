<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
try{ 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String t1 = request.getParameter("t1");
	String t2 = request.getParameter("t2");
	String t3 = request.getParameter("t3");
	String t4 = request.getParameter("t4");
	String t5 = request.getParameter("t5");
	String t6 = request.getParameter("t6");
	String t7 = request.getParameter("t7");
	String t8 = request.getParameter("t8");
	String t9 = request.getParameter("t9");
	String t10 = request.getParameter("t10");
	String t11 = request.getParameter("t11");
	if((t1!=null && t1!="") && (t2!=null && t2!="") && (t3!=null && t3!="") && (t4!=null && t4!="") && (t5!=null && t5!="") && (t6!=null && t6!="") && (t7!=null && t7!="") && (t8!=null && t8!="") && (t9!=null && t9!="") && (t10!=null && t10!="") && (t11!=null && t11!="")){
	String sql = "insert into career(name, mobile_no, dob, education, intrested, Experience, outlet, under, status, email, address1) values('"+t1+"', '"+t2+"', '"+t3+"', '"+t4+"', '"+t5+"', '"+t6+"', '"+t7+"', '"+t8+"', '"+t9+"', '"+t10+"', '"+t11+"')";
	PreparedStatement pst = con.prepareStatement(sql);
	int i = pst.executeUpdate();	
	if(i>0){
		response.sendRedirect("index.jsp#contact");
			}
	}
}
catch(Exception e){
	//out.println(e);
}
%>
