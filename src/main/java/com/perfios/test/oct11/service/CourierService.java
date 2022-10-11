package com.perfios.test.oct11.service;

import java.sql.SQLException;
import java.util.List;

import com.perfios.test.oct11.dao.CourierDao;
import com.perfios.test.oct11.pojo.CourierDetails;

public class CourierService {
	
	public static double getPayableAmount(double weight) {
		double amount = 50;
		if(weight < 500) {
			return amount;
		}
		else {
			return amount + (weight - 500) * 0.25;
		}
	}
	
	public static CourierDetails getDetails(int shipmentTrackingNumber) throws SQLException {
		return CourierDao.getDetails(shipmentTrackingNumber);
	}
	
	public static List<CourierDetails> getAllDetails() throws SQLException {
		return CourierDao.getAllDetails();
	}
	
	public static void markDelivered(int shipmentTrackingNumber) throws SQLException {
		CourierDao.markDelivered(shipmentTrackingNumber);
	}

}
