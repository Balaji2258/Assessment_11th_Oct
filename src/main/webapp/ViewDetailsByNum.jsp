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
<title>Apex Courier - View</title>
<link rel="stylesheet" href="css/welcomeStyle.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap');
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
	
	.container table {
	    margin-right: auto;
	    background: rgb(63, 62, 62);
	    color: #F6C7A1;
	    margin-top: 12%;
	    margin-left: auto;
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
		padding-left: 100px;
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
		CourierDetails details = CourierService.getDetails(shipmentTrackingNumber);
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
					<li><a href="Home.jsp">Home</a></li><li class="line">&nbsp;</li>
					<li><a href="Profile.jsp">Profile</a></li><li class="line">&nbsp;</li>
					<li><a href="Withdraw.jsp">Withdraw</a></li><li class="line">&nbsp;</li>
					<li><a href="LoginUser.html">Admin Login</a></li>
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
			<form method="post">
			<table class = "reg">
				<tr>
					<th colspan=2 align="center" class="tabhead">DETAILS : <%= shipmentTrackingNumber %></th>
				</tr>
				
				<tr>
					<td class="nc">Sender Name<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getCustomerName() %></td>
				</tr>
				
				<tr>
					<td class="nc">Sender City<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getFromCity() %></td>
				</tr>
				
				<tr>
					<td class="nc">Sender Contact<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getSenderMobile() %></td>
				</tr>
				
				<tr>
					<td class="nc">Receiver City<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getToCity() %></td>
				</tr>
				
				<tr>
					<td class="nc">Receiver Contact<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getReceiverMobile() %></td>
				</tr>
				
				<tr>
					<td class="nc">Amount Paid<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getAmount() %></td>
				</tr>
				
				<tr>
					<td class="nc">Shipment Date<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getShipmentDate() %></td>
				</tr>
				
				<tr>
					<td class="nc">Expected Delivery Date<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getDeliveryDate() %></td>
				</tr>
				
				<tr>
					<td class="nc">Delivery Status<span class="error">*</span>&nbsp;&nbsp;&nbsp;&nbsp;</td>
					<td class="nc"><%= details.getDeliveryStatus() %></td>
				</tr>
				
			</table>
			</form>
		</div>
	</div>

</body>
</html>