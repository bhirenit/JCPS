<%
  if( ! ((String)session.getAttribute("officer_role")).equals("floor_incharge")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
<header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
             <h3 class="w3-bar-item">Menu</h3>
        <a href="fincDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>     
        <a href="pendinglist.jsp" class="w3-bar-item w3-button">Pending Cars</a>
        <a href="repaiedlist.jsp" class="w3-bar-item w3-button">Repaired Cars</a>
        <a href="alljobcardlist.jsp" class="w3-bar-item w3-button">Jobcard View</a>
        <a href="reports.jsp" class="w3-bar-item w3-button">Reports</a>  
    </header>