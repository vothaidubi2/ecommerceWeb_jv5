package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.CategoryDAO;
import com.entities.Category;

@Controller
public class AdminCategory {
	@Autowired
	CategoryDAO cate;

	@GetMapping("/admin/categorymanage")
	public String index(Model model) {
		model.addAttribute("listCate", cate.findAll());
		return "/admin/category";
	}

	@RequestMapping("/admin/addcategory")
	public String create(@ModelAttribute("nameCate") String name) {
		Category catetemp = new Category();
		catetemp.setName(name);
		cate.save(catetemp);
		return "redirect:/admin/categorymanage";
	}

	@RequestMapping("/admin/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Category item = cate.findById(id).get();
		model.addAttribute("item", item);
		model.addAttribute("listCate", cate.findAll());
		return "/admin/category";
	}

	@RequestMapping("/admin/updatecategory/{id}")
	public String update(@ModelAttribute("nameCate") String name, @PathVariable("id") Integer id) {
		Category catetemp = new Category();
		catetemp.setId(id);
		catetemp.setName(name);
		cate.save(catetemp);
		return "redirect:/admin/categorymanage";
	}

	@RequestMapping("/admin/category/delete/{id}")
	public String create(@PathVariable("id") Integer id) {
		cate.deleteById(id);
		return "redirect:/admin/categorymanage";
	}
}
