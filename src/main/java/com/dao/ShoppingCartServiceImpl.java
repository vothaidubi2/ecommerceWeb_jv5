package com.dao;

import java.time.LocalDateTime;
import java.time.temporal.ChronoField;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.bean.CartItem;
import com.entities.Product;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	@Autowired
	Product_DAO pd;
	Map<Integer, CartItem> map = new HashMap<>();

	@Override
	public void add(Integer productid, String size, String color, Integer quantity) {
		System.out.println("count:" + map.size());
		System.out.println("value:" + map.values());
		CartItem newItem = new CartItem();
		LocalDateTime now = LocalDateTime.now();
		int millis = now.get(ChronoField.MILLI_OF_SECOND);
		int tempId = millis;
		if (map.values().isEmpty()) {
			Product temp = pd.findById(productid).get();
			newItem.setId(tempId);
			newItem.setProductid(productid);
			newItem.setName(temp.getName());
			newItem.setPrice(temp.getPrice());
			newItem.setImage(temp.getImage());
			newItem.setQuantity(quantity);
			newItem.setSize(size);
			newItem.setColor(color);
			map.put(tempId, newItem);
			return;
		}
		for (CartItem item : map.values()) {
			if (item.getProductid().equals(productid)) {
				if (item.getSize().equals(size) && item.getColor().equals(color)) {
					item.setQuantity(item.getQuantity() + quantity);
					map.replace(item.getId(), item);
					return;
				}
			}
		}
		for (CartItem item : map.values()) {
			if (item.getProductid().equals(productid)) {
				if (!item.getSize().equals(size) || !item.getColor().equals(color)) {
					Product temp = pd.findById(productid).get();
					newItem.setId(tempId);
					newItem.setProductid(productid);
					newItem.setName(temp.getName());
					newItem.setPrice(temp.getPrice());
					newItem.setImage(temp.getImage());
					newItem.setQuantity(quantity);
					newItem.setSize(size);
					newItem.setColor(color);
					map.put(tempId, newItem);
					return;
				}
			}
		}
		for (CartItem item : map.values()) {
			if (!item.getProductid().equals(productid)) {
				Product temp = pd.findById(productid).get();
				newItem.setId(tempId);
				newItem.setProductid(productid);
				newItem.setName(temp.getName());
				newItem.setPrice(temp.getPrice());
				newItem.setImage(temp.getImage());
				newItem.setQuantity(quantity);
				newItem.setSize(size);
				newItem.setColor(color);
				map.put(tempId, newItem);
				return;
			}
		}

	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public CartItem update(Integer id, int quantity) {
		CartItem item = map.get(id);
		item.setQuantity(quantity);
		return item;
	}

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<CartItem> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item -> item.getQuantity()).sum();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
	}
}
