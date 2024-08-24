package com.servlet;

import java.io.IOException;

import javax.crypto.spec.DESedeKeySpec;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ExpenseDao;
import com.db.HibernateUtility;

@WebServlet("/deleteExpense")
public class DeleteExpenseServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		
		ExpenseDao expenseDao = new ExpenseDao(HibernateUtility.getSessionFactory());
		boolean deleted = expenseDao.deleteExpense(id);
		
		HttpSession session = req.getSession();
		
		if(deleted) {
			session.setAttribute("msg", "Expense Deleted Successfully!");
			resp.sendRedirect("user/view_expenses.jsp");
		}
		else {
			session.setAttribute("msg", "Expense not deleted! Server erroe");
			resp.sendRedirect("user/view_expenses.jsp");
		}
		
	}
}
