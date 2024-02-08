<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>puzzle-edit-employee</title>
<link rel="stylesheet" href="css/empedit.css">
</head>
<body>
<div class="itemadd">
		<div class="img">
            <img src="image/employee.jpg" alt="">
        </div>
        <div class="blur">
        </div>
        <a href="admin.jsp#Employee" class="cancel">
            <div class="line line1"></div>
            <div class="line line2"></div>
        </a>
        <div class="additemform">
            <form action="#" method="post" class="form">
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	int id = Integer.parseInt(request.getParameter("id"));
	String sql = "select * from employee where emp_id='"+id+"';";
	PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
%>  
                <div class="left">
                	<div class="hidden">
                        <label class="hidden">Id</label>
                        <input type="text" name="t1" placeholder="Employee Id" value="<%=rs.getInt(1) %>" class="input hidden">
                    </div>
                    <div class="inputcontainer">
                        <label>Name</label>
                        <input type="text" name="t2" placeholder="Employee Name" value="<%= rs.getString(2) %>" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Email</label>
                        <input type="text" name="t3" placeholder="Employee Email" value="<%= rs.getString(3) %>" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Password</label>
                        <input type="text" name="t4" placeholder="Employee Password" value="<%= rs.getString(4) %>" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Address</label>
                        <input type="text" name="t5" placeholder="Employee Address" value="<%= rs.getString(5) %>" class="input">
                    </div>
                    <div class="hidden">
                        <label class="hidden">Address</label>
                        <input type="text" name="t6" placeholder="Employee Address" value="<%= rs.getString(6) %>" class="input hidden">
                    </div>
                    <div class="inputcontainer">
                        <label>Designation</label>
                        <input type="text" name="t7" placeholder="Employee Designation" value="<%= rs.getString(7) %>" class="input">
                    </div>
                </div>
                <div class="right">
                    <div class="inputcontainer">
                        <label>Outlet</label>
                        <input type="text" name="t8" placeholder="Employee Outlet" value="<%= rs.getString(8) %>" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Salary</label>
                        <input type="text" name="t9" placeholder="Employee Salary" value="<%= rs.getString(9) %>" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Phone Number</label>
                        <input type="text" name="t10" placeholder="Employee Number" value="<%= rs.getString(10) %>" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Date of Birth</label>
                        <input type="text" name="t11" placeholder="ddmmyyyy" value="<%= rs.getString(11) %>" class="input">
                    </div>
<%
	}
}
catch(Exception e){
	//out.println(e);
}
%>
                    <div class="button">
                        <input type="submit" value="Update" class="btn">
                    </div>
                </div>
            </form>
        </div>
</div>
<%
try{ 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	int id = Integer.parseInt(request.getParameter("t1"));
	String n = request.getParameter("t2");
	String e = request.getParameter("t3");
	String p = request.getParameter("t4");
	String a = request.getParameter("t5");
	String d = request.getParameter("t7");
	String o = request.getParameter("t8");
	String s = request.getParameter("t9");
	String ph = request.getParameter("t10");
	String dob = request.getParameter("t11");
	if(id!=0 && (n!=null && n!="") && (e!=null && e!="") && (p!=null && p!="") && (a!=null && a!="") && (d!=null && d!="") && (o!=null && o!="") && (s!=null && s!="") && (ph!=null && ph!="") && (dob!=null && dob!="")){
	String sql = "update employee set emp_name='"+n+"', email='"+e+"', password='"+p+"', address1='"+a+"', designation='"+d+"', outlet='"+o+"', salary='"+s+"', contact='"+ph+"', dob='"+dob+"' where emp_id='"+id+"'";
	PreparedStatement pst = con.prepareStatement(sql);
	int i = pst.executeUpdate();	
	if(i>0){
%>
<script>
	alert("Record Updated.")
</script>
<%
			}
	}
}
catch(Exception e){
	//out.println(e);
}
%>
</body>
</html>