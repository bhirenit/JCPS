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
				switch(oi.getOfficerRole())
				{
				case "service_advisor" : response.sendRedirect("serviceadvisor/saDashboard.jsp");
										 break;
				case "floor_incharge" : response.sendRedirect("floorincharge/fincDashboard.jsp");
				 						break; 
				case "receptionist" : response.sendRedirect("receptionist/receptionistDashboard.jsp");
				 					  break;
				case "customer" : response.sendRedirect("regularcustomer/customerDashboard.jsp");
										 break;
				case "admin" : response.sendRedirect("admin/adminDashboard.jsp");
							   break;
				case "insurance" : response.sendRedirect("insurance/insuranceDashboard.jsp");
				   break;
				default : response.sendRedirect("index.jsp");
				}
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
