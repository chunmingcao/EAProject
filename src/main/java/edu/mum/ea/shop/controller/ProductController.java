package edu.mum.ea.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.ea.shop.domain.Product;
import edu.mum.ea.shop.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@RequestMapping(value="/admin/addproduct", method=RequestMethod.GET)
	public String addProduct(@ModelAttribute("product") Product product){
		return "addproduct";
	}

	@RequestMapping(value="/admin/addproduct", method = RequestMethod.POST)
	public String addProduct(@Validated Product product, BindingResult result){
		if(result.hasErrors()){
			return "addproduct";
		}
		productService.save(product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value="/admin/editproduct/{id}", method = RequestMethod.GET)
	public String editProduct(@PathVariable int id, Model model){
		model.addAttribute("product", productService.get(id));
		return "editproduct";
	}

	@RequestMapping(value="/admin/editproduct/{id}", method = RequestMethod.POST)
	public String editProduct(@PathVariable int id, Product product){
		productService.save(product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value="/admin/products")
	public String getCategories(Model model){
		model.addAttribute("products", productService.getAll());
		return "products";
	}
}
