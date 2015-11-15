package edu.mum.ea.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.ea.shop.domain.Category;
import edu.mum.ea.shop.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value="/admin/addcategory")
	public String addCategory(){
		return "addcategory";
	}

	@RequestMapping(value="/admin/addcategory", method = RequestMethod.POST)
	public String addCategory(Category cate){
		categoryService.add(cate);
		return "redirect:/admin/categories";
	}
	
	@RequestMapping(value="/admin/categories")
	public String getCategories(){
		return "index";
	}
}
