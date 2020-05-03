<header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
             <h3 class="w3-bar-item">Menu</h3>
        <a href="saDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
        
        <a href="newarrival.jsp" class="w3-bar-item w3-button">New Arrival Cars</a>
        <a href="pendinglist.jsp" class="w3-bar-item w3-button">Pending Cars</a>
        <a href="repairedlist.jsp" class="w3-bar-item w3-button">Repaired Cars</a>
        <a href="closedlist.jsp" class="w3-bar-item w3-button">Closed Cars</a>
        <a href="alljobcardlist.jsp" class="w3-bar-item w3-button">Jobcard View</a>
        <a href="serviceadvisorPR.jsp" class="w3-bar-item w3-button">Reports</a>  
         <%
  if( ! ((String)session.getAttribute("officer_role")).equals("service_advisor")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
    </header>