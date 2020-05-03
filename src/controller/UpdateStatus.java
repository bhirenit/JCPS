package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JPanel;

import modal.CustomerInfo;
import modal.CustomerInfoDao;
import modal.JcLubricant;
import modal.JcLubricantDao;
import modal.JcPart;
import modal.JcPartDao;
import modal.JcService;
import modal.JcServiceDao;
import modal.JobcardInfo;
import modal.JobcardInfoDao;
import modal.VehicleInfoDao;
import modal.VehicleLubricantDetails;
import modal.VehicleLubricantDetailsDao;
import modal.VehicleModelDao;
import modal.VehicleServiceDetails;
import modal.VehicleServiceDetailsDao;
import schedule.DBScheduler;

/**
 * Servlet implementation class UpdateStatus
 */
@WebServlet("/UpdateStatus")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] parts = request.getParameterValues("parts");
		String[] services = request.getParameterValues("services");
		String[] lubricants = request.getParameterValues("lubricants");
		int jobcardNumber = Integer.parseInt(request.getParameter("jobcardnumber"));
		if(parts!=null)
		{
			for(String part : parts)
			{
				JcPartDao.updateStatus(jobcardNumber,Integer.parseInt(part),"completed");
			}
		}
		if(services!=null)
		{
			for(String service : services)
			{
				JcServiceDao.updateStatus(jobcardNumber,Integer.parseInt(service),"completed");
			}
		}
		if(lubricants!=null)
		{
			for(String lubricant : lubricants)
			{
				JcLubricantDao.updateStatus(jobcardNumber,Integer.parseInt(lubricant),"completed");
			}
		}
		try {
			if(JobcardInfoDao.checkIfAllCompleted(jobcardNumber))
			{	
				String msg1="";
				String vehicleNumber=JobcardInfoDao.getVNByNumber(jobcardNumber);
				CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicleNumber);
				int final_amount = JobcardInfoDao.getFinalAmount(jobcardNumber);
				int model_id=VehicleInfoDao.getModelByNumber(vehicleNumber);
				String modelName=VehicleModelDao.getModelName(model_id);
				//status changes to repaired means your service is completed in this portion....
				String msg = "Hello <b>" + ci.getCustomerName() + "</b>,<br> Your Car <b>" + modelName + "</b> is ready to be delivered. The final amount is " + final_amount + ".";
				MyThread t = new MyThread();
				t.StartThread(ci.getCustomerEmail(), msg, "Completion of Car Service");
				
				msg1="Parts that were added: <br/>";
				
				List<JcPart> jc=JcPartDao.getByJobcardNumber(jobcardNumber);
				Iterator<JcPart> itr2 = jc.iterator();
                while (itr2.hasNext()) {
                JcPart jp = itr2.next();
                msg1=msg1+jp.getPartName()+"<br/>";
                }
                
                msg1=msg1+"<br/> Lubricant Oil that were added: <br/>";
                
                List<JcService> jsList = JcServiceDao.getByJobcardNumber(jobcardNumber);
                Iterator<JcService> jsItr = jsList.iterator();
                while(jsItr.hasNext()){
                	JcService js = jsItr.next();
                	VehicleServiceDetails vsd = VehicleServiceDetailsDao.getServicesById(js.getServiceId());
                	
                	 try {
                     	SchedularThread th = new SchedularThread();
     					th.StartThread(vsd.getServiceValidity()+"s", vsd.getServiceValidity()+"s", ci.getCustomerEmail(), "Services needs to be Done"+vsd.getServiceName(), "Schedular MAil");
     				} catch (Exception e) {
     					// TODO Auto-generated catch block
     					e.printStackTrace();
     				}
                     
                }
                
                List<JcLubricant> jl=JcLubricantDao.getByJobcardNumber(jobcardNumber);
				Iterator<JcLubricant> itr3 = jl.iterator();
                while (itr3.hasNext()) {
                JcLubricant jp = itr3.next();
                VehicleLubricantDetails vld = VehicleLubricantDetailsDao.getLubricantsById(jp.getLubricantId());
                
                try {
                	SchedularThread th = new SchedularThread();
					th.StartThread(vld.getLubricantValidity()+"s", vld.getLubricantValidity()+"s", ci.getCustomerEmail(), "Lubricant needs to be changed"+vld.getLubricantName(), "Schedular MAil");
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                
                msg1=msg1+jp.getLubricantName()+"<br/>";
                }
				
				MyThread t1 = new MyThread();
				t1.StartThread(ci.getCustomerEmail(), msg1, "Completion of Car Service");
				
				JobcardInfoDao.updateStatus(jobcardNumber,"repaired");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		response.sendRedirect("floorincharge/fincDashboard.jsp");
	}

}
