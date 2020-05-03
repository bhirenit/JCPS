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
                <li class="breadcrumb-item"><a href="serviceadvisorlist.jsp">Service Advisor List</a></li>
                <li class="breadcrumb-item active" aria-current="page">Pending List</li>
            </ol>
        </nav>    
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Pending Cars List</h4>
                </center>
            </div>
            <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No.</th>
			   			<th>Name</th>
			   			<th>Car Name</th> 
			   			<th>Contact No.</th>			   			
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<JobcardInfo> list = JobcardInfoDao.getList(officer_username,"pending");
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
							String link1 = "receptionAllocate.jsp?id="+vehicle_number;
							
							%>
							<tr>
							<td><%= vehicle_number %></td>
							<td><%= customer_name%></td>
							<td><%= company_model %></td>
							<td><%= ci.getCustomerContact() %></td>
							
							
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