package com.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.entities.Product;
import com.entities.Productcolor;

public interface ProductColorDAO extends JpaRepository<Productcolor, Integer>{
	List<Productcolor> findByProduct(Product product);

}
