package com.controller;

import java.time.LocalDateTime;
import java.time.temporal.ChronoField;

import javax.persistence.criteria.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.CartItem;
import com.dao.OrderDAO;
import com.dao.ParamService;
import com.dao.Product_DAO;
import com.dao.SessionService;
import com.dao.ShoppingCartService;
import com.entities.Orders;
import com.entities.Product;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	ShoppingCartService cart;
	@Autowired
	ParamService param;

	@Autowired
	SessionService sess;
	@Autowired
	Product_DAO pd;

	@RequestMapping("/view")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("amount",cart.getAmount());
		sess.set("pathInfo", "");
		return "/cart";
	}

	@RequestMapping("/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		String size = param.getString("inputSize", "XL");
		String color = param.getString("inputColor", "White");
		Integer quantity = Integer.parseInt(param.getString("inputQuantity", "1"));
		cart.add(id,size,color,quantity);
		sess.set("countCart", cart.getCount());
		return "redirect:/cart/view";
	}

	@RequestMapping("/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		sess.set("countCart", cart.getCount());
		return "redirect:/cart/view";
	}

	@RequestMapping("/update")
	public String update() {
		Integer id = param.getInt("id", 0);
		int quantity = param.getInt("quantity", 0);
		cart.update(id, quantity);
		return "redirect:/cart/view";
	}

	@RequestMapping("/clear")
	public String clear() {
		cart.clear();
		sess.set("countCart", cart.getCount());
		return "redirect:/cart/view";
	}
}
