package com.perfios.test.oct11.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.perfios.test.oct11.service.CourierService;

@WebServlet("/MarkDelivered")
public class MarkDelivered extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int shipmentTrackingNumber = Integer.parseInt(request.getParameter("shipmentTrackingNumber"));  
		try {
			CourierService.markDelivered(shipmentTrackingNumber);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("ViewAllDetails.jsp");
	}

}
