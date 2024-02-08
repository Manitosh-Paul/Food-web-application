<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@1,400&display=swap" rel="stylesheet">
<title>puzzle</title>
</head>
<body>
<header id="home">
        <nav class="nav">
            <div class="logo linear_grad">
                <h3>puzzle</h3>
            </div>
            <div class="nav_links">
                <a href="index.jsp" class="home">Home</a>
                <a href="#features" class="features">Features</a>
                <a href="#menu" class="get">Get Started</a>
                <a href="#contact" class="contact">Contact</a>
            </div>
<%
String get = (String)session.getAttribute("x");
if(get!=null && get!="")
{
	//session.removeAttribute("x");
%>
			<div class="btn">
                <a href="logout.jsp">logout</a>
            </div>
	
<%	
}
else{
%>
			<div class="btn">
                <a href="login.jsp">log in</a>
            </div>
<%
}
%>
        </nav>
        <div class="hr"></div>
        <div class="head_body">
            <div class="left_div">
                <div class="welcome">
                    <h1 class="linear_grad">Welcome</h1>
                </div>
                <div>
                    <p class="heading">About the food culture in Jamshedpur</p>
                </div>
                <div>
                    <p class="text">Order food & beverages online from restaurants near & around you. We deliver food
                        from
                        your
                        neighborhood local joints, your favorite cafes, luxurious & elite restaurants in your area.
                        Exciting
                        bit? We place no minimum order restrictions! Order in as little (or as much) as you'd like.
                        We'll
                        Swiggy it to you!</p>
                </div>
                <div class="order_btn">
                    <a href="#menu" class="order">Order Now</a>
                </div>
            </div>
            <div class="right_div">
                <img src="image/home-img-2.png" alt="chicken">
            </div>
        </div>
</header>


    <!--Features page-->
    <section class="features_page" id="features">
        <div class="features_head">
            <h2>Our Features</h2>
        </div>
        <div class="banner">
            <div class="div">
                <div class="image">
                    <img src="image/minimum.jpg" alt="...">
                </div>
                <div class="content">
                    <div class="heading">
                        <h2>No Minimum Order</h2>
                        <p>Order in for yourself or for the group, with no restrictions on order value</p>
                    </div>
                </div>
            </div>
            <div class="div">
                <div class="image">
                    <img src="image/tasty.jpg" alt="...">
                </div>
                <div class="content">
                    <div class="heading">
                        <h2>Taste from the best Chefs</h2>
                        <p>Recipe has no soul. Our cook brings soul to the recipe</p>
                    </div>
                </div>
            </div>
            <div class="div">
                <div class="image">
                    <img src="image/fast.jpg" alt="...">
                </div>
                <div class="content">
                    <div class="heading">
                        <h2>Fast Delivery</h2>
                        <p>Experience Puzzle's superfast delivery for food delivered fresh & on time</p>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <!--Get Started page-->

    <section class="menu" id="menu">
        <div class="menu_head">
            <h2>We got something delcious for you</h2>
        </div>
        <div class="menu_items">
<%
try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/puzzle", "root", "#paul.SQL.12");
		String sql = "select * from item;";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();	
		while(rs.next()){
			int id = rs.getInt(1);
%>
            <div class="div">
                <div class="image">
                    <img src="image/<%= rs.getString(2) %>.png" alt="...">
                </div>
                <div class="hr_food"></div>
                <div class="content">
                    <div class="heading">
                        <h2 class="linear_grad"><%= rs.getString(3) %></h2>
                        <p>Category: <%= rs.getString(4) %></p>
                        <p>Price: <%= rs.getString(5) %> Rs.</p>
                    </div>
                    <div class="food_btn">
                        <a href="orders.jsp?itemid=<%= id %>" class="btn1">Order</a>
                    </div>
                </div>
            </div>
<%			
							}
}
catch(Exception e){
	out.println(e);
}
%>
        </div>
    </section>


    <!--Contact us page-->
<section id="contact" class="container container_contact">
        <div class="contact">
            <h2 class="major">Contact Us</h2>
            <h1 class="job">Apply for Job/Internship</h1>
        </div>
        <div class="apply">
            <form action="career.jsp" method="post" id="jobform">
                <div class="dataconatiner">
                    <div class="input_container">
                        <span>Name</span>
                        <input type="text" placeholder="Name" class="input" name="t1" required>
                    </div>
                    <div class="input_container">
                        <span>Phone Number</span>
                        <input type="number" placeholder="Phone Number" class="input" name="t2" required>
                    </div>
                    <div class="input_container">
                        <span>Date Of Birth</span>
                        <input type="date" class="input" name="t3" required>
                    </div>
                    <div class="input_container">
                        <span>Education</span>
                        <input type="text" placeholder="Education" class="input" name="t4" required>
                    </div>
                    <div class="input_container">
                        <span>Intrested</span>
                        <input type="text" placeholder="Intrested" class="input" name="t5" required>
                    </div>
                </div>
                <div class="dataconatiner">
                    <div class="input_container">
                        <span>Experience</span>
                        <input type="text" placeholder="Experience" class="input" name="t6" required>
                    </div>
                    <div class="input_container">
                        <span>Outlet</span>
                        <input type="text" placeholder="Outlet" class="input" name="t7" required>
                    </div>
                    <div class="input_container">
                        <span>Under</span>
                        <input type="text" placeholder="Under" class="input" name="t8" required>
                    </div>
                    <div class="input_container">
                        <span>Status</span>
                        <input type="text" placeholder="Status" class="input" name="t9" required>
                    </div>
                    <div class="input_container">
                        <span>Email Id</span>
                        <input type="email" placeholder="Email Id" class="input" name="t10" required>
                    </div>
                </div>
                <div class="address_data">
                    <div class="text_input">
                        <!--input_container-->
                        <span>Address</span>
                        <textarea name="t11" form="jobform" cols="25" rows="20" class="address"></textarea>
                    </div>
                    <button type="submit" value="submit" onclick="show()">Submit</button>
                </div>
            </form>
        </div>
<script>
	function show(){
		alert("We wil contact you soon");
		window.open("index.jsp#contact", "_self");
	}
</script>
</section>
    
    
    <!--Footer-->
    <footer>
        <div class="footer">
            <div class="links">
                <div class="social_media">
                    <a href="https://www.facebook.com/" target="_blank">Facebook</a>
                    <a href="https://www.instagram.com/" target="_blank">Instagram</a>
                    <a href="https://in.linkedin.com/" target="_blank">LinkedIn</a>
                    <a href="https://www.pinterest.com/" target="_blank">Pinintrest</a>
                </div>
                <div class="nav_links">
                    <a href="index.jsp">Home</a>
                    <a href="#features">Features</a>
                    <a href="#menu">Menu</a>
                    <a href="#contact">Apply for Job/Internship</a>
                    <a href="#home">Back to top</a>
                </div>
                <div class="email">
                    <h5>Contact us through</h5>
                    <a href="mailto:contact@puzzle.com">contact@puzzle.com</a>
                </div>
            </div>
            <div class="footer_hr"></div>
            <div class="credits">puzzle &copy;<span> manitosh paul </span> 2021</div>
        </div>

    </footer>
</body>
</html>