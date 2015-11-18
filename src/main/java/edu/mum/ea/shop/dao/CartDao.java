package edu.mum.ea.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.mum.ea.shop.domain.Cart;

@Repository
public interface CartDao extends JpaRepository<Cart, Integer>{

	public Cart findCartByUserId(int userId);
}
