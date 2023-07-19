package com.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.CategoryDAO;
import com.dao.CookieService;
import com.dao.ParamService;
import com.dao.ProductColorDAO;
import com.dao.ProductSizeDAO;
import com.dao.Product_DAO;
import com.dao.SessionService;
import com.entities.Category;
import com.entities.Product;
import com.entities.Productcolor;
import com.entities.Productsize;

@Controller
public class ShopController {
	@Autowired
	Product_DAO pd_dao;
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	CategoryDAO cate;
	@Autowired
	ProductSizeDAO pdsize;
	@Autowired
	ProductColorDAO pdcolor;

	@GetMapping("/shop")
	public String shop(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("rangemin") Optional<Double> min, @RequestParam("rangemax") Optional<Double> max,
			@RequestParam("page") Optional<Integer> p, @RequestParam("orderby") Optional<String> order,
			@RequestParam("categoryid") Optional<Integer> inputcate) {
		if (sessionService.get("minPrice") == null) {
			sessionService.set("minPrice", Double.MIN_VALUE);
			sessionService.set("maxPrice", Double.MAX_VALUE);
		}
		if (sessionService.get("inputcategory") == null) {
			sessionService.set("inputcategory", 0);
		}
		String sorting = order.orElse(sessionService.get("order", ""));
		String keywords = kw.orElse(sessionService.get("keywords", ""));
		int inputcategory = inputcate.orElse(sessionService.get("inputcategory"));
		double minPrice = min.orElse(sessionService.get("minPrice"));
		double maxPrice = max.orElse(sessionService.get("maxPrice"));
		sessionService.set("minPrice", minPrice);
		sessionService.set("maxPrice", maxPrice);
		sessionService.set("keywords", keywords);
		sessionService.set("inputcategory", inputcategory);
		sessionService.set("pathInfo", "shop");
		sessionService.set("order", sorting);
		Pageable pageable = PageRequest.of(p.orElse(0), 3);
		Page<Product> page = pd_dao.findAllByNameLikeAndPriceBetweenAndCategoryIdAndStatus("%" + keywords + "%", minPrice,
				maxPrice, inputcategory,true, pageable);
		if (sorting != null) {
			if (inputcategory < 1) {
				Sort sort = Sort.by(setSorting(sorting), "price");
				pageable = PageRequest.of(p.orElse(0), 3, sort);
				page = pd_dao.findAllByNameLikeAndPriceBetweenAndStatus("%" + keywords + "%", minPrice, maxPrice,true, pageable);
				model.addAttribute("listProduct", page);
			} else {
				Sort sort = Sort.by(setSorting(sorting), "price");
				pageable = PageRequest.of(p.orElse(0), 3, sort);
				page = pd_dao.findAllByNameLikeAndPriceBetweenAndCategoryIdAndStatus("%" + keywords + "%", minPrice, maxPrice,
						inputcategory,true, pageable);
				model.addAttribute("listProduct", page);
			}

		} else {
			if (inputcategory < 1) {
				pageable = PageRequest.of(p.orElse(0), 3);
				page = pd_dao.findAllByNameLikeAndPriceBetweenAndStatus("%" + keywords + "%", minPrice, maxPrice,true, pageable);
				model.addAttribute("listProduct", page);
			} else {
				pageable = PageRequest.of(p.orElse(0), 3);
				page = pd_dao.findAllByNameLikeAndPriceBetweenAndCategoryIdAndStatus("%" + keywords + "%", minPrice, maxPrice,
						inputcategory,true, pageable);
				model.addAttribute("listProduct", page);
			}
		}
		return "shop";
	}

	public Direction setSorting(String input) {
		if (input.equals("asc")) {
			return Direction.ASC;
		} else {
			return Direction.DESC;
		}
	}

	@RequestMapping(value = "/shop/detail/{id}")
	public String shopdetail(Model model, @PathVariable("id") Integer id) {
		sessionService.set("pathInfo", "shop");
		Product product = pd_dao.findById(id).get();
		List<Productsize> listSize = pdsize.findByProduct(product);
		List<Productcolor> listColor = pdcolor.findByProduct(product);
		model.addAttribute("listSize", listSize);
		model.addAttribute("listColor", listColor);
		model.addAttribute("Product", product);
		return "detail";
	}

	@ModelAttribute("category")
	public List<Category> listCate() {
		List<Category> list = cate.findAll();
		return list;
	}

}
