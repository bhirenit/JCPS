package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.CustomerInfo;
import modal.CustomerInfoDao;
import modal.JobcardInfo;
import modal.JobcardInfoDao;
import modal.VehicleInfoDao;

@WebServlet("/CheckVehicle")
public class CheckVehicle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 public CheckVehicle() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
		 HttpSession session = request.getSession();  
	        String vehicle_number=request.getParameter("vehicle_number"); 
	        session.setAttribute("vehicle_number", vehicle_number);
	        boolean vflag = VehicleInfoDao.checkVehicleNumber(vehicle_number); /*set history when history tables are created*/
	        if(vflag)
	        {
	        	
	        	int model_varient = VehicleInfoDao.getVarientByNumber(vehicle_number);
	        	String customer_name = CustomerInfoDao.getNameByNumber(vehicle_number);
	        	session.setAttribute("model_varient_id",model_varient);
	        	session.setAttribute("customer_name",customer_name);
	        	session.setAttribute("vehicle_number", vehicle_number);
	        	response.sendRedirect("receptionist/pastHistory.jsp");
	        }else{
	        	JobcardInfo jci = JobcardInfoDao.getAllByNumber(vehicle_number);
	        	if(jci.getStatus()!=null)
	        	{
	        		int jobcard_number=JobcardInfoDao.getJNByNumber(vehicle_number);
	        		response.sendRedirect("receptionist/jobcardview.jsp?id="+jobcard_number);
	        	}
	        	else
	        	{
	        		response.sendRedirect("receptionist/customerRegistration.jsp"); 
	        	}
	        }
	}

}
