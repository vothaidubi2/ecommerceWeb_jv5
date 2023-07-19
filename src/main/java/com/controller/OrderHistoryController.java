package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.Account_DAO;
import com.dao.InvoiceDAO;
import com.dao.OrderDAO;
import com.dao.ParamService;
import com.dao.SessionService;
import com.entities.Account;
import com.entities.Invoice;
import com.entities.Orders;

@Controller
public class OrderHistoryController {
	@Autowired
	Account_DAO acc;

	@Autowired
	InvoiceDAO invoice;

	@Autowired
	OrderDAO order;

	@Autowired
	ParamService param;

	@Autowired
	SessionService sess;

	@GetMapping("/cart/order-history")
	public String view(Model model) {
		Account accounttemp = acc.findById(Integer.parseInt(sess.get("currentid").toString())).get();
//		Invoice temp = invoice.findByAccountId(accounttemp.getId()).get();
		Sort sort = Sort.by(Direction.DESC,"datecreate");
		List<Invoice> orders = invoice.findByAccountId(accounttemp.getId(),sort);
		model.addAttribute("invoice", orders);
		return "user/orderhistory";
	}

	@GetMapping("/cart/order-history/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Invoice temp = invoice.findById(id).get();
		List<Orders> orders = order.findByInvoiceId(id);
		model.addAttribute("invoice", temp);
		model.addAttribute("orders", orders);
		model.addAttribute("amount", order.getAmount(id));
		return "user/orderhistory-detail";
	}

	@RequestMapping("/cart/order-history/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		List<Orders> orders = order.findByInvoiceId(id);
		for (Orders orders2 : orders) {
			order.deleteById(orders2.getId());
		}
		invoice.deleteById(id);
		return "user/orderhistory";
	}
}
