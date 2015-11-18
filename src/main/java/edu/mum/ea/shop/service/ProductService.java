package edu.mum.ea.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.ea.shop.dao.ProductDao;
import edu.mum.ea.shop.domain.Product;

@Service
public class ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Transactional	
	public void save(Product product){
		productDao.save(product);
	}
	
	@Transactional
	public void delete(int id){
		productDao.delete(id);
	}
	
	@Transactional
	public Product get(int id){
		return productDao.findOne(id);
	}
	
	@Transactional
	public List<Product> getByCategoryId(int catId){
		return productDao.findProductByCategoryId(catId);
	}
	
	@Transactional
	public Page<Product> getByCategoryId(int catId, Pageable p){
		return productDao.findProductByCategoryId(catId, p);
	}
	
	@Transactional
	public List<Product> getAll(){
		return productDao.findAll();
	}
	
	@Transactional
	public Page<Product> getAll(Pageable p){
		return productDao.findAll(p);
	}
}
