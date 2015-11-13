package edu.mum.ea.shop.dao;

import java.util.List;

import org.hibernate.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.mum.ea.shop.domain.User;

@Repository
public class UserDao {
	@Autowired
	private SessionFactory sessionFactory;
	@Transactional
	public void addUser(User user){
		Session session = sessionFactory.getCurrentSession();
		session.persist(user);
	}
	@Transactional
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
