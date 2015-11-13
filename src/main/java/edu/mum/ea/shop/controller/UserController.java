package edu.mum.ea.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.ea.shop.domain.User;
import edu.mum.ea.shop.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/")
	public String query(){
		return "signin";
	}
	
	@RequestMapping(value = "/signup")
	public String signUp(){
		return "redirect:signup";
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public String signUp(User user){
		userService.addUser(user);
		return "redirect:index";
	}
	
	@RequestMapping(value = "/signin")
	public String signIn(){
		return "redirect:signup";
	}	
	
	@RequestMapping(value = "/signin", method=RequestMethod.POST)
	public String signIn(User user){
		userService.addUser(user);
		return "";
	}
}
