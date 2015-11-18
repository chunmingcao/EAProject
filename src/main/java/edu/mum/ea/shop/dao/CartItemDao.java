package edu.mum.ea.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.mum.ea.shop.domain.Cart;
import edu.mum.ea.shop.domain.CartItem;

@Repository
public interface CartItemDao extends JpaRepository<CartItem, Integer>{

	
}
