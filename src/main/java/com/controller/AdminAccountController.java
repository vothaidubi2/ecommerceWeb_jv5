package com.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.Account_DAO;
import com.entities.Account;

@Controller
public class AdminAccountController {
	@Autowired
	Account_DAO acc;

	@GetMapping("/admin/accountmanage")
	public String view(Model model) {
		List<Account> listaccount = acc.findAll();
		model.addAttribute("listaccount",listaccount);
		
		return "admin/account";
	}
	@GetMapping("/admin/addaccount")
	public String formaccount(Model model) {
		return "admin/formaccount";
	}
	@ModelAttribute("addaccount")
	public Account loadEmptyModelBean() {
		return new Account();
	}
	@PostMapping("/admin/addaccount")
	public String addaccount(ModelMap model, @Valid @ModelAttribute("addaccount") Account account, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "some fields are not valid. Please fix them!");
		} else {
			if(!acc.findByEmail(account.getEmail()).isEmpty()) {
				model.addAttribute("erroremail","Email đã tồn tại!!!");
				return "admin/formaccount";
			}
			if(!acc.findByUsername(account.getUsername()).isEmpty()) {
				model.addAttribute("errorusername","Username đã tồn tại!!!");
				return "admin/formaccount";
			}
			acc.save(account);
			return "redirect:/admin/accountmanage";
		}
		return "admin/formaccount";
	}
	@RequestMapping("/admin/editaccount/{id}")
	public String editaccount(Model model, @PathVariable("id") Integer id) {
		Account item = acc.findById(id).get();
		model.addAttribute("addaccount",item);
		return  "admin/formaccount";
	}
	@PostMapping("/admin/updateaccount/{id}")
	public String updateaccount(ModelMap model, @Valid @ModelAttribute("addaccount") Account account, BindingResult errors, @PathVariable("id") Integer id) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "some fields are not valid. Please fix them!");
		} else {
			
			account.setId(id);
			acc.save(account);
			return "redirect:/admin/accountmanage";
		}
		return "admin/formaccount";
	}
	@RequestMapping("/admin/deleteaccount/{id}")
	public String create(@PathVariable("id") Integer id) {
		acc.deleteById(id);
		return "redirect:/admin/accountmanage";
	}
}
