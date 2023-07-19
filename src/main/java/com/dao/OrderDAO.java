package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.entities.Orders;

public interface OrderDAO extends JpaRepository<Orders, Integer>{
	List<Orders> findByInvoiceId(Integer id);
	@Query(value = "SELECT sum(quantity*price) FROM orders where invoiceid=?1",nativeQuery = true)
	Double getAmount(Integer id);
	List<Orders> findByProductId(Integer id);
}
