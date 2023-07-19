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

import com.dao.InvoiceDAO;
import com.entities.Invoice;

@Controller
public class AdminOrdersController {
	@Autowired
	InvoiceDAO invoice;

	@GetMapping("/admin/orders")
	public String view(Model model) {
		Sort sort = Sort.by(Direction.DESC,"datecreate");
		List<Invoice> listorders = invoice.findAll(sort);
		model.addAttribute("listorders", listorders);
		return "admin/orders";
	}

	@RequestMapping("/admin/confirmorders/{id}")
	public String confirm(@PathVariable("id") Integer id) {
		Invoice temp = invoice.findById(id).get();
		temp.setStatus(true);
		invoice.save(temp);
		return "redirect:/admin/orders";
	}
}
