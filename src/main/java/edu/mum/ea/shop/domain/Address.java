package edu.mum.ea.shop.domain;

import javax.persistence.Embeddable;

@Embeddable
public class Address {

	private String city;
	private String state;
	private String zip;
	
	public Address(){
		
	}
}
