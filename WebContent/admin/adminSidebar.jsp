<%
  if( ! ((String)session.getAttribute("officer_role")).equals("admin")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
<header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
             <h3 class="w3-bar-item">Menu</h3>
        <a href="adminDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>     
        <a href="companies.jsp" class="w3-bar-item w3-button">Manages Cars</a>
        <a href="addstaff.jsp" class="w3-bar-item w3-button">Manages Staff</a>
        <a href="changeallocation.jsp" class="w3-bar-item w3-button">Change Allocated Cars</a>
      
    </header>