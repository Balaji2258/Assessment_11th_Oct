<%@page import="com.perfios.test.oct11.pojo.CourierDetails"%>
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
<title>Apex Courier - Pay</title>
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

	<%
		int shipmentTrackingNumber = Integer.parseInt(request.getParameter("shipmentTrackingNumber"));
		double payable = Double.parseDouble(request.getParameter("payable"));
	%>
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
			<!-- <div class="login_img">
				<img src="images/login.jpeg" alt="Login">
			</div> -->
			<form action="ViewDetails.jsp?shipmentTrackingNumber=<%= shipmentTrackingNumber %>" method="post" name="registerForm">
			<table class = "reg">
				<tr>
					<th colspan=2 align="center" class="tabhead">PAYMENT DETAILS</th>
				</tr>
				
				<tr>
					<td class="nc">Shipment Tracking Number<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="number" id="stn" name="stn" readonly="readonly" value="<%= shipmentTrackingNumber %>"></td>
				</tr>
				
				<tr>
					<td class="nc">Payable Amount<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td><input type="number" id="pamt" name="pamt" readonly="readonly" value="<%= payable %>"></td>
				</tr>
				
				<tr><td colspan="2" align="center"><br><input type="submit" class="btn" value="MARK AS PAID"/></td></tr>
			</table>
			</form>
		</div>
	</div>

</body>
</html>