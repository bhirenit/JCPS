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
     <%
  if( ! ((String)session.getAttribute("officer_role")).equals("service_advisor")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
  </head>
  <body>
    <% String officer_username = (String)session.getAttribute("officer_username");
    	String officer_name = (String)session.getAttribute("officer_name");
    	String officer_role = (String)session.getAttribute("officer_role");
    %>
   
<%@include file="saSidebar.jsp" %>
    <!-- Page Content -->
    <div>

        <%@include file="../navbar.jsp" %>
    

       <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="saDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Jobcard list</li>
            </ol>
        </nav>    
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>JobCard list</h4>
                </center>
            </div>
            <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No.</th>			   				
			   			<th>Date</th>
			   			<th>Name</th>
			   			<th>Car Name</th> 
			   			<th>VIN</th>
			   			<th>JobCard No.</th>
			   			<th>Delivery Date</th>	
			   			<th>Action</th>
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<JobcardInfo> list = JobcardInfoDao.getByOfficer(officer_username);
						Iterator<JobcardInfo> itr = list.iterator();
						while (itr.hasNext())
						{
							JobcardInfo jci =  itr.next();
							String vehicle_number = jci.getVehicleNumber();
							String customer_name = CustomerInfoDao.getNameByNumber(vehicle_number);
							int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
							String company_model = VehicleModelDao.getModelName(vehicle_model_id);
							VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicle_number);
							String vin_no = vi.getVinNumber();
							JobcardInfo ji = JobcardInfoDao.getAllByNumber(vehicle_number);
							String arrival_date = ji.getArrivalDate();
							String delivery_date = ji.getDeliveryDate();
							int jobcard_no=JobcardInfoDao.getJNByNumber(vehicle_number);
                            String link="jobcardviewall.jsp?id="+jobcard_no;
                            String link1 = "../DownloadServlet?id="+jobcard_no;
                            %>
							<tr> 
                            <td><%=vehicle_number%></td>
                            <td><%=arrival_date%></td>
                            <td><%=customer_name%></td>
                            <td><%=company_model%></td>
                            <td><%=vin_no%></td>
                            <td><%=jobcard_no%></td>
                            <td><%=delivery_date%></td>
                            <td><a href=<%= link %> >View</a>/<a href=<%=link1 %> >Download</a></td>
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