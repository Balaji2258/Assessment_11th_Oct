package com.perfios.test.oct11.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.perfios.test.oct11.dao.CourierDao;
import com.perfios.test.oct11.pojo.CourierDetails;
import com.perfios.test.oct11.service.CourierService;

@WebServlet("/Add")
public class Add extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String senderName = request.getParameter("sname");
			
			String fromCity = request.getParameter("scity");
			
			String smob = request.getParameter("sphone");
			
			Long senderMobile = 0L;
			if(smob != "" && smob != null)
				senderMobile = Long.parseLong(smob);
			
			String toCity = request.getParameter("rcity");
			String rmob = request.getParameter("rphone");
			
			Long receiverMobile = 0L;
			if(rmob != "" && rmob != null)
				receiverMobile = Long.parseLong(rmob);
			
			String pwt = request.getParameter("pweight");
			
			Double packetWt = 0.0;
			if(pwt != "" && pwt != null)
				packetWt = Double.parseDouble(pwt);
			
			Double amount = CourierService.getPayableAmount(packetWt);
			
			Integer paymentStatus = 0;
			
			Integer shipmentTrackingNumber = new Random().nextInt(1000000000); 
			
			LocalDate shipmentDate = LocalDate.now();
			
			LocalDate deliveryDate = LocalDate.now().plusDays(7);
			
			String deliveryStatus = "Processing";
			
			CourierDetails details = new CourierDetails(senderName, fromCity, senderMobile, toCity, receiverMobile, packetWt, amount, paymentStatus, shipmentTrackingNumber, shipmentDate, deliveryDate, deliveryStatus);
			
			CourierDao.saveCourier(details);
			
			response.sendRedirect("Payment.jsp?shipmentTrackingNumber=" + shipmentTrackingNumber + "&payable=" + amount);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
