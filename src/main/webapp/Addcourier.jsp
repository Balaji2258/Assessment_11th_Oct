<%@page import="java.time.LocalDate"%>
<%@page import="javax.print.attribute.standard.DateTimeAtCompleted"%>
<%@page import="java.util.Random"%>
<%@page import="com.perfios.test.oct11.service.CourierService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apex Courier - Add</title>
<link rel="stylesheet" href="css/welcomeStyle.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');
	body, .content, .container {
		background: #7ACDF5;
	}
	
	.navbar {
		margin-left: 15%;
	}
	
	.content {
		height: 70%;
	}
	
	/* .container {
		margin-left: auto;
		margin-right: auto;
	} */
	
	.navg {
	    align-items: center;
	}
	
	.navbar {
	    overflow: hidden;
	    position: absolute;
	    margin-left: 78%;
	    width: auto;
	}
	
	ul {
	    list-style-type: none;
	    margin: 0;
	    padding: 0;
	    overflow: hidden;
	    align-self: center;
	}
	  
	li {
	  float: left;
	  border-top-left-radius: 0px;
	  border-top-right-radius: 0px;
	  background-color: #333;
	}
	
	li a {
	  display: block;
	  text-align: center;
	  color: white;
	  padding: 20px 50px;
	  text-decoration: none;
	  color: #F6C7A1;
	  border-top-left-radius: 0px;
	  border-top-right-radius: 0px;
	}
	
	li .active {
		background: rgb(95, 108, 232);
		color: white;
	}
	
	.container table {
	    margin-right: auto;
	    background: rgb(63, 62, 62);
	    color: #F6C7A1;
	    margin-top: 12%;
	    margin-left: 31.5%;
	    width: 35%;
	    position: relative;
	    border-radius: 2px;
	}
	
	.container table .tabhead {
	    background-color: black;
	    color: #F6C7A1;
	    padding: 10px;
	    font-size: 25px;
	}
	
	.container table tr td {
	    padding: 10px 10px 10px 45px;;
	    margin: 0;
	    border: 0;
	    text-align: center;
	}
	
	.container table tr .nc {
		text-align: left;
		width: 220px;
	}
	
	td input {
	    padding: 10px;
	    width: 60%;
	}
	
	td select {
	    padding: 10px;
	    width: 68%;
	}
	
	.container table tr .btn {
	    padding: 5px;
	    background-color: #333;
	    color: #F6C7A1;
	    width: 30%;
	    font-weight: bolder;
	}
	
	.container table tr .btn:hover {
	    background-color: grey;
	    color: whitesmoke;
	}
	
	.content .container .login_img img {
		float: left;
		margin-left: 23%;
		margin-top: 12%;
		width: 14%;
		height: 14%;
	}
	
	.container table {
		margin-right: 23%;
	}
	
</style>
</head>
<body>
	<header>
		<div class="logo1">
			<img src="images/logo.jpg" class="logo" alt="Your Bank">
		</div>

		<div class="whatsapp">
			<a href="https://api.whatsapp.com/send?phone=9590867522"><img src="whatsapp.jpg" class="whatsapp" alt="Send Message"></a>
		</div>
		
		<div class = "head_content">
			<p class="bank_name">APEX COURIER</p>
			<p class="tagline" style="font-family: 'Kaushan Script', cursive;">Your Delivery Partner</p>
		</div>

		<div class="navg">
			<nav class="navbar">
				<ul>
					<li><a href="Addcourier.jsp" class="active">Add Courier</a></li>
					<li><a href="ViewAllDetails.jsp">View All Details</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
	<br>
	
	<div class="content">
		
		<div class="container">
			<form action="Add" method="post" name="registerForm">
			<table class = "reg">
				<tr>
					<th colspan=2 align="center" class="tabhead">ADD DETAILS</th>
				</tr>
				
				<tr>
					<td class="nc">Enter Sender Name<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="text" id="sname" name="sname" ></td>
				</tr>
				
				<tr>
					<td class="nc">Enter Sender City<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><select name="scity" id="scity">
						<option value="">select sender city</option>
						<option value="bangalore">Bangalore</option>
						<option value="kolkata">Kolkata</option>
						<option value="mumbai">Mumbai</option>
						<option value="delhi">Delhi</option>
					</select></td>
				</tr>
		
				<tr>
					<td class="nc">Enter Sender Phone<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="tel" id="sphone" name="sphone"></td>
				</tr>
				
				<tr>
					<td class="nc">Enter Receiver City<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><select name="rcity" id="rcity">
						<option value="">select sender city</option>
						<option value="bangalore">Bangalore</option>
						<option value="kolkata">Kolkata</option>
						<option value="mumbai">Mumbai</option>
						<option value="delhi">Delhi</option>
					</select></td>
				</tr>
				
				<tr>
					<td class="nc">Enter Receiver Phone<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="tel" id="rphone" name="rphone"></td>
				</tr>
				
				<tr>
					<td class="nc">Enter Package Weight (in gms)<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="number" id="pweight" name="pweight"></td>
				</tr>
				
				<tr><td colspan="2" align="center"><br><input type="submit" class="btn" value="CONTINUE"/></td></tr>
			</table>
			</form>
		</div>
	</div>
	
	<%-- <%
	String senderName = request.getParameter("sname");
	
	String fromCity = request.getParameter("scity");
	
	String smob = request.getParameter("sphone");
	
	Long senderMobile;
	if(!(smob == "") && !(smob == null))
		senderMobile = Long.parseLong(smob);
	
	String toCity = request.getParameter("rcity");
	String rmob = request.getParameter("rphone");
	
	Long receiverMobile;
	if(!(rmob == "") && !(rmob == null))
		receiverMobile = Long.parseLong(rmob);
	
	String pwt = request.getParameter("pweight");
	
	Double packetWt = 0.0;
	if(!(pwt == "") && !(pwt == null))
		packetWt = Double.parseDouble(pwt);
	
	Double amount = CourierService.getPayableAmount(packetWt);
	
	Integer shipmentTrackingNumber = new Random().nextInt(1000000000); 
	
	LocalDate shipmentDate = LocalDate.now();
	
	LocalDate deliveryDate = LocalDate.now().plusDays(7);
	
	String deliveryStatus = "In Progress";
	%> --%>

</body>
</html>