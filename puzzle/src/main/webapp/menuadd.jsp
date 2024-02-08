<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>puzzle-add-items</title>
<link rel="stylesheet" href="css/menuadd.css">
</head>
<body>
	<div class="itemadd">
		<div class="img">
            <img src="image/home.jpg" alt="">
        </div>
        <div class="blur">
        </div>
        <div class="additemform">
            <form action="menuadd.jsp" method="post" class="form">
                <div class="inputcontainer">
                    <label>Url<span>*</span> </label>
                    <input type="text" name="t1" placeholder="imagename.extension" class="input">
                </div>
                <div class="inputcontainer">
                    <label>Item<span>*</span> </label>
                    <input type="text" name="t2" placeholder="Item Name" class="input">
                </div>
                <div class="inputcontainer">
                    <label>Categorie<span>*</span> </label>
                    <input type="text" name="t3" placeholder="Snacks/Fast Food/Main Course..." class="input">
                </div>
                <div class="inputcontainer">
                    <label>Price<span>*</span> </label>
                    <input type="text" name="t4" placeholder="Numeric value (Eg. 500)" class="input">
                </div>
                <div>
                    <input type="submit" value="Add" class="btn">
                </div>
            </form>
        </div>
	</div>
</body>
<%
try{ 
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	String img = request.getParameter("t1");
	String n = request.getParameter("t2");
	String c = request.getParameter("t3");
	String p = request.getParameter("t4");
	if((img!=null && img!="") && (n!=null && n!="") && (c!=null && c!="") && (p!=null && p!="")){
	String sql = "insert into item(image, item_name, categorie, price) values('"+img+"', '"+n+"', '"+c+"', '"+p+"')";
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
</html>