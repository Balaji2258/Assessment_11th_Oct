package com.perfios.test.oct11.testing;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.SQLException;
import java.time.LocalDate;

import org.junit.jupiter.api.Test;

import com.perfios.test.oct11.pojo.CourierDetails;
import com.perfios.test.oct11.service.CourierService;

public class CourierTest {
	
	@Test
	public void addCourierTest() throws SQLException {
		CourierDetails details = new CourierDetails("Shikhar", "delhi", 8564231796L, "kolkata", 9596321458L, 1255.0, 238.75, 1, 156324789, LocalDate.now(), LocalDate.now().plusDays(5), "Processing");
		assertEquals(1, CourierService.addCourier(details));
	}
	
	@Test
	public void getPayableTest() {
		assertEquals(50, CourierService.getPayableAmount(499));
	}
	
	@Test
	public void getPayableTest2() {
		assertEquals(50+(950*0.25), CourierService.getPayableAmount(1450));
	}

}
