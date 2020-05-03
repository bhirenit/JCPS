package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.JcPartDao;
import modal.JobcardInfoDao;

/**
 * Servlet implementation class UpdateInsuranceStatus
 */
@WebServlet("/UpdateInsuranceStatus")
public class UpdateInsuranceStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateInsuranceStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] parts = request.getParameterValues("parts");
		int jobcardNumber = Integer.parseInt(request.getParameter("jobcardnumber"));
		if(parts!=null)
		{
			for(String part : parts)
			{
				JcPartDao.updateStatus(jobcardNumber,Integer.parseInt(part),"approved");
			}
		}
		JobcardInfoDao.updateStatus(jobcardNumber, "insurancerepaired");
		response.sendRedirect("insurance/insuranceDashboard.jsp");
	}

}
