<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/form.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@1,400&display=swap" rel="stylesheet">
<title>puzzle-signup</title>
</head>
<body>
<div class="container">
		<div class="img">
            <img src="image/formbg.png" alt="">
        </div>
        <div class="blur"></div>
        <a href="login.jsp" class="cancel">
            <div class="line line1"></div>
            <div class="line line2"></div>
        </a>
        <div class="formbox">
            <div class="btnbox">
                <div class="hr"></div>
                <div id="btncolor"></div>
                <button type="button" class="reg signup">Sign up</button>
            </div>
            <form action="signup.jsp" method="post" class="form">
                <input type="text" name="email" placeholder="Email" class="input_sign" required>
                <input type="text" name="pass" placeholder="Password" class="input_sign" required>
                <input type="text" name="city" placeholder="City" class="input_sign" required>
                <input type="number" name="pin" placeholder="Pin Code" class="input_sign" required>
                <input type="number" name="mob" placeholder="Mobile Number" class="input_sign" required>
                <input type="date" name="dob" placeholder="Date of Birth" class="input_sign" required>
                <input type="submit" value="Register" class="btn_sign">
            </form>
        </div>
    </div>
</body>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String e = request.getParameter("email");
	String p = request.getParameter("pass");
	String c = request.getParameter("city");
	String pin = request.getParameter("pin");
	String ph = request.getParameter("mob");
	String dob = request.getParameter("dob");
	if ((e!=null && e!="") && (p!=null && p!="") && (c!=null && c!="") && (pin!=null && p!="") && (ph!=null && ph!="") && (dob!=null && dob!="")){
	String sql = "insert into user(email, password, city, pincode, mobile_no, dob) values('"+e+"', '"+p+"', '"+c+"', '"+pin+"', '"+ph+"', '"+dob+"')";
	PreparedStatement pst = con.prepareStatement(sql);
	int i = pst.executeUpdate();
	if(i > 0){
%>
				<script>
					alert("Welcom to puzzle. Let's login");
					window.open("login.jsp", "_self");
				</script>
<%
			 }
	}
}
catch(Exception e){
out.println(e);
}

%>
</html>