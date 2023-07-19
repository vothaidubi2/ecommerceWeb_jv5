package com.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.MailerService;


@Controller
public class AdminMailerController {
	@Autowired
	MailerService mailer;
	@GetMapping("/admin/send-email")
	public String view() {
		return "admin/sendemail";
	}

	@PostMapping("/admin/send-email")
	public String sendModelMap(Model model, @RequestParam("to") String to,
			@RequestParam("subject") String subject, @RequestParam("body") String body) {
		try{
			String input = to;
			String[] result = input.split(",");
			for (String s : result) {
				System.out.println("result: "+s);
				mailer.queue(s, subject, body);
			}
			model.addAttribute("message", "Gửi email thành công !");
		}catch (Exception e) {
			model.addAttribute("message", "Gửi email thất bại !");
		}
		return "admin/sendemail";
	}
}
