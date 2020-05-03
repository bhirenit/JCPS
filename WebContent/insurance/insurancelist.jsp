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
    	    
    	OfficerInfo oi = OfficerInfoDao.getByUsername(officer_username);
    	
    	String company = oi.getOfficerCompany();
    	
    	
    	
    	
    %>
    
	<!-- openable navbar -->
  

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
                    <h4>Insurance Cars List</h4>
                </center>
            </div>
            <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
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
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<Insurance> list = InsuranceDao.getAllByCompany(company);
						Iterator<Insurance> itr = list.iterator();
						while (itr.hasNext())
						{
							Insurance in =  itr.next();
							String vehicle_number = in.getVehicleNumber();
							String customer_name = CustomerInfoDao.getNameByNumber(vehicle_number);
							JobcardInfo jci = JobcardInfoDao.getAllByNumber(vehicle_number);
							CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
							
							String customer_contact=ci.getCustomerContact();
							int jobcard_number = JobcardInfoDao.getJNByNumber(vehicle_number);
							//OfficerInfo oi=OfficerInfoDao.getByUsername(username);
							String link1 = "insuranceinspect.jsp?id="+jobcard_number;
							
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
							
							
							<td><a href=<%= link1 %> >Inspect</a></td>
							
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