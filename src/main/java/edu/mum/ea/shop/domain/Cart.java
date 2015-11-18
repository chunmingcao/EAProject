package edu.mum.ea.shop.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;


@Entity
public class Cart {
	
	@Id
	@GeneratedValue
	private int id;
	
	@OneToOne
	private User user;
	
	@OneToOne//(fetch=FetchType.EAGER)
	private Product product;
	
	private int quantity;
	

	public Cart() {
		super();
	}
	
	public double getTotal(){
		return product.getPrice()*quantity;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	
	
}
