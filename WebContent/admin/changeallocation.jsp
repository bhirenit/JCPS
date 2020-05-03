<%@page import="java.util.Iterator"%>
<%@page import="modal.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="../header.html" %>
<title>Change Allocation</title> 
<%
  if( ! ((String)session.getAttribute("officer_role")).equals("admin")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  String officer_username = (String) session.getAttribute("officer_username");
  String officer_role = (String) session.getAttribute("officer_role");
  %>
  <body>
    <script type="text/javascript">
    
    function nameChanged(jobcardNumber)
    {
    	var officerUsername = document.getElementById("serviceAdvisor").value;
    	document.getElementById("changeAllocation").href = "../ChangeAllocation?id="+jobcardNumber+"&username="+officerUsername;
    }
    </script>
   <%@include file="adminSidebar.jsp" %>

    <!-- Page Content -->
    <main id="main">

         <%@include file="../navbar.jsp" %>
        
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" aria-current="page"><a href="adminDashboard.jsp">Dashboard</a> / </li>
            </ol>
        </nav>    

        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Admin's Dashboard</h4>
                </center>
            </div>
            <div class="my-dashboard-content mt-3">
                <div class="row">
                	<div class="col-md"></div>
                    <div class="col-md-10">
                      <table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No</th>
			   			<th>JobCard No</th>			   				
			   			<th>Arrival Date</th>
			   			<th>Customer Name</th>
			   			<th>Car Name</th> 
			   			<th>Status</th>
			   			<th>Delivery Date</th>	
			   			<th>Amount</th>	
			   			<th>Action</th>
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<JobcardInfo> list = JobcardInfoDao.getAll();
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
							int jobcardNumber=JobcardInfoDao.getJNByNumber(vehicle_number,"repaired");
							int amount=JobcardInfoDao.getFinalAmount(jobcardNumber);
                            String link="../ChangeAllocation?id="+jobcardNumber;
                            
                            %>
							<tr>
                            <td><%=vehicle_number%></td>	
                            <td><select id="serviceAdvisor" onchange='nameChanged(<%=jobcardNumber%>)'>
                            
                            <%List<OfficerInfo> oiList = OfficerInfoDao.getByOfficerRole("service_advisor");
                           Iterator<OfficerInfo> oiItr = oiList.iterator();
                           while(oiItr.hasNext())
                           {
                        	   OfficerInfo oi = oiItr.next();
                           %>
                           
                           
                           <option value="<%=oi.getOfficerUsername()%>" <%= (oi.getOfficerUsername().equals(ji.getOfficeUsername()))?"selected":" " %>><%=oi.getOfficerName()%></option>
                           <%} %>
                            </td>
                            <td><%=arrival_date%></td>
                            <td><%=customer_name%></td>
                            <td><%=company_model%></td>
                       		<td><%= ji.getStatus() %></td>
                            <td><%=delivery_date%></td>
                            <td><%= amount %></td>
                            <td><a id="changeAllocation" >Update</a></td>
                            </tr>	 
						<%	
						} 
					%>
			   	</tbody>
	   		</table>
                    </div>
                    <div class="col-md"></div>                    
                </div>
            </div>
        </div>

    </div>
    <main>
        <!-- <form class="form-inline">
            <label class="" for="inlineFormInputName2">Name</label>
            <input type="text" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Jane Doe">                                                            
            
            <button type="submit" class="btn btn-primary mb-2">Submit</button>
        </form> -->
        
    </main>

<%@include file="../footer.html" %>