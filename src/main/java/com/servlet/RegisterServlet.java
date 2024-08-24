package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtility;
import com.model.User;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String fullname = req.getParameter("fullName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		User user = new User(fullname,email,password);
		
		UserDao userDao = new UserDao(HibernateUtility.getSessionFactory());
		boolean saveUser = userDao.saveUser(user);
		
		HttpSession session = req.getSession();
		
		if(saveUser) {
			session.setAttribute("msg", "Registered Successfully!");
			resp.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("msg", "Something wrong on server!");
			resp.sendRedirect("register.jsp");
		}
		
	}

}
