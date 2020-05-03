package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pdfcrowd.Pdfcrowd;

import modal.AppLubricant;
import modal.CustomerInfo;
import modal.CustomerInfoDao;
import modal.JcAccessories;
import modal.JcAccessoriesDao;
import modal.JobcardInfo;
import modal.JobcardInfoDao;
import modal.VehicleInfoDao;
import modal.VehicleModel;
import modal.VehicleModelDao;

@WebServlet("/SaveJobCard")
public class SaveJobCard extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SaveJobCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  		
        PrintWriter out=response.getWriter();  
        String vehicleNumber=request.getParameter("vehicle_number");
        String workType=request.getParameter("work_type");  
        int runningKm= Integer.parseInt(request.getParameter("running_km"));
        int availableFuel= Integer.parseInt(request.getParameter("available_fuel"));
        String deliveryDate=request.getParameter("delivery_date");  
        String deliveryTime=request.getParameter("delivery_time"); 
        String status=""; 
        if(workType.equals("Insurance"))
        { status = "insurancepending";
        }else{
        	status="pending";
        }
        int jobcardNumber= Integer.parseInt(request.getParameter("jobcard_number"));
        
        boolean toolkit=request.getParameter("toolkit") != null;
        boolean spareWheel=request.getParameter("spare_wheel") != null;
        boolean jackAndHandle=request.getParameter("jack_and_handle") != null;
        boolean mats=request.getParameter("mats") != null;
        boolean wheelCaps=request.getParameter("wheel_caps") != null;
        boolean mudFlaps=request.getParameter("mud_flaps") != null;
        boolean sterio=request.getParameter("sterio") != null;
        boolean clockOrPhoto=request.getParameter("clock_or_photo") != null;
        String other=request.getParameter("other");
       
 
		JobcardInfo ji = new JobcardInfo();
		ji.setVehicleNumber(vehicleNumber);
		ji.setWorkType(workType);
		ji.setDeliveryDate(deliveryDate);
		ji.setDeliveryTime(deliveryTime);
		ji.setStatus(status);
		ji.setRunningKm(runningKm);
		ji.setAvailableFuel(availableFuel);
		
		JcAccessories jca=new JcAccessories();
		jca.setJobcardNumber(jobcardNumber);
		jca.setToolkit(toolkit);
		jca.setSpareWheel(spareWheel);
		jca.setJackAndHandle(jackAndHandle);
		jca.setMats(mats);
		jca.setWheelCaps(wheelCaps);
		jca.setMudFlaps(mudFlaps);
		jca.setSterio(sterio);
		jca.setClockOrPhoto(clockOrPhoto);
		jca.setOther(other);
		
		CustomerInfo ci= CustomerInfoDao.getAllByNumber(vehicleNumber);
		int model_id=VehicleInfoDao.getModelByNumber(vehicleNumber);
		String modelName=VehicleModelDao.getModelName(model_id);
		
		
		int status1=JobcardInfoDao.update(ji);
		int status2=JcAccessoriesDao.update(jca);
		
		
		 if(status1>0 & status2>0){  
			 URL oracle = new URL("http://localhost:8080/JCPS5.0/serviceadvisor/jobcardview.jsp?id="+jobcardNumber);
		        BufferedReader in = new BufferedReader(
		        new InputStreamReader(oracle.openStream()));
		        String inputLine,jobCard="";
		        while ((inputLine = in.readLine()) != null)
		            jobCard=jobCard + inputLine;
		        in.close();
		    
		        
		        try {
		            // create the API client instance
		        	 Pdfcrowd.HtmlToPdfClient client = new Pdfcrowd.HtmlToPdfClient("jcps", "ed685ade75f2fcf75e7ce17c0ef4032d");
		            client.setPageDimensions("20in", "12in");
		            // run the conversion and write the result to a file
		            client.convertStringToFile(jobCard, "F://Hackathon/"+jobcardNumber+".pdf");
		        }
		        catch(Pdfcrowd.Error why) {
		            // report the error
		            System.err.println("Pdfcrowd Error: " + why);

		            // handle the exception here or rethrow and handle it at a higher level
		            throw why;
		        }
		        catch(IOException why) {
		            // report the error
		            System.err.println("IO Error: " + why.getMessage());

		            // handle the exception here or rethrow and handle it at a higher level
		            throw why;
		        }

		      String path =  "F://Hackathon/"+jobcardNumber+".pdf" ;
		        
			 String msg = "Hello <b>" + ci.getCustomerName() + "</b>,<br> A Jobcard is created for your car  <b>" + modelName + "</b> and Vehicle No. <b>" + vehicleNumber
						+ "</b>. <br>";
		      //  HttpSession session = request.getSession();
			 AttachmentThread at = new AttachmentThread();
			 at.StartThread(ci.getCustomerEmail(), msg, "Creation Of Jobcard.",path);
			 
			 		if(ji.getWorkType().equals("Insurance") ) {
			 			response.sendRedirect("serviceadvisor/insurancedetailform.jsp?id="+vehicleNumber);
			 			
			 		} else {
			 
			 				response.sendRedirect("serviceadvisor/jobcardviewall.jsp?id="+jobcardNumber);
			 		}
		        }else{  
		            out.println("Allready Exist Vehicle Number & Status pending or Completed");  
		            
		        }  
		          
		        out.close();  
		
	}

}
