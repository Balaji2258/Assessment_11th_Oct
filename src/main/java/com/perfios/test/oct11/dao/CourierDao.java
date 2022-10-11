package com.perfios.test.oct11.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.perfios.test.oct11.connection.DBConnection;
import com.perfios.test.oct11.pojo.CourierDetails;

public class CourierDao {
	
	public static int saveCourier(CourierDetails details) throws SQLException {
		
		Connection con = DBConnection.getConnection();
		
		String sql = "insert into details (customerName, fromCity, senderMobile, toCity, receiverMobile, packetWt, amount, "
				+ "shipmentTrackingNumber, shipmentDate, deliveryDate, deliveryStatus) "
				+ "values (?,?,?,?,?,?,?,?,?,?,?);";
		
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, details.getCustomerName());
		stmt.setString(2, details.getFromCity());
		stmt.setLong(3, details.getSenderMobile());
		stmt.setString(4, details.getToCity());
		stmt.setLong(5, details.getReceiverMobile());
		stmt.setDouble(6, details.getPacketWt());
		stmt.setDouble(7, details.getAmount());
		stmt.setInt(8, details.getShipmentTrackingNumber());
		stmt.setString(9, details.getShipmentDate());
		stmt.setString(10, details.getDeliveryDate());
		stmt.setString(11, details.getDeliveryStatus());
		
		int ret = stmt.executeUpdate();
		
		stmt.close();
		con.close();
		
		return ret;
		
	}
	
	public static CourierDetails getDetails(int shipmentTrackingNumber) throws SQLException {
		Connection con = DBConnection.getConnection();
		Statement stmt = con.createStatement();
		String sql = "select * from details where shipmentTrackingNumber = " + shipmentTrackingNumber;
		ResultSet rs = stmt.executeQuery(sql);
		CourierDetails details = new CourierDetails();
		if(rs.next()) {
			details.setCustomerName(rs.getString("customerName"));
			details.setFromCity(rs.getString("fromCity"));
			details.setSenderMobile(rs.getLong("senderMobile"));
			details.setToCity(rs.getString("toCity"));
			details.setReceiverMobile(rs.getLong("receiverMobile"));
			details.setPacketWt(rs.getDouble("packetWt"));
			details.setAmount(rs.getDouble("amount"));
			details.setPaymentStatus(rs.getInt("paymentStatus"));
			details.setShipmentTrackingNumber(rs.getInt("shipmentTrackingNumber"));
			details.setShipmentDate(LocalDate.parse(rs.getString("shipmentDate")));
			details.setDeliveryDate(LocalDate.parse(rs.getString("deliveryDate")));
			details.setDeliveryStatus(rs.getString("deliveryStatus"));
		}
		stmt.close();
		con.close();
		return details;
	}
	
	public static List<CourierDetails> getAllDetails() throws SQLException {
		Connection con = DBConnection.getConnection();
		Statement stmt = con.createStatement();
		String sql = "select * from details;";
		ResultSet rs = stmt.executeQuery(sql);
		List<CourierDetails> allDetails = new ArrayList();
		
		while(rs.next()) {
			CourierDetails details = new CourierDetails();
			details.setCustomerName(rs.getString("customerName"));
			details.setFromCity(rs.getString("fromCity"));
			details.setSenderMobile(rs.getLong("senderMobile"));
			details.setToCity(rs.getString("toCity"));
			details.setReceiverMobile(rs.getLong("receiverMobile"));
			details.setPacketWt(rs.getDouble("packetWt"));
			details.setAmount(rs.getDouble("amount"));
			details.setPaymentStatus(rs.getInt("paymentStatus"));
			details.setShipmentTrackingNumber(rs.getInt("shipmentTrackingNumber"));
			details.setShipmentDate(LocalDate.parse(rs.getString("shipmentDate")));
			details.setDeliveryDate(LocalDate.parse(rs.getString("deliveryDate")));
			details.setDeliveryStatus(rs.getString("deliveryStatus"));
			allDetails.add(details);
		}
		stmt.close();
		con.close();
		return allDetails;
	}
	
	public static void markDelivered(int shipmentTrackingNumber) throws SQLException {
		Connection con = DBConnection.getConnection();
		Statement stmt = con.createStatement();
		String sql = "update details set deliveryStatus = 'Delivered' where shipmentTrackingNumber = " + shipmentTrackingNumber;
		stmt.execute(sql);
	}

}
