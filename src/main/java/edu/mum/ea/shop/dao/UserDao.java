package edu.mum.ea.shop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.mum.ea.shop.domain.User;

@Repository
public interface UserDao extends JpaRepository<User, Integer>{
	public User findByEmailAndPassword(String email, String password);

}
