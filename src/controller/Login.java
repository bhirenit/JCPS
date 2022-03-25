package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.OfficerInfo;
import modal.OfficerInfoDao;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Login() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			if(OfficerInfoDao.authenticate(username,password))
			{
				OfficerInfo oi = OfficerInfoDao.getByUsername(username);
				HttpSession session = request.getSession();
				session.setAttribute("officer_name", oi.getOfficerName());
				session.setAttribute("officer_username", oi.getOfficerUsername());
				session.setAttribute("officer_role", oi.getOfficerRole());
				
				//Refactoring Method: Replacing Conditional with Polymorphism
				//Class: [controller/Login.java]
				//Why? -> Switch case was implemented to redirect the officer based on their role. 
				//How?->	So,here, by removing the switch case, I replaced them with super class of [OfficerRole]
				//		  	and subclass such as [service_advisor], [floor_incharge], [receptionist], [customer],
				//		  	[admin], [insurance].
				
				OfficerRole officerRole = new OfficerRole() {
					
					@Override
					public int Type() {
						// TODO Auto-generated method stub
						return 0;
					}
				};
				
				officerRole.sendRedirectByOfficerRole(response, oi);
			}
			else
			{
				PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("Invalid Username or Password");
				
				request.getRequestDispatcher("index.jsp").include(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
