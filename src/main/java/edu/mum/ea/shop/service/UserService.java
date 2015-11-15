package edu.mum.ea.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.mum.ea.shop.dao.UserDao;
import edu.mum.ea.shop.domain.User;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	private UserService(){
	}
	
	public void addUser(User user){
		userDao.save(user);
	}
	
	public User getUser(String email, String password){
		return userDao.findByEmailAndPassword(email, password);
	}
}
