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
<title>puzzle-login</title>
</head>
<body>
<div class="container">
		<div class="img">
            <img src="image/formbg.png" alt="">
        </div>
        <div class="blur"></div>
        <a href="index.jsp" class="cancel">
            <div class="line line1"></div>
            <div class="line line2"></div>
        </a>
        <div class="formbox">
            <div class="btnbox">
                <div class="hr"></div>
                <div type="button" class="reg signin">Sign in</div>
            </div>
            <form action="login.jsp" method="post" id="signin" class="form">
                <div class="newuser">
                    <h5>New User? <a href="signup.jsp">Sign Up</a></h5>
                </div>
                <input type="text" name="email" placeholder="Email" class="input_log email">
                <input type="password" name="pass" placeholder="Password" class="input_log password">
                <input type="submit" value="Login" class="btn_log">
            </form>
        </div>
    </div>
<%
try{
	String e = request.getParameter("email");
	String p = request.getParameter("pass");
	if("manitoshraj.mj121@gmail.com".equals(e) && "admin@puzzle".equals(p)){
		int id=1;
		int i=1;
		session.setAttribute("x", String.valueOf(id));
		response.sendRedirect("admin.jsp");
	}
	else{
			int id =0; 
			int i=0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
			if ((e!=null && e!="") && (p!=null && p!="")){
				
				/*Code to get the id of the logged in user*/
				
				String sql2 = "select user_id from user where email='"+e+"'";
				PreparedStatement pst2 = con.prepareStatement(sql2);
				ResultSet rs2 = pst2.executeQuery();
				if(rs2.next()){
				 id = rs2.getInt(1);
				} //if block of rs2 is closed.
				
				/*Code to get the id of the logged in user ends*/
				
				String sql = "select email,password from user where email='"+e+"' and password='"+p+"'";
				PreparedStatement pst = con.prepareStatement(sql);
				ResultSet rs = pst.executeQuery();
				if(rs.next()){
							i=1;
							session.setAttribute("x", String.valueOf(id));
							response.sendRedirect("index.jsp");
						} //while block of rs.next()closed.
				//if(i==0){
				else{		
%>
						<script>
							alert("User does not exists or invalid email or password.");
							window.open("login.jsp", "_self");
						</script>
<%
				}
			} //if block of checking email and passowrd is not null, closed.
			
	}
} //try block closed
	catch(Exception e){
		//out.println(e);
	}
%>
</body>
</html>