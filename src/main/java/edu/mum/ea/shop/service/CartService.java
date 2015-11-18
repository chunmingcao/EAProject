package edu.mum.ea.shop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.ea.shop.dao.CartDao;
import edu.mum.ea.shop.dao.CartItemDao;
import edu.mum.ea.shop.dao.ProductDao;
import edu.mum.ea.shop.domain.Cart;
import edu.mum.ea.shop.domain.CartItem;
import edu.mum.ea.shop.domain.Product;
import edu.mum.ea.shop.domain.User;

@Service
public class CartService {

	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private CartItemDao cartItemDao;
	
	
	public void save(Cart cart){
		cartDao.save(cart);
	}
	
	public Cart get(int id){
		return cartDao.findOne(id);
	}
	
	public List<Cart> getAll(){
		return cartDao.findAll();
	}
	
	public void deleteItem(CartItem cartItem){
		Cart cart = cartItem.getCart();
		Product product = cartItem.getProduct();
		System.out.println(cartItem.getId());
		List<CartItem> items = new ArrayList<CartItem>();
		for(CartItem item: cart.getCartItems()){
			if(!item.equals(cartItem)){
				items.add(item);
			}
		}
		cart.setCartItems(items);
		cartDao.save(cart);
		product.setQuantity(product.getQuantity()+cartItem.getQuantity());
		productDao.save(product);
	}

	public Cart getCart(User user) {
		return cartDao.findCartByUserId(user.getId());
	}
	
}
