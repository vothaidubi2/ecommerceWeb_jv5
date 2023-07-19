package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.entities.Product;
import com.entities.Productsize;

public interface ProductSizeDAO extends JpaRepository<Productsize, Integer>{
	List<Productsize> findByProduct(Product product);
}
