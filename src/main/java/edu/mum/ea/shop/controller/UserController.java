package edu.mum.ea.shop.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.ea.shop.domain.User;
import edu.mum.ea.shop.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/signup")
	public String signUpForm(User user){
		return "signup";
	}
	
	@RequestMapping(value = "/signup", method=RequestMethod.POST)
	public String signUp(@Valid User user, BindingResult result){
		if(result.hasErrors()){
			return "signup";
		}
		user.setRole("ROLE_USER");
		userService.addUser(user);
		return "redirect:signin";
	}
	
	@RequestMapping(value = "/signin")
	public String signInForm(User user){
		return "login";
	}	
	
	@RequestMapping(value = "/signin", method=RequestMethod.POST)
	public String signIn(User user){
		user = userService.getUser(user.getEmail(),user.getPassword());
		if(user!=null){
			return "index";
		}
		return "signin";
	}
}
