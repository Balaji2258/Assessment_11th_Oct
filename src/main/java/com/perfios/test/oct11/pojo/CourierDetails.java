package com.perfios.test.oct11.pojo;

import java.time.LocalDate;
import java.util.Date;

public class CourierDetails {
	
	public String customerName;
	public String fromCity;
	public Long senderMobile;
	public String toCity;
	public Long receiverMobile;
	public Double packetWt;
	public Double amount;
	public Integer paymentStatus;
	public Integer shipmentTrackingNumber;
	public LocalDate shipmentDate;
	public LocalDate deliveryDate;
	public String deliveryStatus;
	
	public CourierDetails() {
		super();
	}

	public CourierDetails(String customerName, String fromCity, Long senderMobile, String toCity, Long receiverMobile,
			Double packetWt, Double amount, Integer paymentStatus, Integer shipmentTrackingNumber, LocalDate shipmentDate, LocalDate deliveryDate,
			String deliveryStatus) {
		super();
		this.customerName = customerName;
		this.fromCity = fromCity;
		this.senderMobile = senderMobile;
		this.toCity = toCity;
		this.receiverMobile = receiverMobile;
		this.packetWt = packetWt;
		this.amount = amount;
		this.paymentStatus = paymentStatus;
		this.shipmentTrackingNumber = shipmentTrackingNumber;
		this.shipmentDate = shipmentDate;
		this.deliveryDate = deliveryDate;
		this.deliveryStatus = deliveryStatus;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getFromCity() {
		return fromCity;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	public Long getSenderMobile() {
		return senderMobile;
	}

	public void setSenderMobile(Long senderMobile) {
		this.senderMobile = senderMobile;
	}

	public String getToCity() {
		return toCity;
	}

	public void setToCity(String toCity) {
		this.toCity = toCity;
	}

	public Long getReceiverMobile() {
		return receiverMobile;
	}

	public void setReceiverMobile(Long receiverMobile) {
		this.receiverMobile = receiverMobile;
	}

	public Double getPacketWt() {
		return packetWt;
	}

	public void setPacketWt(Double packetWt) {
		this.packetWt = packetWt;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	public Integer getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(Integer paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Integer getShipmentTrackingNumber() {
		return shipmentTrackingNumber;
	}

	public void setShipmentTrackingNumber(Integer shipmentTrackingNumber) {
		this.shipmentTrackingNumber = shipmentTrackingNumber;
	}

	public String getShipmentDate() {
		return shipmentDate.toString();
	}

	public void setShipmentDate(LocalDate shipmentDate) {
		this.shipmentDate = shipmentDate;
	}

	public String getDeliveryDate() {
		return deliveryDate.toString();
	}

	public void setDeliveryDate(LocalDate deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

}
