<%@page import="modal.HistoryPaymentDao"%>
<%@page import="modal.ReportObj"%>
<%@page import="modal.HistoryDao"%>
<%@page import="modal.History"%>
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
    <header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
            <a href="#" class="w3-bar-item w3-button">Link 1</a>
            <a href="#" class="w3-bar-item w3-button">Link 2</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
        </div>
         <%
  if( ! ((String)session.getAttribute("officer_role")).equals("service_advisor")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
    </header>
    <!-- Page Content -->
    <main id="main">

         <%@include file="../navbar.jsp" %>
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
            <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center;">
			   		<tr>
			   			<th>Company Name</th>
			   			<th>Count</th>
			   			<!-- <th>Car Name</th> 
			   			<th>Contact No.</th>
			   			<th>Action</th> -->	
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		 <div class="row">
	        	<% List<History> list5 = HistoryDao.getCountOfCompanyNameBySA("c_gunjan");
						Iterator<History> itr5 = list5.iterator();
						while (itr5.hasNext())
						{
							History h =  itr5.next();
							String company = h.getHistoryId();
							int count = h.getRunningKM();							
                            %>
                            <tr>
                           <td>	<%= company %></td>
                           <td><%= count %></td>
                            
                           <% } %>
			   	</tbody>
	   		</table>
		</div>
		
		
		
	 <div class="container mt-5">
<table id="data-table-simple-2" class="table">
<caption>from to by jobcard</caption>
			   	<thead style="text-align: center;">
			   	
			   		<tr>
			   		
			   		<th>Month</th>
			   		<th>Revenue </th>
			   			
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">	        
			   		<% List<ReportObj> list6 = HistoryPaymentDao.getRevenueByMonthAndSa("2019", "b_hiren");
						Iterator<ReportObj> itr6 = list6.iterator();
						while (itr6.hasNext())
						{
							ReportObj hp =  itr6.next();
							int month = hp.getP1();
							int revenue = hp.getP2();
                            %>
                           
                           
                            <tr>
                            <td>  <%= month  %></td>
                             <td><%= revenue %> </td>
                          </tr>
                           <% 
                           } 
                           %>
	        </tbody>
	        </table>
	        </div> 
	        
	        	
	 <%-- <div class="container mt-5">
<table id="data-table-simple-3" class="table">
<caption>from to by jobcard</caption>
			   	<thead style="text-align: center;">
			   	
			   		<tr>
			   		
			   		<th>Part Pending</th>
			   		<th>service Pending </th>
			   		<th>Revenue </th>
			   		<th>Revenue </th>
			   		
			   			
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">	        
			   		<% List<ReportObj> list7 = JobcardInfoDao.getCountOfJobStatusByUsername("b_hiren");
						Iterator<ReportObj> itr7 = list7.iterator();
						while (itr7.hasNext())
						{
							ReportObj jci =  itr7.next();
							int ppc = jci.getP1();
							int cpc = jci.getP2();
							int psc = jci.getS1();
							int csc = jci.getS2();
							int plc = jci.getL1();
							int clc = jci.getL2();						
                            
                            %>
                            <%= ppc %>
                            <%= cpc %>
                            <%= psc %>
                            <%= csc %>
                            <%= plc %>
                            <%= clc %>                                                       
                            
                         
                            <tr>
                            <td>  <%= month  %></td>
                             <td><%= revenue %> </td>
                          </tr>
                           <% 
                           } 
                           %>
	        </tbody>
	        </table>
	        </div> 

	         --%>
            
            <div class="my-dashboard-content mt-3">
                <div class="row">
                    <!-- Put the iterator over here, put this whole div in the loop and the cards will be set accordingly -->
                    <!-- LOOP Starts -->
                    
          
                </div>
            </div>
        </div>
    </main>

<%@include file="../footer.html"%>