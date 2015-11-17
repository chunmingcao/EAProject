package edu.mum.ea.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.ea.shop.dao.CartDao;
import edu.mum.ea.shop.dao.ProductDao;
import edu.mum.ea.shop.domain.Cart;
import edu.mum.ea.shop.domain.Product;
import edu.mum.ea.shop.domain.User;

@Service
public class CartService {

	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private ProductDao productDao;
	
	
	public void save(Cart cart){
		cartDao.save(cart);
	}
	
	public Cart get(int id){
		return cartDao.findOne(id);
	}
	
	public List<Cart> getAll(){
		return cartDao.findAll();
	}

	@Transactional
	public boolean addToCart(Cart cart) {
		Product product = productDao.findOne(cart.getProduct().getId());
		System.out.println("quantity available: "+product.getQuantity());
		if(product.getQuantity()>0){
			cartDao.save(cart);
			product.setQuantity(product.getQuantity()-1);
			productDao.save(product);
			return true;
		}
		// TODO Auto-generated method stub
		return false;
	}

	public List<Cart> getCart(User user) {
		
		return cartDao.findCartByUserId(user.getId());
	}
	
}
