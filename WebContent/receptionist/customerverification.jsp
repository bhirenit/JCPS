<%@page import="modal.VehicleModelVarientDao"%>
<%@page import="modal.VehicleCompanyDao"%>
<%@include file="../header.html" %>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.awt.*"%>
<%@page import="modal.OfficerInfo" %>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.CustomerInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
    
    
<body>	
        
    <!-- openable navbar -->
     <%@include file="receptionistSidebar.html" %>
     
    <main id="main">
         <%@include file="../navbar.jsp" %>

       <div class="container-95">
            <div class="my-form" id="verify-static-details">
                <div class="my-form-heading">
                    <h5>Verify Details</h5>
                </div>
                
                
                <div class="container-95">
                    <div class="customer-verification-info">
                        <div class="row">
                            <div class="col-md-1">
                                <i class="fa fa-car" style="font-size: 50px;"></i>
                            </div>
                            
                            
                             <%
			String vehicle_number = (String) session.getAttribute("vehicle_number");
			CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
			VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicle_number);
			int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
			int vehicle_company_id=	vi.getVehicleCompany();	
			String company_model = VehicleModelDao.getModelName(vehicle_model_id);
			String company_name = VehicleCompanyDao.getCompanyName(vehicle_company_id);
			String model_varient_name =VehicleModelVarientDao.getVarientName(vehicle_model_id);
			
		%>
                    <div class="col-md-11 customer-verification-info-vehicle-number">
                        <%=session.getAttribute("vehicle_number") %>
                    </div>
                </div>
                           
        
                        <div class="row my-form-row">
                            <div class="col-md-6">
                                <h6>Customer's Details</h6>
                                <table class="table table-striped table-hover customer-verification-info-table">
                                    <tbody>
                                        <tr>
                                            <th>Name</th>
                                                <td><%= ci.getCustomerName() %></td>
                                        </tr>
                                        <tr>
                                            <th>Contact</th>
                                                <td><%= ci.getCustomerContact() %></td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                                <td><%= ci.getCustomerEmail() %></td>
                                        </tr>                                        
                                        <tr>
                                            <th width="40%">Aadhaar Number</th>
                                                <td><%= ci.getCustomerAadhaar() %></td>
                                        </tr>
                                        <tr>
                                            <th>Lisence Number</th>
                                                 <td><%= ci.getCustomerLicense() %></td>
                                        </tr> 
                                        <tr>
                                            <th>Customer Type</th>
                                               <td><%= ci.getCustomerType() %></td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                                 <td><%= ci.getCustomerAddress() %></td>
                                        </tr>
                                        <tr>
                                            <th>City</th>
                                                 <td><%= ci.getCustomerCity() %></td>
                                        </tr>
                                        <tr>
                                            <th>State</th>
                                                <td><%= ci.getCustomerState() %></td>
                                        </tr>
                                        <tr>
                                            <th>Pincode</th>
                                                 <td><%= ci.getPincode() %></td>
                                        </tr>
                                                                                                
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-md-6">
                                <h6>Vehicle's Details</h6>
                                <table class="table table-striped table-bordered customer-verification-info-table">
                                    <tbody>
                                        <tr>
                                            <th>Vehicle Number</th>
                                                <td><%= vi.getVehicleNumber() %></td>
                                        </tr>
                                        <tr>
                                            <th>VIN</th>
                                                <td><%= vi.getVinNumber() %></td>
                                        </tr>
                                        <tr>
                                            <th>Engine Number</th>
                                                <td><%= vi.getEngineNumber() %></td>
                                        </tr>
                                        <tr>
                                            <th>Company</th>
                                                <td><%= company_name %></td>
                                        </tr>
                                        <tr>
                                            <th>Model</th>
                                                <td><%= company_model %></td>
                                        </tr>
                                        <tr>
                                            <th>Varient</th>
                                                <td><%= model_varient_name %></td>
                                        </tr>
                                        <tr>
                                            <th>Fuel Type</th>
                                                <td><%= vi.getFuelType() %></td>
                                        </tr>
                                        <tr>
                                            <th>Vehicle Type</th>
                                                <td><%= vi.getVehicleType() %></td>
                                        </tr> 
                                        <tr>
                                            <th>RC Number</th>
                                                <td><%= ci.getCustomerRc() %></td>
                                        </tr>
                                        <tr>
                                            <th>Exterior Color</th>
                                                <td><%= vi.getExteriorColor() %></td>
                                        </tr>           
                                        <tr>
                                            <th>Interior Color</th>
                                                <td><%= vi.getInteriorColor() %></td>
                                        </tr>                    
                                    </tbody>
                                </table>
                            </div>                    
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md"></div>
                        <div class="col-md-1">
                            <button class="btn btn-secondary my-btn btn-lg" onclick="editButtonClicked()">Edit</button>
                        </div>
                        <div class="col-md"></div>
                    </div>
                </div>
            </div>
            <form class="my-form" id="edit-form" method="post" action="../UpdateCustomer">
                    <div class="my-form-heading">
                        <h5>Edit Details</h5>
                    </div>
                    
                    <div class="container-95">                                           
                                    <div class="row my-form-row">
                                        <h6>Customer Details</h6>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_name">Name</label>                                    
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_name" id="customer_name" value='<%= ci.getCustomerName() %>'>
                                                </div>
                                            </div>
                                        </div>                    
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_email">Email</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_email" id="customer_email" value='<%= ci.getCustomerEmail() %>'>
                                                </div>
                                            </div>                        
                                        </div>                    
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_contact">Contact Number</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_contact" id="customer_contact" value='<%= ci.getCustomerContact() %>'>
                                                </div>
                                            </div>                                            
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_type">Customer Type</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <select name="customer_type" id="customer_type">
                                                        <option value="individual" <% if(ci.getCustomerType().equals("individual")) {out.print("selected");} %>>Individual</option>
                                                        <option value="corporate" <% if(ci.getCustomerType().equals("corporate")) {out.print("selected");} %>>Corporate</option>
                                                    </select>
                                                </div>
                                            </div>                                                
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_aadhaar">Aadhaar Number</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_aadhaar" id="customer_aadhaar" value='<%= ci.getCustomerAadhaar() %>'>
                                                </div>
                                            </div>                                                
                                        </div>                    
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_license">License Number</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_license" id="customer_license" value='<%= ci.getCustomerLicense() %>'>
                                                </div>
                                            </div>                                                
                                        </div>                                                                    
                                    </div>
                                    <div class="row my-form-row">
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="Address">Address</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <textarea name="customer_address" id="customer_address" cols="16" rows="2" ><%= ci.getCustomerAddress() %></textarea>
                                                </div>
                                            </div>                                                
                                        </div> 
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_city">City</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_city" id="customer_city" value='<%= ci.getCustomerCity() %>'>
                                                </div>
                                            </div>                                                
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_state">State</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_state" id="customer_state" value='<%= ci.getCustomerState() %>'>
                                                </div>
                                            </div>                                                
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="pincode">Pincode</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="pincode" id="pincode" value='<%= ci.getPincode() %>'>
                                                </div>
                                            </div>                                                
                                        </div>                                                     
                                    </div>
                                    <div class="row my-form-row">
                                        <h6>Customer's Vehicle Details</h6>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="vehicle_number">Vehicle No.</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="vehicle_number" id="vehicle_number" readonly value=<%=session.getAttribute("vehicle_number") %>>
                                                </div>
                                            </div>                                                
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="vin_no">VIN</label>                                
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="vin_number" id="vin_number" value='<%= vi.getVinNumber() %>' readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="engine_no">Engine No.</label>                                
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="engine_number" id="engine_number" value='<%= vi.getEngineNumber() %>' readonly>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="fuel_type">Fuel Type</label>                                
                                                </div>
                                                <div class="col-md-8">
                                                    <select name="fuel_type" id="fuel_type">
                                                        <option value="petrol"  <% if(vi.getFuelType().equals("petrol")) {out.print("selected");}  %>>Petrol</option>
                                                        <option value="diesel"  <% if(vi.getFuelType().equals("diesel")) {out.print("selected");} %>>Diesel</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="interior_color">Interior color</label>                                
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="interior_color" id="interior_color" value='<%= vi.getInteriorColor() %>'>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="exterior_color">Exterior Color</label>                                
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="exterior_color" id="exterior_color" value='<%= vi.getExteriorColor() %>' >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="customer_rc">RC Number</label>                                
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="text" name="customer_rc" id="customer_rc" value='<%= ci.getCustomerRc() %>' >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="vehicle_type">Vehicle Type</label>                                
                                                </div>
                                                <div class="col-md-8">
                                                    <select name="vehicle_type" id="vehicle_type">
                                                        <option value="passenger"  <% if(vi.getVehicleType().equals("passenger")) {out.print("selected");}  %>>Passenger</option>
                                                        <option value="taxi"  <% if(vi.getVehicleType().equals("taxi")) {out.print("selected");}  %>> Taxi</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>                    
                                    </div>
                                 
                                     <div class="row">
                            <div class="col-md"></div>
                            <div class="col-md-1">
                                <button class="btn btn-secondary my-btn btn-sm">Update</button>
                            </div>
                            <div class="col-md-1">
                                <button class="btn btn-secondary my-btn btn-sm" onclick="cancelButtonClicked()">Cancel</button>
                            </div>
                            <div class="col-md"></div>
                        </div>
                                </div>                                   
                            </form>                       
                    </div>
                
                <form action="../AllocateServiceAdvisor" method="post">
                        <div class="row officer-select">
                            <div class="col-md"></div>
                            <div class="col-md-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="officer_id">
                                            <center>
                                                <h4>Service Advisor</h4>
                                            </center>                                            
                                        </label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <select name="officer_username" id="officer_username" required>
                                            <option disabled="disabled" selected>---------</option>
                                             <%
                                    	List<OfficerInfo> list = OfficerInfoDao.getByOfficerRole("service_advisor");
                                    	Iterator<OfficerInfo> itr = list.iterator();
                                    	while(itr.hasNext()) {
                                    		OfficerInfo oi = itr.next();
                                    		int count = JobcardInfoDao.getTotal(oi.getOfficerUsername(),"pending") + JobcardInfoDao.getTotal(oi.getOfficerUsername(),"arrived");
											out.print("<option value="+ oi.getOfficerUsername() +"> "+ oi.getOfficerName() +" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+count+ " </option>");
                                    	}
                                    %>                                       
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                 <input type="hidden" name="vehicle_number" value="<%= vehicle_number %>">
                                    <div class="col-md-12">
                                        <input type="submit" name="submit" id="submit" value="Allocate" class="btn btn-secondary btn-sm">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md"></div>
                        </div>
                    </form>
        </div>
    </main>
    

 <%@ include file="../footer.html" %> 