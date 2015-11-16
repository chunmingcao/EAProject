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

import edu.mum.ea.shop.domain.Category;
import edu.mum.ea.shop.service.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value="/admin/addcategory", method=RequestMethod.GET)
	public String addCategory(@ModelAttribute("category") Category category){
		return "addcategory";
	}

	@RequestMapping(value="/admin/addcategory", method = RequestMethod.POST)
	public String addCategory(@Validated Category category, BindingResult result){
		if(result.hasErrors()){
			return "addcategory";
		}
		categoryService.add(category);
		return "redirect:/admin/categories";
	}
	
	@RequestMapping(value="/admin/editcategory/{id}", method = RequestMethod.GET)
	public String editCategory(@PathVariable int id, Model model){
		model.addAttribute("category", categoryService.get(id));
		return "editcategory";
	}

	@RequestMapping(value="/admin/editcategory/{id}", method = RequestMethod.POST)
	public String editCategory(@PathVariable int id, Category category){
		categoryService.update(category);
		return "redirect:/admin/categories";
	}
	
	@RequestMapping(value="/admin/deletecategory/{id}", method = RequestMethod.GET)
	public String deleteCategory(@PathVariable int id){
		categoryService.delete(id);
		return "redirect:/admin/categories";
	}
	
	@RequestMapping(value="/admin/categories")
	public String getCategories(Model model){
		model.addAttribute("categories", categoryService.getAll());
		return "categories";
	}
}
