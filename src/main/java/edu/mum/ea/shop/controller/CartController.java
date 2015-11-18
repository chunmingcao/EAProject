package edu.mum.ea.shop.controller;

import java.security.Principal;
import java.util.ArrayList;
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
import edu.mum.ea.shop.domain.CartItem;
import edu.mum.ea.shop.domain.Product;
import edu.mum.ea.shop.domain.User;
import edu.mum.ea.shop.service.CartItemService;
import edu.mum.ea.shop.service.CartService;
import edu.mum.ea.shop.service.ProductService;
import edu.mum.ea.shop.service.UserService;

@Controller
public class CartController {

	@Autowired
	private CartItemService cartItemService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/cart/addProduct", method=RequestMethod.POST)
	public String addToCart(CartItem cartItem, Cart cart, Principal principal,HttpServletRequest request){
		
		Product product = productService.get(Integer.parseInt(request.getParameter("product.id")));
		if(product.getQuantity()==0){
			return "redirect:products";
		}
		cartItem.setProduct(product);
		User user = userService.getUser(principal.getName());
		cart.setUser(user);
		Cart userCart = cartService.getCart(user);
		if(userCart!=null){
			cart = userCart;
			System.out.println(cart.getId());
		}
		List<CartItem> items = cart.getCartItems();
		items.add(cartItem);
		cart.setCartItems(items);
		cartService.save(cart);
		product.setQuantity(product.getQuantity()-cartItem.getQuantity());
		productService.save(product);
		
		return "redirect:/cart/mycart";
	}
	
	@RequestMapping(value="/cart/mycart", method=RequestMethod.GET)
	public String viewMyCarts(@ModelAttribute("cartItem") CartItem cartItem, Model model, Principal principal){
		User user = userService.getUser(principal.getName());
		model.addAttribute("cart", cartService.getCart(user));
		return "mycart";
	}
	
	@RequestMapping(value="/cart/removeitem/{id}", method=RequestMethod.POST)
	public String removeItem(CartItem cartItem, @PathVariable int id){
		cartItem = cartItemService.get(id);
		cartService.deleteItem(cartItem); 
		return "redirect:/cart/mycart";
	}
}
