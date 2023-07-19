package com.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.entities.Category;
import com.entities.Product;

public interface Product_DAO extends JpaRepository<Product, Integer> {
	List<Product> findByStatus(Boolean status);
	Page<Product> findAllByNameLikeAndPriceBetweenAndStatus(String keywords,double minPrice, double maxPrice,Boolean status, Pageable pageable);
	Page<Product> findAllByNameLikeAndPriceBetweenAndCategoryIdAndStatus(String keywords,double minPrice, double maxPrice,Integer category,Boolean status, Pageable pageable);
}
