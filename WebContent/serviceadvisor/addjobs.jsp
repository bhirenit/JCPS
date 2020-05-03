<%@page import="modal.AdvisorSolutionDao"%>
<%@page import="modal.AdvisorSolution"%>
<%@page import="modal.CustomerComplainDao"%>
<%@page import="modal.CustomerComplain"%>
<%@include file="../header.html" %>

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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<body>	
<%   String vehicle_number=request.getParameter("id");
	int model_varient_id=VehicleInfoDao.getVarientByNumber(vehicle_number);
	int jobcardNumber = JobcardInfoDao.getJNByNumber(vehicle_number);
		CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
		VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicle_number);
		int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
		String company_model = VehicleModelDao.getModelName(vehicle_model_id);
		JobcardInfo jc =JobcardInfoDao.getAllByNumber(vehicle_number);
		OfficerInfo oi=OfficerInfoDao.getByUsername(jc.getOfficeUsername());
		
%>
<script>
  function partAdd(partid,jobcardNumber,partprice,partrepairflag)
  {
   $.ajax({
    type: "POST",
    url: "cart/partadd.jsp",
    data: {
     part_id : partid,
     jobcardNumber :jobcardNumber,
     reload_flag: 0,
     part_price : partprice,
     part_repair_flag : partrepairflag
   },
   cache: false,
   success: function(response)
   {
    $("#addedParts").html(response);
  }
});
 }
 function serviceAdd(serviceid,jobcardNumber)
 {
   $.ajax({
    type: "POST",
    url: "cart/serviceadd.jsp",
    data: {
     service_id : serviceid,
     jobcardNumber : jobcardNumber,
     reload_flag: 0
   },
   cache: false,
   success: function(response)
   {
    $("#addedServices").html(response);
  }
}); 
 }
 function lubricantAdd(lubricantid,jobcardNumber)
 {
   $.ajax({
    type: "POST",
    url: "cart/lubricantadd.jsp",
    data: {
     lubricant_id : lubricantid,
     jobcardNumber: jobcardNumber,
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
     jobcardNumber : <%=jobcardNumber%>,
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
      jobcardNumber : <%=jobcardNumber %>,
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
      jobcardNumber : <%=jobcardNumber%>,
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
 function repairClicked(partid) {
     var pp = document.getElementById("part_price"+partid);
     var prf = document.getElementById("part_repair_flag"+partid);

     pp.readOnly = false;    
     prf.value = "1";
     pp.value = "";
     pp.focus();
   }
</script>
<%@include file="saSidebar.jsp" %>
    <main id="main">
        <%@include file="../navbar.jsp" %>
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="saDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="pendinglist.jsp">Pending List</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add Jobs</li>
            </ol>
        </nav>  
        
         <div class="row my-form-row">
                    <div class="col-md-6">
                        <h6>Customer's Details</h6>
                        <table class="table table-striped table-bordered customer-verification-info-table">
                            <tbody>
                                <tr>
                                    <th>Name</th>
                                        <td><%=ci.getCustomerName() %></td>
                                </tr>
                                <tr>
                                    <th>Contact</th>
                                        <td><%=ci.getCustomerContact() %></td>
                                </tr>
                                <tr>
                                    <th>Car Model</th>
                                        <td><%= company_model %></td>
                                </tr>
                                <tr>
                                    <th>Fuel Type</th>
                                        <td><%= vi.getFuelType() %></td>
                                </tr>
                                <tr>
                                    <th> Available Fuel </th>
                                        <td> <%= jc.getAvailableFuel() %></td>
                                </tr>
                                <tr>
                                    <th>Service Advisor</th>
                                        <td><%= oi.getOfficerName()  %></td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6">
                        <h6>Jobcard's Details</h6>
                        <table class="table table-striped table-bordered customer-verification-info-table">
                            <tbody>
                                <tr>
                                    <th>Vehicle Number</th>
                                        <td><%= vehicle_number %></td>
                                </tr>
                                <tr>
                                    <th>Jobcard Number</th>
                                        <td> <%= jc.getJobcardNumber() %></td>
                                </tr>
                                <tr>
                                    <th>Running Km </th>
                                        <td><%= jc.getRunningKm() %></td>
                                </tr>
                                <tr>
                                    <th>Work Type</th>
                                        <td><%= jc.getWorkType() %> </td>
                                </tr>
                                <tr>
                                    <th>Delivery Date</th>
                                        <td><%= jc.getDeliveryDate() %></td>
                                </tr>
                                <tr>
                                    <th>Delivery Time</th>
                                        <td><%= jc.getDeliveryTime() %></td>
                                </tr>                                
                            </tbody>
                        </table>
                    </div>                    
                </div>
        
        <div class="row">
			 <div class="col-md-6">
			 	<table class="table table-striped">
				 	<tr>
				 		<th>Customer Requests</th>			 					 		
				 	</tr>
				 	<%
				 	List<CustomerComplain> list = CustomerComplainDao.getAll(jobcardNumber);
					Iterator<CustomerComplain> itr = list.iterator();
					%>
					<% 
					while(itr.hasNext())
					{
						CustomerComplain cc = itr.next();
						%>						
				                                        <tr>
				                                            <td><%= cc.getCustomerComplain() %></td>
				                                            
				                                        </tr>
				                                    
					
				<%
					}
				%>
				</table>
				 
			 </div>
			 <div class="col-md-6">
			 	<table class="table table-striped">
				 	<tr>
				 		<th>Advisor's Solutions</th>			 					 		
				 	</tr>
				 	<%
				 	List<AdvisorSolution> list5 = AdvisorSolutionDao.getAll(jobcardNumber);
					Iterator<AdvisorSolution> itr5 = list5.iterator();
						while (itr5.hasNext()) {
							AdvisorSolution as = itr5.next();			
					%>		
						<tr>
							<td><%=as.getDescription()%></td>							
						</tr>
					
				
					<%
						}
					%>
					
				</table>

			 </div>
        </div>
        

        <div class="my-form-heading">
            <h5>Add Jobs</h5>
        </div>
        <div class="row mt-3 mb-5 container-95">
            <div class="col-md-4">
                <table id="data-table-simple-1" class="table table-striped">
                    <thead>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Add</th>
                        <th>Repair</th>
                    </thead>
                    <%
				     
				      List<VehiclePartDetails> list2 = VehiclePartDetailsDao.getParts(model_varient_id);
				      Iterator<VehiclePartDetails> itr2 = list2.iterator();
				      while (itr2.hasNext()) 
				      {
				    	  VehiclePartDetails vpd2 =  itr2.next();
				      %>
                    <tbody>
                        	<tr>
				         	<td><%= vpd2.getPartName() %></td>
				         	<td><input type="text" name="part_price" value="<%= vpd2.getPartPrice() %>"	id="part_price<%= vpd2.getPartId() %>" readonly required style="width:60px;">
				         	<input	type="hidden" name="part_repair_flag" value="0" id="part_repair_flag<%= vpd2.getPartId() %>">
				         	</td>
				         	<td ><a href="javascript:void(0)" onclick="partAdd('<%= vpd2.getPartId() %>','<%= jobcardNumber %>', document.getElementById('part_price<%= vpd2.getPartId() %>').value, document.getElementById('part_repair_flag<%= vpd2.getPartId()%>').value)"> +</a></td>
				         	<td><a href="javascript:void(0)" onclick="repairClicked('<%= vpd2.getPartId()%>')">repair</a></td>
				         	</tr>      
                    </tbody>
                    
      <%
      }
      %>
                </table>
            </div>
            <div class="col-md-4">
                <table id="data-table-simple-2" class="table table-striped">
                    <thead>
                        <th>Name</th>
                        
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
         			<td data-toggle="tooltip" data-placement="bottom" title="<%= vsd.getServiceDetails() %>" >  <%= vsd.getServiceName() %></td>
         			<td><%=vsd.getServicePrice() %></td>
         			<td><a href="javascript:void(0)" onclick="serviceAdd('<%= vsd.getServiceId() %>','<%= jobcardNumber %>')"> + </a></td>
                    </tr>           
            
            <%
      }
            %>
             </table>
             </div>
             
            <div class="col-md-4" >
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
                            <td><a href="javascript:void(0)" onclick="lubricantAdd('<%=vld1.getLubricantId()%>','<%= jobcardNumber %>')"> + </a></td>                          
                        </tr>
                    </tbody>
      <%
      }
      %>
      </table>
            </div>
        </div>
        <!-- added servings tables goes here -->
        <div class="my-form-heading">
            <h5>Added Jobs</h5>
        </div>
        <div class="row mt-3 container-95">
            <div class="col-md-4" id="addedParts">
                <table id="data-table-simple-4" class="table table-striped">
                    <thead>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Remove</th>
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
        <div class="row">
        	<div class="col-md"></div>
        	<div class="col-md-1">
        		<a href="pendinglist.jsp" class="btn btn-danger btn-md">Close</a>
        	</div>
        	<div class="col-md"></div>        	
        </div>            
    </main>
    <script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
</script>
    
 <%@include file="../footer.html" %>