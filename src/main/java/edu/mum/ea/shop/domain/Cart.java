package edu.mum.ea.shop.domain;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;


@Entity
public class Cart {
	
	@Id
	@GeneratedValue
	private int id;
	
	@OneToOne
	private User user;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="cart_id")
	private List<CartItem> cartItems = new ArrayList<CartItem>();

	public Cart() {
		super();
	}
	
	public double getTotal(){
		double total=0;
		for(CartItem cartItem:cartItems){
			total += cartItem.getTotal();
		}
		return total;
	}

	public void addItem(CartItem cartItem){
		cartItems.add(cartItem);
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
	
}
