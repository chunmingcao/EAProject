package edu.mum.ea.shop.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.mum.ea.shop.domain.Category;
import edu.mum.ea.shop.domain.Product;

@Repository
public interface ProductDao extends JpaRepository<Product, Integer>{
	
	public List<Product> findProductByCategoryId(int categoryId);
	
}
