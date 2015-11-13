package edu.mum.ea.shop.dao;

import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import edu.mum.ea.shop.domain.User;

@Repository
public class UserDao {
	
	private SessionFactory sessionFactory;
	public void addUser(User user){
		Session session = sessionFactory.getCurrentSession();
		session.persist(user);
	}
	
	public User getUser(String email, String password){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User u where u.email = :email and u.password = :password");
		List<User> userList = query.list();
		
		if(userList.isEmpty()) 
			return null;
		else
			return userList.get(0);
	}
}
