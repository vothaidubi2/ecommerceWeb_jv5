package com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dao.Account_DAO;
import com.dao.InvoiceDAO;
import com.dao.OrderDAO;
import com.dao.Product_DAO;
import com.entities.Invoice;
import com.entities.Orders;
import com.service.CanvasjsChartService;

@Controller
public class AdminHomeController {
	@Autowired
	Account_DAO acc;
	@Autowired
	Product_DAO pd;
	@Autowired
	InvoiceDAO invoice;
	@Autowired
	OrderDAO orders;
	@Autowired
	CanvasjsChartService canvasjsChartService;

	@GetMapping("/admin/dashboard")
	public String index(Model model,ModelMap modelMap) {
		model.addAttribute("account", acc.count());
		model.addAttribute("product", pd.count());
		model.addAttribute("invoice", invoice.findByDate().size());
		double totalmoney = 0;
		for (Invoice temp : invoice.findIdbyDate()) {
			for (Orders ordertemp : orders.findByInvoiceId(temp.getId())) {
				totalmoney += (ordertemp.getQuantity() * ordertemp.getPrice());
			}
		}
		model.addAttribute("totalmoney", totalmoney);
		List<List<Map<Object, Object>>> canvasjsDataList = canvasjsChartService.getCanvasjsChartData();
		modelMap.addAttribute("dataPointsList", canvasjsDataList);
		return "/admin/index";
	}
}
