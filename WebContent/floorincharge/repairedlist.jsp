<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="java.util.Date"%>
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
  </head>
  <body>
     <!-- Sidebar -->
    
      <%@include file="fincSidebar.jsp" %>
    <!-- Page Content -->
    <div>

        <%@include file="../navbar.jsp" %>

        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="fincDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Repaied Cars</li>
            </ol>
        </nav>    
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Repaired Cars list</h4>
                </center>
            </div>
            <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No.</th>
			   			<th>JobCard No.</th>			   				
			   			<th>Customer Name</th>
			   			<th>Car Model</th> 
			   			<th>Service Advisor Name</th>
			   			<th>Service Advisor Contact</th>
			   			<th>Delivery Date</th>	
			   			<th>Action</th>
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<JobcardInfo> list = JobcardInfoDao.getByStatus("repaired");
						Iterator<JobcardInfo> itr = list.iterator();
						while (itr.hasNext())
						{
							JobcardInfo jci =  itr.next();
							String vehicle_number = jci.getVehicleNumber();
							String customer_name = CustomerInfoDao.getNameByNumber(vehicle_number);
							int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
							String company_model = VehicleModelDao.getModelName(vehicle_model_id);
							VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicle_number);
							JobcardInfo ji = JobcardInfoDao.getAllByNumber(vehicle_number);
							String officer_username=ji.getOfficeUsername();
							OfficerInfo oi=OfficerInfoDao.getByUsername(officer_username);					
							int jobcard_number=JobcardInfoDao.getJNByNumber(vehicle_number,"repaired");
							String link2 = "repairedview.jsp?id="+jobcard_number;
							%>
							<tr>
							<td><%= vehicle_number %></td>
							<td><%= jobcard_number %></td>
							<td><%= customer_name%></td>
							<td><%= company_model %></td>
							<td><%= oi.getOfficerName() %></td>
							<td><%= oi.getOfficerContact() %></td>
							<td><%=ji.getDeliveryDate() %></td>
							 <td><a href=<%= link2 %>>View Status</a></td>
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
    </div>
<%@include file="../footer.html"%>