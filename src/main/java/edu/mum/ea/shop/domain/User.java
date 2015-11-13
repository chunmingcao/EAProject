package edu.mum.ea.shop.domain;

import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class User {
	
	@Id
	@GeneratedValue
	private int id;
	private String email;
	private String password;
	private String firstName;
	private String lastName;
	@Embedded
	private Address shippingAddress;
	@Embedded
	private Address billingAddress;
	
	public User(){
	}
	
}
