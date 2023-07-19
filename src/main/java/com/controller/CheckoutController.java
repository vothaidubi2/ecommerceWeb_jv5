package com.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bean.CartItem;
import com.dao.Account_DAO;
import com.dao.InvoiceDAO;
import com.dao.OrderDAO;
import com.dao.Product_DAO;
import com.dao.SessionService;
import com.dao.ShoppingCartService;
import com.entities.Account;
import com.entities.Invoice;
import com.entities.Orders;

@Controller
public class CheckoutController {
	@Autowired
	Account_DAO acc;
	@Autowired
	SessionService session;
	@Autowired
	ShoppingCartService cart;
	@Autowired
	InvoiceDAO invoice;
	@Autowired
	OrderDAO orders;
	@Autowired
	Product_DAO pd;

	@GetMapping("/checkout")
	public String checkout(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("amount", cart.getAmount());
		return "checkout";
	}

	@PostMapping("/checkout")
	public String postcheckout(@ModelAttribute("inputphone") String phone,
			@ModelAttribute("inputaddress") String address,Model model) {
		Invoice temp = new Invoice();
		Account acctemp = session.get("currentuser");
		temp.setAccount(acc.findById(acctemp.getId()).get());
		temp.setPhonenumber(phone);
		temp.setAddress(address);
		temp.setStatus(false);
		temp.setDatecreate(new Date());
		invoice.save(temp);
		Sort sort = Sort.by(Direction.DESC, "id");
		Invoice currentInvoice = invoice.findAll(sort).get(0);
		for (CartItem order : cart.getItems()) {
			Orders newOrder = new Orders();
			newOrder.setProduct(pd.findById(order.getProductid()).get());
			newOrder.setInvoice(currentInvoice);
			newOrder.setPrice(order.getPrice());
			newOrder.setQuantity(order.getQuantity());
			newOrder.setColor(order.getColor());
			newOrder.setSize(order.getSize());
			orders.save(newOrder);
		}
		return "redirect:/cart/order-history";
	}
}
