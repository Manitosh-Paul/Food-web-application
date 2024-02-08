<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>puzzle-add-employee</title>
<link rel="stylesheet" href="css/empadd.css">
</head>
<body>
<div class="itemadd">
		<div class="img">
            <img src="image/employee.jpg" alt="">
        </div>
        <div class="blur">
		</div>
        <div class="additemform">
            <form action="empadd.jsp" method="post" class="form">
                <div class="left">
                    <div class="inputcontainer">
                        <label>Name<span>*</span> </label>
                        <input type="text" name="t1" placeholder="Employee Name" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Email<span>*</span> </label>
                        <input type="text" name="t2" placeholder="Employee Email" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Password<span>*</span> </label>
                        <input type="text" name="t3" placeholder="Employee Password" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Address<span>*</span> </label>
                        <input type="text" name="t4" placeholder="Employee Address" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Designation<span>*</span> </label>
                        <input type="text" name="t5" placeholder="Employee Designation" class="input">
                    </div>
                </div>
                <div class="right">
                    <div class="inputcontainer">
                        <label>Outlet<span>*</span> </label>
                        <input type="text" name="t6" placeholder="Employee Outlet" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Salary<span>*</span> </label>
                        <input type="text" name="t7" placeholder="Employee Salary" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Phone Number<span>*</span> </label>
                        <input type="text" name="t8" placeholder="Employee Number" class="input">
                    </div>
                    <div class="inputcontainer">
                        <label>Date of Birth<span>*</span> </label>
                        <input type="text" name="t9" placeholder="ddmmyyyy" class="input">
                    </div>
                    <div class="button">
                        <input type="submit" value="Add" class="btn">
                    </div>
                </div>
            </form>
        </div>
    </div>
<%
try{ 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String n = request.getParameter("t1");
	String e = request.getParameter("t2");
	String p = request.getParameter("t3");
	String a = request.getParameter("t4");
	String d = request.getParameter("t5");
	String o = request.getParameter("t6");
	String s = request.getParameter("t7");
	String ph = request.getParameter("t8");
	String dob = request.getParameter("t9");
	if((n!=null && n!="") && (e!=null && e!="") && (p!=null && p!="") && (a!=null && a!="") && (d!=null && d!="") && (o!=null && o!="") && (s!=null && s!="") && (ph!=null && ph!="") && (dob!=null && dob!="")){
	String sql = "insert into employee(emp_name, email, password, address1, designation, outlet, salary, contact, dob) values('"+n+"', '"+e+"', '"+p+"', '"+a+"', '"+d+"', '"+o+"', '"+s+"', '"+ph+"', '"+dob+"')";
	PreparedStatement pst = con.prepareStatement(sql);
	int i = pst.executeUpdate();	
	if(i>0){
%>
<script>
	alert("Record Added.")
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