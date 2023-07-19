package com.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.dao.CategoryDAO;
import com.dao.ColorDAO;
import com.dao.ParamService;
import com.dao.ProductColorDAO;
import com.dao.ProductSizeDAO;
import com.dao.Product_DAO;
import com.dao.SizeDAO;
import com.entities.Color;
import com.entities.Product;
import com.entities.Productcolor;
import com.entities.Productsize;
import com.entities.Size;

@Controller
public class AdminProduct {
	@Autowired
	HttpServletRequest request;
	@Autowired
	ParamService param;
	@Autowired
	Product_DAO pd;
	@Autowired
	ColorDAO cl;
	@Autowired
	SizeDAO size;
	@Autowired
	CategoryDAO cate;
	@Autowired
	ProductColorDAO pdColor;
	@Autowired
	ProductSizeDAO pdSize;

	@GetMapping("/admin/productmanage")
	public String index(Model model) {
		model.addAttribute("itemsPD", pd.findByStatus(true));
		return "/admin/product";
	}

	@GetMapping("/admin/addproduct")
	public String addpd() {
		return "/admin/formProduct";
	}

	@ModelAttribute("addproduct")
	public Product loadEmptyModelBean() {
		return new Product();
	}

	@PostMapping("/admin/addproduct")
	public String addproduct(ModelMap model, @Valid @ModelAttribute("addproduct") Product product, BindingResult errors,
			@RequestParam("inputfile") MultipartFile input) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "some fields are not valid. Please fix them!");
		} else {
			String[] selectedColors = request.getParameterValues("color");
			String[] selectedSizes = request.getParameterValues("size");
			if (selectedSizes == null) {
				model.addAttribute("errorsize", "Vui lòng chọn size!!!");
			}
			if (selectedColors == null) {
				model.addAttribute("errorcolor", "Vui lòng chọn color!!!");
			}
			if (param.save(input, "/static/img/product/")) {
				product.setImage("/img/product/" + input.getOriginalFilename());
				product.setStatus(true);
				pd.save(product);
				Sort sort = Sort.by(Direction.DESC, "id");
				for (String colorId : selectedColors) {
					Color color = cl.findById(Integer.parseInt(colorId)).get();
					Productcolor productColor = new Productcolor(color, pd.findAll(sort).get(0));
					pdColor.save(productColor);
				}
				for (String sizeId : selectedSizes) {
					Size sizetemp = size.findById(Integer.parseInt(sizeId)).get();
					Productsize productSize = new Productsize(pd.findAll(sort).get(0), sizetemp);
					pdSize.save(productSize);
				}
			} else {
				model.addAttribute("errorImage", "Vui lòng chọn đúng hình ảnh!!!");
			}
		}
		return "/admin/formProduct";
	}

	@RequestMapping("/admin/editproduct/{id}")
	public String editproduct(ModelMap model, @PathVariable("id") Integer id) {
		Product item = pd.findById(id).get();
		model.addAttribute("srcimage", item.getImage());
		model.addAttribute("addproduct", item);
		return "/admin/formProduct";
	}

	@RequestMapping("/admin/updateproduct/{id}")
	public String update(Model model, @Valid @ModelAttribute("addproduct") Product product, BindingResult errors,
			@RequestParam("inputfile") MultipartFile input, @PathVariable("id") Integer id) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "some fields are not valid. Please fix them!");
		} else {
			if (param.save(input, "/static/img/product/")) {
				product.setImage("/img/product/" + input.getOriginalFilename());
				product.setId(id);
				pd.save(product);
			} else {
				product.setId(id);
				pd.save(product);
			}
		}
		return "redirect:/admin/productmanage";
	}

	@RequestMapping("/admin/delete/{id}")
	public String create(@PathVariable("id") Integer id) {
		Product temp = new Product();
		temp.setId(id);
		temp.setCategory(pd.findById(id).get().getCategory());
		temp.setImage(pd.findById(id).get().getImage());
		temp.setName(pd.findById(id).get().getName());
		temp.setPrice(pd.findById(id).get().getPrice());
		temp.setQuantity(pd.findById(id).get().getQuantity());
		temp.setStatus(false);
		pd.save(temp);
		return "redirect:/admin/productmanage";
	}

	@ModelAttribute("color")
	public List<com.entities.Color> getColor() {
		List<com.entities.Color> list = cl.findAll();
		return list;
	}

	@ModelAttribute("size")
	public List<com.entities.Size> getSize() {
		List<com.entities.Size> list = size.findAll();
		return list;
	}

	@ModelAttribute("category")
	public List<com.entities.Category> getCate() {
		List<com.entities.Category> list = cate.findAll();
		return list;
	}
}
