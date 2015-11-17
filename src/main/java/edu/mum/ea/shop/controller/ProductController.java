package edu.mum.ea.shop.controller;

import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.ea.shop.domain.Product;
import edu.mum.ea.shop.domain.Category;
import edu.mum.ea.shop.service.CategoryService;
import edu.mum.ea.shop.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value="/admin/addproduct", method=RequestMethod.GET)
	public String addProduct(@ModelAttribute("product") Product product, Model model){
		Map<Integer, String> cateMap = new LinkedHashMap();
		for(Category cate: categoryService.getAll()){
			cateMap.put(cate.getId(), cate.getName());
		}
		model.addAttribute("cateMap", cateMap);
		return "admin/addproduct";
	}

	@RequestMapping(value="/admin/addproduct", method = RequestMethod.POST)
	public String addProduct(@Validated Product product, BindingResult result){
		if(result.hasErrors()){
			return "admin/addproduct";
		}
		productService.save(product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value="/admin/editproduct/{id}", method = RequestMethod.GET)
	public String editProduct(@PathVariable int id, Model model){
		model.addAttribute("product", productService.get(id));
		return "admin/editproduct";
	}

	@RequestMapping(value="/admin/editproduct/{id}", method = RequestMethod.POST)
	public String editProduct(@PathVariable int id, Product product){
		productService.save(product);
		return "redirect:/admin/products";
	}
	
	@RequestMapping(value={"/admin/products","/products","/"})
	public String getProducts(Model model){
		model.addAttribute("products", productService.getAll());
		Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
       		
		for (GrantedAuthority auth : authorities) {
            if ("ROLE_ADMIN".equals(auth.getAuthority()))
                return "admin/products";
        }
		return "products";
	}
	
	@RequestMapping(value="/product/{id}", method = RequestMethod.GET)
	public String getProduct(@PathVariable int id, Model model){
		model.addAttribute("product", productService.get(id));
		return "product";
	}
}
