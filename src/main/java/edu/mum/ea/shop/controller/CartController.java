package edu.mum.ea.shop.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.mum.ea.shop.domain.Cart;
import edu.mum.ea.shop.domain.Product;
import edu.mum.ea.shop.domain.User;
import edu.mum.ea.shop.service.CartService;
import edu.mum.ea.shop.service.ProductService;
import edu.mum.ea.shop.service.UserService;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/cart/addProduct", method=RequestMethod.POST)
	public String addToCart(Cart cart, Principal principal,HttpServletRequest request){
		cart.setProduct(productService.get(Integer.parseInt(request.getParameter("product.id"))));
		cart.setUser(userService.getUser(principal.getName()));
		
		if(cartService.addToCart(cart)){
			System.out.println("Added To Cart!");
		}
		return "redirect:/cart/mycart";
	}
	
	@RequestMapping(value="/cart/mycart", method=RequestMethod.GET)
	public String viewMyCarts(Model model, Principal principal){
		User user = userService.getUser(principal.getName());
		model.addAttribute("carts", cartService.getCart(user));
		return "mycart";
	}
}
