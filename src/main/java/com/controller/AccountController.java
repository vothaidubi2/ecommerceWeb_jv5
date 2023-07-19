package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.Account_DAO;
import com.dao.CookieService;
import com.dao.ParamService;
import com.dao.SessionService;
import com.entities.Account;

@Controller
public class AccountController {

	@Autowired
	Account_DAO acc;
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;

	@GetMapping("/account/login")
	public String login1() {
		return "user/login";
	}

//	@PostMapping("/account/login")
//	public String login2(Model model, @ModelAttribute("username") String username,
//			@ModelAttribute("password") String password) {
//		if (acc.findByUsernamePassword(username, password).size() > 0) {
//			Account temp = acc.findByUsernamePassword(username, password).get(0);
//			model.addAttribute("uid", temp.getUsername());
//			model.addAttribute("pwd", temp.getPassword());
//			return "redirect:/account/info";
//		}
//		model.addAttribute("errorlogin", true);
//		return "user/login";
//	}

	@PostMapping("/account/login")
	public String login2(Model model,HttpSession session) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		boolean remember = paramService.getBoolean("remember", false);
		System.out.print(remember);
		if (acc.findByUsernamePassword(username, password).size() > 0) {
			session.setAttribute("currentuser", acc.findByUsernamePassword(username, password).get(0));
			session.setAttribute("currentid", acc.findByUsernamePassword(username, password).get(0).getId());
			session.setAttribute("currentrole", acc.findByUsernamePassword(username, password).get(0).getRole());
//			Account temp = acc.findByUsernamePassword(username, password).get(0);
//			if (remember == true) {
//				cookieService.add("username", username, 10);
//			} else {
//				cookieService.remove("username");
//			}
			return "redirect:/index";
		}
		model.addAttribute("errorlogin", true);
		return "user/login";
	}
	@RequestMapping("/account/logout")
	public String logout(HttpSession usesession) {
		usesession.removeAttribute("currentuser");
		usesession.removeAttribute("currentid");
		usesession.removeAttribute("currentrole");
		return "redirect:/account/login";
	}
}
