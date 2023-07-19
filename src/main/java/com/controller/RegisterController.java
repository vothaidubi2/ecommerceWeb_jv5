package com.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.dao.Account_DAO;
import com.entities.Account;

@Controller
public class RegisterController {
	@Autowired
	Account_DAO acc;

	@GetMapping("/account/register")
	public String signup() {
		return "user/register";
	}

	@ModelAttribute("register")
	public Account loadEmptyModelBean() {
		return new Account();
	}

	@PostMapping("/account/register")
	public String add(@Valid @ModelAttribute("register") Account account, BindingResult errors,Model model) {
		if (!errors.hasErrors()) {
			if(!acc.findByEmail(account.getEmail()).isEmpty()) {
				model.addAttribute("erroremail","Email đã tồn tại!!!");
				return "user/register";
			}
			if(!acc.findByUsername(account.getUsername()).isEmpty()) {
				model.addAttribute("errorusername","Username đã tồn tại!!!");
				return "user/register";
			}
			account.setRole(0);
			acc.save(account);
			return "redirect:/account/login";
		}
		return "user/register";
	}
}
