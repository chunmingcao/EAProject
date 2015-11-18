package edu.mum.ea.shop.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.ea.shop.dao.CartItemDao;
import edu.mum.ea.shop.domain.Cart;
import edu.mum.ea.shop.domain.CartItem;


@Service
public class CartItemService {
	
	@Autowired
	private CartItemDao cartItemDao;

	public void delete(int id){
		cartItemDao.delete(id);
	}
	
	public CartItem get(int id){
		return cartItemDao.findOne(id);
	}
}
