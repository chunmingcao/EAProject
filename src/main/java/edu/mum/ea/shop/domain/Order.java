package edu.mum.ea.shop.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;



@Entity
public class Order {
	
	@Id
	@GeneratedValue
	private int id;
	
	@OneToOne
	private User user;
	
	@OneToOne
	private Product product;
	
	@OneToMany(mappedBy="order")
	private List<OrderDetail> orderDetails = new ArrayList<>();
	
	@Embedded
	private Address shippingAddress;
	
	@Enumerated(EnumType.STRING)
	private ShippingStatus shippingStatus;
	
	private int quantity;

	public Order() {
		super();
	}
	
	public double calculateTotal(){
		
		double total = 0;
		for(OrderDetail order: orderDetails){
			total = total + order.getProduct().getPrice()*  order.getQuantity();
		}
		return total;
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

	public Address getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(Address shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public ShippingStatus getShippingStatus() {
		return shippingStatus;
	}

	public void setShippingStatus(ShippingStatus shippingStatus) {
		this.shippingStatus = shippingStatus;
	}

	
	
}
