package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.Appointment;
import modal.AppointmentDao;
import modal.JobcardInfo;
import modal.JobcardInfoDao;

/**
 * Servlet implementation class Saveappointment
 */
@WebServlet("/Saveappointment")
public class Saveappointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Saveappointment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		
		String vehicle_number = request.getParameter("id");
		
		Appointment ap= new Appointment();
		ap.setVehicleNumber(vehicle_number);
		
		int status = AppointmentDao.save(ap);
		if (status > 0) {
			 HttpSession session = request.getSession();
		      	session.setAttribute("vehicle_number", vehicle_number);
			response.sendRedirect("regularcustomer/appointment.jsp?id=disabled");
		} else {
			System.out.println("error in Customer ");
		}
	}
	
	
	

	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
