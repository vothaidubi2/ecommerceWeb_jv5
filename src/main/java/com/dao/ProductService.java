package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entities.Product;

@Service
public class ProductService {
	@Autowired
	Product_DAO pd;


	public Product createProduct(Product product) {
		return pd.save(product);
	}
}