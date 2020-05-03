<%@page import="modal.AppointmentDao"%>
<%@page import="modal.Appointment"%>
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
    <%String officer_username = request.getParameter("id");
    
    %>
    
	<!-- openable navbar -->
   <%@include file="receptionistSidebar.html" %>

    <!-- Page Content -->
    <main id="main">
        <%@include file="../navbar.jsp" %>

        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="receptionistDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Appointment List</li>
            </ol>
        </nav>    
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Appointment List</h4>
                </center>
            </div>
            <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No.</th>
			   			<th>Customer Name</th>
			   			<th>Car Name</th> 
			   			<th>Contact No.</th>
			   			<th>Request Date</th>
			   			<th>Action</th>	
			   			
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<Appointment> list = AppointmentDao.getList();
						Iterator<Appointment> itr = list.iterator();
						while (itr.hasNext())
						{
							Appointment jci =  itr.next();
							String vehicleNumber = jci.getVehicleNumber();
							String customer_name = CustomerInfoDao.getNameByNumber(vehicleNumber);
							int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicleNumber);
							String company_model = VehicleModelDao.getModelName(vehicle_model_id);
							CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicleNumber);
							String requestedDate = jci.getRequestDate();
							String customer_contact=ci.getCustomerContact();
							
							String link = "appointmentAllocated.jsp?id="+vehicleNumber;
							
							%>
							<tr>
							<td><%= vehicleNumber %></td>
							<td><%= customer_name%></td>
							<td><%= company_model %></td>
							<td><%= ci.getCustomerContact() %></td>
							<td> <%= requestedDate %></td>
							 <td><a href=<%= link %>>Allocate</a></td>
							</tr>	
							 
							<%
						} 
					%>
			   	</tbody>
	   		</table>
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