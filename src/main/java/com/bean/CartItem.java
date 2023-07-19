package com.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
	Integer id;
	Integer productid;
	String name;
	double price;
	int quantity;
	String image;
	String size;
	String color;
}
