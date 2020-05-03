<%@page import="modal.AppointmentDao"%>
<%@page import="controller.CheckAllocation"%>
<%@ include file="../header.html" %>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.VehiclePartDetailsDao"%>
<%@page import="modal.VehiclePartDetails"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="modal.VehicleServiceDetailsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.VehicleLubricantDetails"%>
<%@page import="modal.VehicleLubricantDetailsDao"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.VehiclePartDetailsDao"%>
<%@page import="modal.VehiclePartDetails"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="modal.VehicleServiceDetailsDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.VehicleLubricantDetails"%>
<%@page import="modal.VehicleLubricantDetailsDao"%>
<% String vehicleNumber = (String)session.getAttribute("officer_username");
       int model_varient_id=VehicleInfoDao.getVarientByNumber(vehicleNumber);
  
       %>
<script type="text/javascript">

function getSuggestions()
{
	var running_km = document.getElementById("running_km").value;
	$.ajax({
	    type: "POST",
	    url: "getServices.jsp",
	    data: {
	   		running_km: running_km,
	   		model_varient_id : <%=model_varient_id %>,
	   		vehicleNumber : '<%=vehicleNumber%>'
	   },
	   cache: false,
	   success: function(response)
	   {
		   
	    	$("#suggested_services").html(response);
	  }
	});
	$.ajax({
	    type: "POST",
	    url: "getLubricants.jsp",
	    data: {
	    	running_km: running_km,
	    	model_varient_id : <%=model_varient_id %>,
	    	vehicleNumber : '<%=vehicleNumber%>'
	   },
	   cache: false,
	   success: function(response)
	   {		   
	    $("#suggested_lubricants").html(response);
	  }
	});
}





 function checkStatus(){
	 <%
		 boolean status= AppointmentDao.checkVehicleNumberAppointment(vehicleNumber);
	     if(	status){
	   	  response.sendRedirect("AllocationError.jsp");
	     }
     %>
 }
</script>

<body onload=checkStatus()>	
       
        
    <!-- openable navbar -->
    <header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
             <h3 class="w3-bar-item">Menu</h3>
        <a href="customerDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
        <a href="pasthistoryview.jsp" class="w3-bar-item w3-button">view Past History</a>
        <a href="#" class="w3-bar-item w3-button">Service List</a>
        </div>
    </header>
    
    <script type="text/javascript">
    	function addComplain(vehicleNumber)
    	{
    		var complain=document.getElementById("customer_complain").value;
    		$.ajax({
    		    type: "POST",
    		    url: "addcomplain.jsp",
    		    data: {
    		     complain : complain,
    		     vehicleNumber : vehicleNumber
    		   },
    		   cache: false,
    		   success: function(response)
    		   {
    			   document.getElementById("customer_complain").value='';
    		    $("#addedComplains").html(response);
    		  }
    		});
    	}
    	function removeComplain(complain_id,vehicleNumber)
    	{
    		var complain=document.getElementById("customer_complain").value;
    		$.ajax({
    		    type: "POST",
    		    url: "removecomplain.jsp",
    		    data: {
    		     complain_id : complain_id,
    		     vehicleNumber : vehicleNumber
    		   },
    		   cache: false,
    		   success: function(response)
    		   {
    		    $("#addedComplains").html(response);
    		  }
    		});
    	}
    	
    	
    </script>
    
    <script>
  
 function serviceAdd(serviceid,vehicleNumber)
 {
   $.ajax({
    type: "POST",
    url: "cart/serviceadd.jsp",
    data: {
     service_id : serviceid,
     vehicleNumber : vehicleNumber,
     reload_flag: 0
   },
   cache: false,
   success: function(response)
   {
    $("#addedServices").html(response);
  }
}); 
 }
 function lubricantAdd(lubricantid,vehicleNumber)
 {
   $.ajax({
    type: "POST",
    url: "cart/lubricantadd.jsp",
    data: {
     lubricant_id : lubricantid,
     vehicleNumber: vehicleNumber,
     reload_flag: 0
   },
   cache: false,
   success: function(response)
   {
    $("#addedLubricants").html(response);
  }
}); 
 }
 
 function serviceReload()
 {
  $.ajax({
    type: "POST",
    url: "cart/serviceadd.jsp",
    data: {
    	vehicleNumber : '<%=vehicleNumber%>	',
     reload_flag : 1
   },
   cache: false,
   success: function(response)
   {
    $("#addedServices").html(response);
  }
}); 
   $.ajax({
     type: "POST",
     url: "cart/lubricantadd.jsp",
     data: {
    	 vehicleNumber : '<%=vehicleNumber %>',
      reload_flag : 1
    },
    cache: false,
    success: function(response)
    {
     $("#addedLubricants").html(response);
   }
 });
   $.ajax({
     type: "POST",
     url: "cart/partadd.jsp",
     data: {
    	 vehicleNumber : '<%=vehicleNumber%>',
      reload_flag : 1
    },
    cache: false,
    success: function(response)
    {
     $("#addedParts").html(response);
   }
 });
 }
 window.onload= serviceReload;

</script>

	
	<% String id = request.getParameter("id");
	if(id.equals(""))
	{
		id = "disabled";
	}
	%>
  
    <main id="main">
        <div class="my-new-header">
            <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&#9776;</button>
            <span>JCMS</span>
        </div>
        <div class="container-95">
            <div class="my-form" id="verify-static-details">
                <div class="my-form-heading">
                    <center><i class="fa fa-car"></i><%= vehicleNumber %></center>
                </div><br>
                <div class="col-md-12">
                <div class="row">
                    <form action="../UpdateAppointment?id=<%= vehicleNumber %>" method="POST" id="updateForm">
                    	<div class="row">
                    		<div class="col-md-6">
                    			<table class="table table-striped">
		                  			<tr>
		                  				<td><label for="running_km">Running KM</label></td>
		                  				<td><input type="text" name="running_km" id="running_km" <%=id.equals("enabled")?"onkeyup='getSuggestions()'":" " %>></td>
		                  				 <td><%= id.equals("disabled")?"<a class='btn btn-secondary btn-sm' href='appointment.jsp?id=enabled'>For enable suggestions</a>":"<a class='btn btn-secondary btn-sm' href='appointment.jsp?id=disabled'>For disable suggestions</a>" %></td>                 				
		                  		
		                  			</tr>
		                  			<tr>
		                  				<td><label for="work_type">Work Type</label></td>
		                  				<td><select name="work_type" id="work_type" required="required">
		                                	<option>-----</option>
		                                    <option value="free service">Free Service</option>
		                                    <option value="paid service">Paid Service</option>
		                                </select></td> 
		                               	</tr>
		                  		</table>
                    		</div>
                    		<div class="col-md-6">
                    			<table class="table table-striped">
		                  			<tr>
		                  				<td><label for="adate">Request Appointment Date:</label></td>
		                  				<td> <input type="date" name="request_date" id="appintment_date" required="required"></td>                  				
		                  			</tr>
		                  			<tr>
		                  				<td><label for="atime">Request Appointment Time:</label></td>
		                  				<td><input type="time" name="request_time" id="appintment_time" required="required"></td>                  				
		                  			</tr>                  			
		                  		</table>
                    		</div>                    		
                    	</div>
                  		
                  		
                    </form>
                    <br>
                    
                    
                    
                    
                    
                    
                      	
                 
                    
                </div>
            </div>
                    
                    
                    
                    
     

        <div class="my-form-heading">
            <h5>Add Jobs</h5>
        </div>
       <div class="row my-form-row">
                    
                    <div class="col-md-4">
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
                                    <button type="button" class="btn btn-primary btn-sm" form="customer_complain_form" onclick="addComplain('<%=vehicleNumber%>')">Add</button>
                                </div>
                            </div>
                        </form>
                        </div>

                        
                        
                        
            <div class="col-md-4" id="suggested_services">
           <%  if(id.equals("disabled")){ %>
                 <table id="data-table-simple-2" class="table table-striped">
                    <thead>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Add</th>
                    </thead>
                    <%     
      List<VehicleServiceDetails> list1 = VehicleServiceDetailsDao.getServices(model_varient_id);
      Iterator<VehicleServiceDetails> itr1=list1.iterator();  
      while(itr1.hasNext()){ 
    	  VehicleServiceDetails vsd = itr1.next();
      %>
                    <tbody>
                    <tr>
                    <td><%= vsd.getServiceName() %></td>
         			<td><%= vsd.getServiceDetails() %></td>
         			<td><%=vsd.getServicePrice() %></td>
         			<td><a href="javascript:void(0)" onclick="serviceAdd('<%= vsd.getServiceId() %>','<%= vehicleNumber %>')"> + </a></td>
                    </tr>           
            
            <%
      }
            %>
             </table> 
             <%} %>
             </div>
             
             
           
           
            <div class="col-md-4" id="suggested_lubricants">
            <% if(id.equals("disabled")) { %>
                 <table id="data-table-simple-3" class="table table-striped"  >
                          <thead>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity()</th>
                        <th>Add</th>
                    </thead>

    <% 
       
      List<VehicleLubricantDetails> list3 = VehicleLubricantDetailsDao.getLubricants(model_varient_id);
      Iterator<VehicleLubricantDetails> itr3=list3.iterator();  
      while(itr3.hasNext())
      { 
    	  VehicleLubricantDetails vld1 = itr3.next();
     %>   
                    <tbody>
                        <tr>
                            <td><%= vld1.getLubricantName() %></td>
                           <td><%= vld1.getLubricantPrice() %></td>
                            <td><%= vld1.getLubricantQuantity() %></td>
                            <td><a href="javascript:void(0)" onclick="lubricantAdd('<%=vld1.getLubricantId()%>','<%= vehicleNumber %>')"> + </a></td>                          
                        </tr>
                    </tbody>
      <%
      }
      %>
      </table> 
      <% } %>
            </div>
        </div>
           
           
           
           
           
           
           
           
           
           
           
        <!-- added servings tables goes here -->
        <div class="my-form-heading">
            <h5>Added Jobs</h5> 
        </div>
        <div class="row mt-3 container-95">
            <div class="col-md-4" id="addedComplains">
                <table id="data-table-simple-4" class="table table-striped">
                    <thead>
                        <tr>
                                        <th>Complains</th>
                                        <th>Remove</th>
                                    </tr>
                    </thead>
                    <tbody>
                       <!-- data -->
                    </tbody>
                </table>     
            </div>
            
            
           
            
            
            
            <div class="col-md-4" id="addedServices">
                <table id="data-table-simple-5" class="table table-striped">
                    <thead>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Remove</th>
                    </thead>
                    <tbody>
                        <!-- data -->
                    </tbody>
                </table>
            </div>
            
            <div class="col-md-4" id="addedLubricants">
  
                <table id="data-table-simple-6" class="table table-striped">
                    <thead>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Remove</th>
                    </thead>
                 <!--  data  -->
                </table>     
            </div>
        </div>
        
        
         <div class="my-submit-div">
                    <center>
                        <input type="submit" name="submit" id="submit" class="btn btn-secondary btn-sm" form="updateForm">
                    </center>                    
                </div>
            </div>
        </div>
    <script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
</script>
    </main> 

    <%@ include file="../footer.html" %>