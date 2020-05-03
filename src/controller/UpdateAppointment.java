package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.Appointment;
import modal.AppointmentDao;
import modal.JcAccessoriesDao;
import modal.JobcardInfoDao;

/**
 * Servlet implementation class UpdateAppointment
 */
@WebServlet("/UpdateAppointment")
public class UpdateAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAppointment() {
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
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();  
        String vehicleNumber=request.getParameter("id");
        String workType=request.getParameter("work_type");  
        int runningKm= Integer.parseInt(request.getParameter("running_km"));
     
        String requestDate=request.getParameter("request_date");  
        String requestTime=request.getParameter("request_time"); 
		
        Appointment app = new Appointment();
        app.setVehicleNumber(vehicleNumber);
        app.setRequestDate(requestDate);
        app.setRequestTime(requestTime);
        app.setRunningKM(runningKm);
        app.setWorkType(workType);
        
        
        
        
        
        
        int status1=AppointmentDao.update(app);
		
		
		
		 if(status1>0){  
		      //  HttpSession session = request.getSession();
		            out.print("<p>Record saved successfully!</p>");  
		            response.sendRedirect("regularcustomer/customerDashboard.jsp");  
		        }else{  
		            out.println("customer Allready Exist ");  
		            
		        }  
		          
		        out.close();  
		
		
	}

}
