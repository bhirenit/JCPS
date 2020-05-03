<%@page import="modal.InsuranceDao"%>
<%@page import="modal.Insurance"%>
<%@include file="../header.html"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@include file="../header.html" %>
    <title>Hello, world!</title>  
  <body>
    <% String officer_username = (String)session.getAttribute("officer_username");
    	String officer_name = (String)session.getAttribute("officer_name");
    	String officer_role = (String)session.getAttribute("officer_role");
    %>
    
	<!-- openable navbar -->
    <%@include file="saSidebar.jsp" %>

    <!-- Page Content -->
    <main id="main">

         <%@include file="../navbar.jsp" %>
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="saDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Insurance Cars List</li>
            </ol>
        </nav>    
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Insurance Repaired Cars List</h4>
                </center>
            </div>
            <div class="container mt-5">           
			<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No</th>
			   			<th>Jobcard No</th>
			   			<th>Name</th>
			   			<th>Car Name</th> 
			   			<th>Customer Contact</th>
			   			<th>Action</th>	
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<JobcardInfo> list = JobcardInfoDao.getList(officer_username,"insurancerepair");
						Iterator<JobcardInfo> itr = list.iterator();
						while (itr.hasNext())
						{
							JobcardInfo jci =  itr.next();
							String vehicle_number = jci.getVehicleNumber();
							String customer_name = CustomerInfoDao.getNameByNumber(vehicle_number);
							int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
							String company_model = VehicleModelDao.getModelName(vehicle_model_id);
							CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
							String customer_contact=ci.getCustomerContact();
							int jobcard_number = JobcardInfoDao.getJNByNumber(vehicle_number);
							 String link="insurancerepairedview.jsp?id="+jobcard_number;
							%>
							<tr>
							<td><%= vehicle_number %></td>
							<td><%= jobcard_number %>
							<td><%= customer_name%></td>
							<td><%= company_model %></td>
							<td><%= ci.getCustomerContact() %></td>
							 <td><a href=<%= link %>>View</a></td>
							</tr>	
							 
							<%
						} 
					%>
			   	</tbody>
	   		</table>
			
	   		<%-- <table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No</th>
			   			<th>Job Card No.</th>
			   			<th>Customer Name</th>
			   			<th>Customer Contact</th>
			   			<th>Policy Number</th>
			   			<th>Insurance Company</th>
			   			<th>Insurance Type</th>
			   			<th>Inspector Name</th> 
			   			<th>Inspector Contact</th>
			   			<th>Action</th>		
			   			<th>Action</th>		   			
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<Insurance> list = InsuranceDao.getAllBySA(officer_username);
						Iterator<Insurance> itr = list.iterator();
						while (itr.hasNext())
						{
							Insurance in =  itr.next();
							String vehicle_number = in.getVehicleNumber();
							String customer_name = CustomerInfoDao.getNameByNumber(vehicle_number);
							JobcardInfo jci = JobcardInfoDao.getAllByNumber(vehicle_number);
							CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
							OfficerInfo oi = OfficerInfoDao.getByUsername(OfficerInfoDao.getByCompany(in.getInsuranceCompany()));
							String customer_contact=ci.getCustomerContact();
							int jobcard_number = JobcardInfoDao.getJNByNumber(vehicle_number);
							//OfficerInfo oi=OfficerInfoDao.getByUsername(username);
							String link1 = "addinsurancejobs.jsp?id="+vehicle_number;
							String link2 = "viewinsurancestatus.jsp?id="+jobcard_number;
							%>
							<tr>
							<td><%= vehicle_number %></td>
							<td><%= jobcard_number %>
							<td><%= customer_name%></td>
							<td><%= customer_contact %></td>
							<td><%= in.getPolicyNumber() %></td>
							<td><%= in.getInsuranceCompany() %></td>
							<td><%= in.getInsuranceType() %></td>
							<td><%= oi.getOfficerName() %></td>
							<td><%= oi.getOfficerContact() %></td>
							
							
							<td><a href=<%= link1 %> >Add Jobs</a></td>
							<td><a href=<%= link2 %>>View Status</a></td>
							
							</tr>	
							 
							<%
						} 
					%>
			   	</tbody>
	   		</table> --%>
		</div>
            
            <div class="my-dashboard-content mt-3">
                <div class="row">
                    <!-- Put the iterator over here, put this whole div in the loop and the cards will be set accordingly -->
                    <!-- LOOP Starts -->
                    
          
                </div>
            </div>
        </div>
    </main>
<%@include file="../footer.html"%>