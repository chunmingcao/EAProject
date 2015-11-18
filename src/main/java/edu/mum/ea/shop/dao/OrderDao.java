package edu.mum.ea.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.mum.ea.shop.domain.Order;

@Repository
public interface OrderDao extends JpaRepository<Order, Integer>{
	
}
