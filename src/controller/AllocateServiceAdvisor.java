package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.JobcardInfo;
import modal.JobcardInfoDao;
import modal.OfficerInfo;

/**
 * Servlet implementation class AllocateServiceAdvisor
 */
@WebServlet("/AllocateServiceAdvisor")
public class AllocateServiceAdvisor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllocateServiceAdvisor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String officer_username = request.getParameter("officer_username");
		String status = "arrived";
		String vehicle_number = request.getParameter("vehicle_number");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDateTime now = LocalDateTime.now();
        String arrival_date = dtf.format(now);
		
        DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("HH:mm:ss");
        String arrivalTime = dtf1.format(now);
		JobcardInfo ji = new JobcardInfo();
		ji.setOfficeUsername(officer_username);
		ji.setStatus(status);
		ji.setVehicleNumber(vehicle_number);
		ji.setArrivalDate(arrival_date);
		ji.setArrivalTime(arrivalTime);
		int status1 = JobcardInfoDao.save(ji);
		if (status1 > 0) {
			
			response.sendRedirect("receptionist/receptionistDashboard.jsp");
		} else {
			System.out.println("error in allocating the service advisor");
		}
	}

}
