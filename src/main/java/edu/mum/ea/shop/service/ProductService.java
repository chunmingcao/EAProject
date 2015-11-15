package edu.mum.ea.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.ea.shop.dao.ProductDao;
import edu.mum.ea.shop.domain.Product;

@Service
public class ProductService {

	@Autowired
	private ProductDao productDao;
	
	
	public void add(Product product){
		productDao.save(product);
	}
	
}
