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
  <script type="text/javascript">
    	function addComplain(jobcard_number)
    	{
    		var complain=document.getElementById("customer_complain").value;
    		$.ajax({
    		    type: "POST",
    		    url: "addcomplain.jsp",
    		    data: {
    		     complain : complain,
    		     jobcard_number : jobcard_number,
    		     reload_flag : 0
    		   },
    		   cache: false,
    		   success: function(response)
    		   {
    			   document.getElementById("customer_complain").value='';
    		    $("#addedComplains").html(response);
    		  }
    		});
    	}
    	function removeComplain(complain_id,jobcard_number)
    	{
    		var complain=document.getElementById("customer_complain").value;
    		$.ajax({
    		    type: "POST",
    		    url: "removecomplain.jsp",
    		    data: {
    		     complain_id : complain_id,
    		     jobcard_number : jobcard_number,
    		     reload_flag : 0
    		   },
    		   cache: false,
    		   success: function(response)
    		   {
    		    $("#addedComplains").html(response);
    		  }
    		});
    	}
    	function addSolution(jobcard_number)
    	{
    		var solution=document.getElementById("description").value;
    		var price=document.getElementById("price").value;
    		$.ajax({
    		    type: "POST",
    		    url: "addsolution.jsp",
    		    data: {
    		     solution : solution,
    		     price : price,
    		     jobcard_number : jobcard_number,
    		     reload_flag : 0
    		   },
    		   cache: false,
    		   success: function(response)
    		   {
    			   document.getElementById("description").value='';
    			   document.getElementById("price").value='';
    		    $("#addedSolutions").html(response);
    		  }
    		});
    	}
    	function removeSolution(solution_id,jobcard_number)
    	{
    		var solution=document.getElementById("description").value;
    		var price=document.getElementById("price").value;
    		$.ajax({
    		    type: "POST",
    		    url: "removesolution.jsp",
    		    data: {
    		    solution : solution,
       		     solution_id : solution_id,
    		     jobcard_number : jobcard_number,
    		     reload_flag : 0
    		   },
    		   cache: false,
    		   success: function(response)
    		   {
    		    $("#addedSolutions").html(response);
    		  }
    		});
    	}
    	 function reload()
    	 {
    		 var jobcard_number = <%=Integer.parseInt(request.getParameter("id"))%>; 
    	 
    	  $.ajax({
    	    type: "POST",
    	    url: "addcomplain.jsp",
    	    data: {
    	     jobcard_number : jobcard_number,
    	     reload_flag : 1
    	   },
    	   cache: false,
    	   success: function(response)
    	   {
    	    $("#addedComplains").html(response);
    	  }
    	}); 
    	  $.ajax({
      	    type: "POST",
      	    url: "addsolution.jsp",
      	    data: {
      	     jobcard_number : jobcard_number,
      	     reload_flag : 1
      	   },
      	   cache: false,
      	   success: function(response)
      	   {
      	    $("#addedSolutions").html(response);
      	  }
      	}); 
    	  
    	 }
    	 window.onload= reload;
    </script>
  <body>
   <% int jobcard_number = Integer.parseInt(request.getParameter("id")); 
   String officer_username = (String)session.getAttribute("officer_username");
    	String officer_name = (String)session.getAttribute("officer_name");
    	String officer_role = (String)session.getAttribute("officer_role");
    	String vehicle_number = JobcardInfoDao.getVNByNumber(jobcard_number);
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


        <form action="../SaveJobCard" class="my-form container-95" method="POST">
            <div class="my-form-heading">
                <h5>Job Card Form</h5>
            </div>
            <div class="container-95 mb-5">
                <div class="row my-form-row">
                    <h6>Details</h6>                    
                    <div class="col-md-6">  
                        <h6>Customer Details</h6>                      
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
                                <label for="company_model">Model</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="company_model" id="company_model" value = '<%=company_model %>' readonly >
                            </div>
                            <div class="col-md-2">
                                <label for="make">Make</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="make" id="make" value='<%=vi.getFuelType()%>' readonly>
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
                            <div class="col-md-2">
                                <label for="customer_contact">Contact</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="customer_contact" id="customer_contact" value = '<%=ci.getCustomerContact() %>' readonly>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h6>Other Details</h6>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="service_advisor">Service Advisor</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="service_advisor" id="service_advisor" value='<%=officer_name %>' readonly>
                            </div>
                            <div class="col-md-2">
                                <label for="work_type">Work Type</label>
                            </div>
                            <div class="col-md-4">
                                <select name="work_type" id="work_type" required>
                                	<option disabled selected>-----</option>
                                    <option value="free service">Free Service</option>
                                    <option value="paid service">Paid Service</option>
                                    <option value="running repair">Running Repair</option>
                                    <option value="Insurance">Insurance</option>
                                </select>
                            </div>
                            <div class="col-md-2">
                                <label for="arrival_date">Arrival Date</label>
                            </div>
                            <div class="col-md-4">
                                <input type="date" name="arrival_date" id="arrival_date" value='<%=ji.getArrivalDate()%>' readonly>
                            </div>
                            <div class="col-md-2">
                                <label for="arrival_time">Arrival Time</label>
                            </div>
                            <div class="col-md-4">
                                <input type="time" name="arrival_time" id="arrival_time" value='<%=ji.getArrivalTime()%>' readonly>
                            </div>
                          
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <label for="running_km">Running KM</label>
                            </div>
                            <div class="col-md-4">
                                <input type="text" name="running_km" id="running_km" required>
                            </div>
                            <div class="col-md-3">
                                <label for="available_fuel">Available Fuel</label>
                            </div>
                            <div class="col-md-3">
                                <input type="range" name="available_fuel" id="available_fuel" min="0" max="100">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row my-form-row">
                    <h6>Demand Code</h6>
                    <div class="col-md-6">
                        <h6>Customer's Requests</h6>
                        <!-- take care while nesting it -->
                        <!-- ALERT !!! -->
                        <!-- ask JASH for while you work on this form -->
                        <form action="" id="customer_complain_form">  
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="customer_complain">Customer's Complain</label>
                                </div>
                                <div class="col-md-9">
                                    <input type="text" name="customer_complain" id="customer_complain" form="customer_complain_form">
                                </div>
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary btn-sm" form="customer_complain_form" onclick="addComplain('<%=jobcard_number%>')">Add</button>
                                </div>
                            </div>
                        </form>
                        <div class="row mt-5">
                            <div class="col-md-12" id="addedComplains">
                                <table class="table table-hover">
                                    <tr>
                                        <th>Complains</th>
                                        <th></th>
                                    </tr>
                                    <!-- loop -->
                                    
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6" >
                        <h6>Advisor's Solutions</h6>
                        <!-- ALERT !!! -->
                        <!-- ask JASH for while you work on this form -->
                        <form action="" id="advisor_solution">
                            <div class="row">
                                <div class="col-md-6">
                                    <label for="description">Advisor's Solution</label>
                                </div>
                                <div class="col-md-3">
                                    <label for="price">Price</label>
                                </div>
                                <div class="col-md-3"></div>
                                <div class="col-md-6">
                                    <input type="text" name="description" id="description" form="advisor_solution">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" name="price" id="price" form="advisor_solution">
                                </div>                                    
                                <div class="col-md-3">
                                    <button type="button" class="btn btn-primary btn-sm" form="advisor_solution" onclick="addSolution('<%=jobcard_number%>')" >Add</button>
                                </div>
                            </div>
                        </form>
                        <div class="row mt-5">
                            <div class="col-md-12" id="addedSolutions">
                                <table class="table table-hover">
                                    <tr>
                                        <th>Solutions</th>
                                        <th>Price</th>
                                        <th></th>
                                    </tr>
                                   
                                   
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row my-form-row">
                    <div class="col-md-6">
                        <h6> Delivery</h6>
                        
                        <div class="row">
                            <div class="col-md-6">
                                <label for="delivery_date">Delivery Date</label>
                            </div>
                            <div class="col-md-6">
                                <input type="date" name="delivery_date" id="delivery_date" required> 
                            </div>
                            <br>
                           
                            <br>
                            <div class="col-md-6">
                                <label for="delivery_time">Delivery Time</label>
                            </div>
                            <div class="col-md-6">
                                <input type="time" name="delivery_time" id="delivery_time" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h6>Accessories</h6>
                        <div class="row">
                            <div class="col-md-3">
                                <input type="checkbox" name="toolkit" id="toolkit" class="my-checkbox">
                                <label for="toolkit" class="">Toolkit</label>
                            </div>
                            <div class="col-md-3">
                                <input type="checkbox" name="spare_wheel" id="spare_wheel" class="my-checkbox">
                                <label for="spare_wheel" class="">Spare Wheel</label>
                            </div>
                            <div class="col-md-3">
                                <input type="checkbox" name="jack_and_handle" id="jack_and_handle" class="my-checkbox">
                                <label for="jack_and_handle" class="">Jack & Handle</label>
                            </div>
                            <div class="col-md-3">
                                <input type="checkbox" name="mats" id="mats" class="my-checkbox">
                                <label for="" class="mats">Mats</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <input type="checkbox" name="wheel_caps" id="wheel_caps" class="my-checkbox">
                                <label for="wheel_caps" class="">Wheel Caps</label>
                            </div>
                            <div class="col-md-3">
                                <input type="checkbox" name="mud_flaps" id="mud_flaps" class="my-checkbox">
                                <label for="mud_flaps" class="">Mud Flaps</label>
                            </div>
                            <div class="col-md-3">
                                <input type="checkbox" name="sterio" id="sterio" class="my-checkbox">
                                <label for="sterio" class="">Sterio</label>
                            </div>
                            <div class="col-md-3">
                                <input type="checkbox" name="clock_and_photo" id="clock_and_photo" class="my-checkbox">
                                <label for="clock_and_photo" class="">Clock/Photo</label>
                            </div>
                             <div class="col-md-2">
                             <label for="other" class="">Other</label>
                             </div>
                             <div class="col-md-3">
                          
                                <input type="text" name="other" id="clock_and_photo">
                                
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