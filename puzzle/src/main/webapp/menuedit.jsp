<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/menuedit.css">
</head>
<body>
<div class="itemadd">
		<div class="img">
            <img src="image/home.jpg" alt="">
        </div>
        <div class="blur">
        </div>
        <a href="admin.jsp" class="cancel">
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
	String sql = "select * from item where item_code='"+id+"';";
	PreparedStatement pst = con.prepareStatement(sql);
	ResultSet rs = pst.executeQuery();
	while(rs.next())
	{
%>
            	<div class="hidden">
                    <label for="img">Id</label>
                    <input type="text" name="t0" placeholder="Item Id" value="<%=rs.getInt(1) %>" class="input">
                </div>
                <div class="inputcontainer">
                    <label for="img">Url</label>
                    <input type="text" name="t1" placeholder="imagename.extension" value="<%= rs.getString(2) %>" class="input">
                </div>
                <div class="inputcontainer">
                    <label for="img">Item</label>
                    <input type="text" name="t2" placeholder="Item Name" value="<%= rs.getString(3) %>" class="input">
                </div>
                <div class="inputcontainer">
                    <label for="img">Categorie</label>
                    <input type="text" name="t3" placeholder="Snacks/Fast Food/Main Course..." value="<%= rs.getString(4) %>" class="input">
                </div>
                <div class="inputcontainer">
                    <label for="img">Price</label>
                    <input type="text" name="t4" placeholder="Numeric value (Eg. 500)" value="<%= rs.getString(5) %>" class="input">
                </div>
<%
	}
}
catch(Exception e){
	out.println(e);
}
%>
                <div>
                    <input type="submit" value="Update" class="btn">
                </div>
            </form>
        </div>
    </div>
<%
try{ 
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
	int id = Integer.parseInt(request.getParameter("id"));
	String t1 = request.getParameter("t1");
	String t2= request.getParameter("t2");
	String t3= request.getParameter("t3");
	String t4= request.getParameter("t4");
	if(id!=0 && (t1!=null && t1!="") && (t2!=null && t2!="") && (t3!=null && t3!="") && (t4!=null && t4!="")){
	String sql = "update item set image='"+t1+"', item_name='"+t2+"', categorie='"+t3+"', price='"+t4+"' where item_code='"+id+"'";
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