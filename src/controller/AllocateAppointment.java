package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.AppCustomerComplain;
import modal.AppCustomerComplainDao;
import modal.AppLubricant;
import modal.AppLubricantDao;
import modal.AppService;
import modal.AppServiceDao;
import modal.AppointmentDao;
import modal.CustomerComplain;
import modal.CustomerComplainDao;
import modal.CustomerInfo;
import modal.CustomerInfoDao;
import modal.JcLubricant;
import modal.JcLubricantDao;
import modal.JcService;
import modal.JcServiceDao;
import modal.JobcardInfo;
import modal.JobcardInfoDao;
import modal.OfficerInfo;
import modal.OfficerInfoDao;

/**
 * Servlet implementation class AllocateAppointment
 */
@WebServlet("/AllocateAppointment")
public class AllocateAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllocateAppointment() {
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
		String officer_username = request.getParameter("officer_username");
		String status = "arrived";
		String vehicle_number = request.getParameter("vehicle_number");
		CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
		OfficerInfo oi = OfficerInfoDao.getByUsername(officer_username);
		
        String arrival_date =  request.getParameter("request_date");
        String arrivalTime =  request.getParameter("request_time");
		JobcardInfo ji = new JobcardInfo();
		ji.setOfficeUsername(officer_username);
		ji.setStatus(status);
		ji.setVehicleNumber(vehicle_number);
		ji.setArrivalDate(arrival_date);
		ji.setArrivalTime(arrivalTime);
		int status1 = JobcardInfoDao.save(ji);
		
		int jobcardNumber = JobcardInfoDao.getJNByNumber(vehicle_number);
		
		List<AppCustomerComplain> accList = AppCustomerComplainDao.getAll(vehicle_number);
		Iterator<AppCustomerComplain> accItr = accList.iterator();
		while(accItr.hasNext())
		{
			AppCustomerComplain acc = accItr.next();
			CustomerComplain cc = new CustomerComplain();
			cc.setCustomerComplain(acc.getCustomerComplain());
			cc.setJobcardNumber(jobcardNumber);
			CustomerComplainDao.save(cc);
		}
		
		List<AppLubricant> allist = AppLubricantDao.getByNumber(vehicle_number);
		Iterator<AppLubricant> itr1 = allist.iterator();
		while(itr1.hasNext())
		{
			AppLubricant al = itr1.next();
			JcLubricant jl = new JcLubricant();
			jl.setJobcardNumber(jobcardNumber);
			jl.setLubricantId(al.getLubricantId());
			jl.setLubricantName(al.getLubricantName());
			jl.setLubricantPrice(al.getLubricantPrice());
			jl.setLubricantStatus("pending");
			JcLubricantDao.save(jl);
		}
		
		List<AppService> list2 = AppServiceDao.getByNumber(vehicle_number);
		Iterator<AppService> itr2 = list2.iterator();
		while(itr2.hasNext())
		{
			AppService as = itr2.next();
			JcService js = new JcService();
			js.setJobcardNumber(jobcardNumber);
			
			js.setServiceId(as.getServiceId());
			js.setServiceName(as.getServiceName());
			js.setServiceDesc(as.getServiceDetails());
			js.setServicePrice(as.getServicePrice());
			js.setServiceStatus("pending");
			JcServiceDao.save(js);
		}
		
		if (status1 > 0) {
			String msg="Hello "+ci.getCustomerName()+",Your appointment is scheduled on"+arrival_date+" and "+arrivalTime+".<br/>Service Advisor Name:"+officer_username+".<br/>Service Advisor Contact:"+oi.getOfficerContact()+".";
			MyThread t = new MyThread();
			t.StartThread(ci.getCustomerEmail(), msg, "Appointment Alert!!!.");
			
			AppointmentDao.delete(vehicle_number);
			
			response.sendRedirect("receptionist/receptionistDashboard.jsp");
		} else {
			System.out.println("error in allocating the service advisor");
		}
		
	}
		
		
		
		
	}

