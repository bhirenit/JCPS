<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="java.util.List"%>
<%@ include file="../header.html" %>
<title>Report Dashboard</title>
 
  <body>
  <%
  if( ! ((String)session.getAttribute("officer_role")).equals("service_advisor")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>   
    <!-- Sidebar -->
    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="receptionistDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
        <a href="search.jsp" class="w3-bar-item w3-button">Search Customer</a>
        <a href="serviceadvisorlist.jsp" class="w3-bar-item w3-button">Service Advisor List</a>
        <a href="servicedetails.jsp" class="w3-bar-item w3-button">Service Details</a>
        <a href="reports.jsp" class="w3-bar-item w3-button">Reports</a>
        <!-- <a href="#" class="w3-bar-item w3-button">Logout</a> -->
        <form action="../Logout" method="POST">
		<input type="submit" value="Log Out"/></form>
    </div>

    <!-- Page Content -->
    <div style="margin-left:20%">

       <%@include file="../navbar.jsp" %>
        
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" aria-current="page"><a href="receptionistPR.jsp">Report  Dashboard</a> / </li>
            </ol>
        </nav>    

        <div class="container-95">
        	<!-- dashboard -->
	        <div class="my-dashboard">
	            <div class="my-dashboard-header">
	                <center>
	                    <h4>Report Dashboard</h4>
	                </center>
	            </div>	
	            
	            <div class="row">
	           		<div class="col-md"></div>
	           		<div class="col-md-3">
	           			<select id="PercentageReports">
	           				<option disabled selected>Select Report Type</option>
	           				<option value="ct">Customer Type</option>
	           				<option value="vt">Vehicle Type</option>
	           				<option value="ft">Fuel Type</option>
	           				<option value="wl">Service Advisor Work Load</option>           				
	           			</select>
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

<%@ include file="../footer.html" %>