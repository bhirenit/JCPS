<%@page import="modal.ReportObj"%>
<%@include file="../header.html" %>
<title>New Arrival</title>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
  <body>
    <%-- <% String officer_username = request.getParameter("id");
    	
    %> --%>
    <!-- openable navbar -->
    <%@include file="receptionistSidebar.html" %>
    <!-- Page Content -->
    <main id="main">

        <div class="my-new-header">
            <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&#9776;</button>
            <span>JCMS</span>
        </div>

        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="receptionistDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Newly Added Cars</li>
            </ol>
        </nav>    
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Newly Added Car list</h4>
                </center>
            </div>
            
            <div class="row">
            	<div class="col-md"></div>
            	<div class="col-md">From : <input type="date"></div>
            	<div class="col-md">to : <input type="date"></div>
            	<div class="col-md"></div>            	
            </div>
            
            <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Vehicle No.</th>
			   			<th>Name</th>
			   			<!-- <th>Car Name</th> 
			   			<th>Contact No.</th>
			   			<th>Action</th> -->	
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		<% List<CustomerInfo> list1 = CustomerInfoDao.getCountOfRegistrationByMonth("2019");
						Iterator<CustomerInfo> itr1 = list1.iterator();
						while (itr1.hasNext())
						{
							CustomerInfo ci =  itr1.next();
							int month = ci.getPincode();
							int count = ci.getCustomerId();
                            
                            %>
                            <tr>
                            
                           <td>	<%= month %></td>
                           <td><%= count %></td>
                            <br>
                           <% } %>
			   	</tbody>
	   		</table>
		</div>
		
		
		
		<div class="container mt-5">
<table id="data-table-simple-2" class="table">
<caption>from to by jobcard</caption>
			   	<thead style="text-align: center;">
			   	
			   		<tr>
			   		
			   		<th>JobCard Number</th>
			   		<th>Car Number </th>
			   			<th>Service Advisor Name</th>		   			
			   			<th>Status</th> 
			   			<th>Date</th>
			   			
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">	        
			   		<% List<JobcardInfo> list3 = JobcardInfoDao.getAllByDate("2019-01-01", "2019-04-01");
						Iterator<JobcardInfo> itr3 = list3.iterator();
						while (itr3.hasNext())
						{
							JobcardInfo jci =  itr3.next();
							String officer_username1 = jci.getOfficeUsername();
							int jcno = jci.getJobcardNumber();
							String vehicle_number= JobcardInfoDao.getVNByNumber(jcno);
							String status=jci.getStatus();
							String Arrivaldate=jci.getArrivalDate();
							
                            %>
                            <tr>
                            <td>  <%= jcno %></td>
                             <td><%= vehicle_number %> </td>
                          <td>  <%= officer_username1   %></td>
                         
                          <td><%= status %></td>
                          <td><%=Arrivaldate  %></td>
                          
                          </tr>
                            
                           <% 
                           } 
                           %>
	        </tbody>
	        </table>
	        </div>
	        
	        
	        	
		<div class="container mt-5">
<table id="data-table-simple-3" class="table">
<caption>from to by jobcard</caption>
			   	<thead style="text-align: center;">
			   	
			   		<tr>
			   		
			   		<th>JobCard Number</th>
			   		<th>Car Number </th>
			   			<th>Service Advisor Name</th>		   			
			   			<th>Status</th> 
			   			<th>Date</th>
			   			
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">	        
			   		<% List<ReportObj> list9 = JobcardInfoDao.getCountOfJobStatusByUsername("b_horem");
						Iterator<ReportObj> itr9 = list9.iterator();
						while (itr3.hasNext())
						{
							JobcardInfo jci =  itr3.next();
							String officer_username1 = jci.getOfficeUsername();
							int jcno = jci.getJobcardNumber();
							String vehicle_number= JobcardInfoDao.getVNByNumber(jcno);
							String status=jci.getStatus();
							String Arrivaldate=jci.getArrivalDate();
							
                            %>
                            <tr>
                            <td>  <%= jcno %></td>
                             <td><%= vehicle_number %> </td>
                          <td>  <%= officer_username1   %></td>
                         
                          <td><%= status %></td>
                          <td><%=Arrivaldate  %></td>
                          
                          </tr>
                            
                           <% 
                           } 
                           %>
	        </tbody>
	        </table>
	        </div> --%>
	        
            
            <div class="my-dashboard-content mt-3">
                <div class="row">
                    <!-- Put the iterator over here, put this whole div in the loop and the cards will be set accordingly -->
                    <!-- LOOP Starts -->
                    
          
                </div>
            </div>
        </div>
    </main>

<%@include file="../footer.html"%>