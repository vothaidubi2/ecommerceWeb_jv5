package com.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.Account_DAO;
import com.dao.SessionService;
import com.entities.Account;
import com.service.MailerService;

@Controller
public class ForgotPasswordController {
	@Autowired
	Account_DAO acc;
	@Autowired
	SessionService session;
	@Autowired
	MailerService mailer;

	@GetMapping("/account/forgot-password")
	public String view() {
		return "user/forgotpassword";
	}

	@GetMapping("/account/otp-confirm")
	public String otp() {
		return "user/otpform";
	}

	@GetMapping("/account/change-password")
	public String changepassword() {
		return "user/changepassword";
	}

	@PostMapping("/account/forgot-password")
	public String confirm(Model model, @RequestParam("username") String username) {
		if (acc.findByUsername(username).isEmpty()) {
			model.addAttribute("error1", "Username không tồn tại!!!");
			return "/user/forgotpassword";
		}
		Account temp = acc.findByUsername(username).get();
		int random = new Random().nextInt(900000) + 100000;
		session.set("random", random);
		session.set("changeuser", temp.getUsername());
		try {
			mailer.send(temp.getEmail(), "Reset Password", "Your Otp code is: "+random);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:/account/otp-confirm";
	}

	@PostMapping("/account/otp-confirm")
	public String otppost(Model model, @RequestParam("otp") String otp) {
		String getotp = session.get("random").toString();
		if(!getotp.equals(otp)) {
			model.addAttribute("error2","Otp không chính xác!!!");
			return "user/otpform";
		}
		return "redirect:/account/change-password";
	}
	@PostMapping("/account/change-password")
	public String change(Model model,@RequestParam("password") String password,@RequestParam("confirmpassword") String confirm) {
		if(!password.equals(confirm)) {
			model.addAttribute("error3","Vui lòng xác nhận lại mật khẩu!!!");
			return "user/changepassword";
		}
		String getuser = session.get("changeuser").toString();
		Account temp = acc.findByUsername(getuser).get();
		temp.setPassword(password);
		acc.save(temp);
		return "redirect:/account/login";
	}
}
