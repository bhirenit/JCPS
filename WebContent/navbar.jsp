 
 <%@page import="modal.OfficerInfo"%>
<%@page import="modal.OfficerInfoDao"%>

<% String navbarusername = (String) session.getAttribute("officer_username");
	OfficerInfo oinavbar = OfficerInfoDao.getByUsername(navbarusername);
    String name =oinavbar.getOfficerName();
    %>
 
 
 <div class="my-new-header">
     <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&#9776;</button>
     <span>
     <% if(oinavbar.getOfficerRole().equals("receptionist")) {%> <a href="receptionistDashboard.jsp" class="navbar-logo-link">JCMS</a> <%} 
     	else if (oinavbar.getOfficerRole().equals("service_advisor")) {%><a href="saDashboard.jsp" class="navbar-logo-link">JCMS</a> <% }
     	else if (oinavbar.getOfficerRole().equals("floor_incharge")) {%> <a href="fincDashboard.jsp" class="navbar-logo-link">JCMS</a><% }
     	else if (oinavbar.getOfficerRole().equals("admin")) {%> <a href="adminDashboard.jsp" class="navbar-logo-link">JCMS</a><% }
     	else if (oinavbar.getOfficerRole().equals("customer")) {%><a href="customerDashboard.jsp" class="navbar-logo-link">JCMS</a> <% } 
     	else {%><a href="index.jsp" class="navbar-logo-link">JCMS</a><%}
     %>  
     
     
       	    	
     </span>
     <div class="navbar-userpart">
     	<span class="navbar-userpart-username">Welcome, Service Advisor Name | </span> <span><a href="../logout.jsp">logout</a></span>
     </div>
 </div>