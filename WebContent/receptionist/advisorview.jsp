<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@include file="../header.html"%>
    <title>Hello, world!</title>
  </head>
  <body>
    <!-- openable navbar -->
    <%@include file="receptionistSidebar.html" %>
    <!-- Page Content -->
    <main id="main">

        <%@include file="../navbar.jsp" %>

<%
String officer_username =request.getParameter("id");
OfficerInfo oi=OfficerInfoDao.getByUsername(officer_username);
%>
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="receptionistDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="serviceadvisorlist.jsp">Service Advisor list</a></li>
                <li class="breadcrumb-item active" aria-current="page">View Service Advisor's work</li>
            </ol>
        </nav>    
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Car List Under <%= oi.getOfficerName() %></h4>
                </center>
            </div>
        </div>
        <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center; font-size: 14px;">
			   		<tr>
			   			<th>Vehicle No.</th>
			   			<th>VIN</th>
			   			<th>JobCard No.</th> 
			   			<th>Date</th>
			   			<th>Customer Name</th>
			   			<th>Car Model</th>
			   			<th>Status</th>
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
        <%
        List<JobcardInfo> list=JobcardInfoDao.getByOfficer(officer_username);
        Iterator<JobcardInfo> itr =list.iterator();
		while (itr.hasNext())
		{
			JobcardInfo jci=itr.next();
			int jobcard_number= jci.getJobcardNumber();
			String vehicle_number=jci.getVehicleNumber();
			VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicle_number);
			CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
		     int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
				String company_model = VehicleModelDao.getModelName(vehicle_model_id);
				
		%> 	
			   		<tr>
			   			<td><%= vehicle_number %></td>
				   		<td><%= vi.getVinNumber() %></td>
				   		<td><%= jobcard_number %></td>
				   		<td><%= jci.getArrivalDate() %>
				   		<td><%= ci.getCustomerName() %></td>
				   		<td><%= company_model %></td>
				   		<td><%= jci.getStatus() %></td>
			   		</tr>	
			   		<%
		}
			   		%>		   		
			   	</tbody>
	   		</table>
		</div>    
        
    </main>

 <%@include file="../footer.html"%>