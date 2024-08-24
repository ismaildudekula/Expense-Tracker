package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.SelectionQuery;

import com.model.Expense;
import com.model.User;

public class ExpenseDao {
	
	private SessionFactory sessionFactory = null;
	private Session session = null;
	private Transaction transaction = null;
	
	public ExpenseDao() {
	}
	
	public ExpenseDao(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}
	
	public boolean saveExpense(Expense expense) {
		boolean res = false;
		
		try {
			
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			session.persist(expense);
			
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
	
	public List<Expense> allExpenses(User user){
		List<Expense> list = new ArrayList<Expense>();
		
		try {
			
			session = sessionFactory.openSession();
			String hql = "from Expense where user =:us";
			SelectionQuery<Expense> selectionQuery = session.createSelectionQuery(hql,Expense.class);
			selectionQuery.setParameter("us", user);
			list = selectionQuery.getResultList();
			
			
		} catch (Exception e) {
			if(transaction != null) {
				list = null;
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public Expense getExpenseById(int Id) {
		Expense expense = null;
		
		try {
			Session session = sessionFactory.openSession();
			SelectionQuery<Expense> query = session.createSelectionQuery("from Expense where id =:id",Expense.class);
			query.setParameter("id", Id);
			expense = query.uniqueResult();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return expense;
	}
	
	
	
	public boolean updateExpense(Expense expense) {
		boolean res = false;
		
		try {
			
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			session.merge(expense);
			
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
	
	
	public boolean deleteExpense(int id) {
		boolean res = false;
		try {
			
			session = sessionFactory.openSession();
			transaction = session.beginTransaction();
			
			Expense expense = session.get(Expense.class, id);
			session.remove(expense);
			
			transaction.commit();
			res = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	

}
