package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.db.HibernateUtility;
import com.model.User;

public class UserDao {

	private SessionFactory sessionFactory = null;
	private Session session = null;
	private Transaction transaction = null;
	
	public UserDao() {
	}

	public UserDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	
	public boolean saveUser(User user) {
		boolean res = false;
		
		try {
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			session.persist(user);
			
			transaction.commit();
			res = true;
			
			
		}catch (Exception e) {
			if(transaction != null) {
				res = false;
				e.printStackTrace();
			}
		}
		
		
		return res;
	}
	
	
	public User loginUser(String email,String password) {
		User user = null;
		session = sessionFactory.openSession();
		
		Query<User> query = session.createQuery("from User where email=:em and password=:pass",User.class);
		query.setParameter("em", email);
		query.setParameter("pass", password);
		user = query.uniqueResult();
		
		return user;
	}
	
	
	
	
}
