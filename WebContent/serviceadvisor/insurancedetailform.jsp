<%@include file="../header.html"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.JobcardInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
  <body>
   <% String vehicle_number = request.getParameter("id"); 
   String officer_username = (String)session.getAttribute("officer_username");
    	String officer_name = (String)session.getAttribute("officer_name");
    	String officer_role = (String)session.getAttribute("officer_role");
    	int jobcard_number = JobcardInfoDao.getJNByNumber(vehicle_number);
    	VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicle_number);
    	CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
    	int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
		String company_model = VehicleModelDao.getModelName(vehicle_model_id);
		JobcardInfo ji = JobcardInfoDao.getTempByNumber(jobcard_number);
    %>	
     <!-- openable navbar -->
  <%@include file="saSidebar.jsp" %>

    <main id="main">

         <%@include file="../navbar.jsp" %>


        <form action="../SaveInsuranceForm" class="my-form container-95" method="POST">
            <div class="my-form-heading"> 
                <h5>Insurance Detail Form</h5> 
            </div>
            <div class="container-95 mb-5">
                <div class="row my-form-row">
                    <h6>Insurance Details</h6>                    
                    <div class="col-md-6">  
                                              
                        <div class="row">
                            <div class="col-md-2">
                                <label for="ro_number">Jobcard Number</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="jobcard_number" id="jobcard_number"  value='<%=jobcard_number %>' readonly>
                            </div>
                            <div class="col-md-2">
                                <label for="vin">VIN</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="vin" id="vin" value = '<%=vi.getVinNumber()%>' readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="vehicle_number">Vehicle Number</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="vehicle_number" id="vehicle_number" value = '<%=vehicle_number %>' readonly>
                            </div>
                             <div class="col-md-2">
                                <label for="customer_contact">Contact</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="customer_contact" id="customer_contact" value = '<%=ci.getCustomerContact() %>' readonly>
                            </div>                          
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="customer_name">Customer Name</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="customer_name" id="customer_name" value = '<%=ci.getCustomerName() %>' readonly>
                            </div>
                            <div class="col-md-2">
                                <label for="customer_email">Email</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="customer_email" id="customer_email" value = '<%=ci.getCustomerEmail() %>' readonly>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-md-6">                        
                        <div class="row">
                        <div class="col-md-2">
                                <label for="policy_number">Policy Number</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="policy_number" id="policy_number">
                            </div>
                            <div class="col-md-2">
                                <label for="insurance_company">Insurance Company</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="insurance_company" id="insurance_company">
                            </div>
                            <div class="col-md-2">
                                <label for="insurance_type">Insurance Types</label>
                            </div>
                            <div class="col-md-4">
                                <select name="insurance_type" id="insurance_type" required>
                                	<option disabled selected>-----</option>
                                    <option value="full_insurance">Full insurance</option>
                                    <option value="double_benefit">Double benefit</option>
                                    <option value="third_party">Third party</option>                                    
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label for="expiry_date">Expiry Date</label>
                            </div>
                            <div class="col-md-4">
                                <input type="date" name="expiry_date" id="expiry_date" >
                            </div>
                            <div class="col-md-2">
                                <label for="date_of_loss">Date Of Loss</label>
                            </div>
                            <div class="col-md-4">
                                <input type="date" name="date_of_loss" id="date_of_loss" >
                            </div>
                          	 <div class="col-md-2">
                                <label for="location">Location</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="location" id="location" >
                            </div>
                        </div>                  
                    </div>
                </div>             
                </div>
                <div class="my-submit-div">
                    <center>
                        <input type="submit" name="submit" id="submit" class="btn btn-secondary btn-sm">
                    </center>                    
                </div>
            </div>
        </form>
    </main>

<%@include file="../footer.html"%>