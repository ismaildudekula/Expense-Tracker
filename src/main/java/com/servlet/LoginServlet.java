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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		UserDao userDao = new UserDao(HibernateUtility.getSessionFactory());
		
		User loggedUser = userDao.loginUser(email, password);
		
		HttpSession session = req.getSession();
		
		if(loggedUser == null) {
			session.setAttribute("msg", "Invalid Email or Password!");
			resp.sendRedirect("login.jsp");
		}else {
			session.setAttribute("loggedUser", loggedUser);
			resp.sendRedirect("user/home.jsp");
			
		}
		
	}

}
