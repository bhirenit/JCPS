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
    
    <%
  if( ! ((String)session.getAttribute("officer_role")).equals("floor_incharge")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
      
  <body>
    <% String officer_username = request.getParameter("id");
    	
    %>
    <!-- openable navbar -->
    <header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
            <a href="#" class="w3-bar-item w3-button">Link 1</a>
            <a href="#" class="w3-bar-item w3-button">Link 2</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
        </div>
    </header>
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
                           	<%= month %>
                           : <%= count %>
                            <br>
                           <% } %>
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