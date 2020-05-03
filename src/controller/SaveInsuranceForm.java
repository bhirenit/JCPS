package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.Insurance;
import modal.InsuranceDao;

/**
 * Servlet implementation class SaveInsuranceForm
 */
@WebServlet("/SaveInsuranceForm")
public class SaveInsuranceForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveInsuranceForm() {
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
        String vehicleNumber=request.getParameter("vehicle_number");
        String policyNumber=request.getParameter("policy_number");  
        
        String location= request.getParameter("location");
        String insuranceCompany=request.getParameter("insurance_company");  
        String insuranceType=request.getParameter("insurance_type");  
        String expiryDate=request.getParameter("expiry_date");  
        String dateOfLoss=request.getParameter("date_of_loss");  
        HttpSession session = request.getSession();
        String officerUsername =(String)session.getAttribute("officer_username");		
		Insurance in = new Insurance();
		
		in.setPolicyNumber(policyNumber);
		in.setVehicleNumber(vehicleNumber);
		in.setInsuranceCompany(insuranceCompany);
		in.setInsuranceType(insuranceType);
		in.setExpiryDate(expiryDate);
		in.setLocation(location);
		in.setDateOfLoss(dateOfLoss);
		in.setOfficer_username(officerUsername);
		int status = InsuranceDao.save(in);
		
		if(status > 0) {
			response.sendRedirect("serviceadvisor/saDashboard.jsp");
		} else {
			out.print("error");
		}
		
	}

}
