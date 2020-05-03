<%@ include file="../header.html" %>
    <title>Hello, world!</title>
     <%
  if( ! ((String)session.getAttribute("officer_role")).equals("customer")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
  </head>
 <script type = "text/javascript" >
        function preventBack() { window.history.forward(1); }
        setTimeout("preventBack()", 0);
        window.onunload = function () { null };
        function check(){
        	<%
        	if(session.getAttribute("officer_username")==null)
        	{
        		
        		response.sendRedirect("../index.jsp");
        	}
        	%>
        }
</script> 
  <body onload="check()">
    
    <!-- Sidebar -->
  

	<div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="customerDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
        <a href="pasthistoryview.jsp" class="w3-bar-item w3-button">view Past History</a>
        <a href="#" class="w3-bar-item w3-button">Service List</a>
         
        
    </div>
<% String vehicleNumber = (String)session.getAttribute("officer_username");
    	String officer_name = (String)session.getAttribute("officer_name");
    	String officer_role = (String)session.getAttribute("officer_role");
        %>

    <!-- Page Content -->
    <div style="margin-left:20%">

         <div class="my-new-header">
             <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&nbsp;</button>
             <span>JCMS</span>
             <div class="navbar-userpart">
                <span class="navbar-userpart-username">Welcome, <%= officer_name %> | </span> <span><a href="../logout.jsp">logout</a></span>
             </div>
         </div>
        
        
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" aria-current="page"><a href="customerDashboard.jsp">Dashboard</a> / </li>
            </ol>
        </nav>    

        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Customer Dashboard</h4>
                </center>
            </div>
            
                   <%--  <div class="row">
                    	<div class="col-md-4">
                    	<%String link1 = "../Saveappointment?id="+vehicleNumber; %>
                        <a href=<%=link1%> class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Appointment<i class="fa fa-car-side"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">appointment</div>
                                        <div class="col-md-2">
                                        	<span class='numscroller' data-min='0' data-max=2 data-delay='0.5' data-increment='1'>2</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                    
                        <a href="pasthistoryview.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>pass History <i class="fa fa-check-circle"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">pass History</div>
                                        <div class="col-md-2">
                                        	<span class='numscroller' data-min='0' data-max=2 data-delay='0.5' data-increment='1'>2</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    </div>
                    
                </div>
            </div>
        </div> --%>
        
        <div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<%String link1 = "../Saveappointment?id="+vehicleNumber; %>
		<a href="<%= link1%>" class="my-dashboard-box-link">
			<i class="fa fa-wrench"></i>
			<div class="stats">
			 <h5 class='#' >&nbsp;<span></span></h5>
			  <div class="grow grow3">
				<p><font style="color: white">Appointment</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href=<%="allpastHistory.jsp?id="+vehicleNumber%> class="my-dashboard-box-link">
			<i class="fa fa-check-square"></i>
			<div class="stats">
			 <h5 class='#' >&nbsp;<span></span></h5>
			  <div class="grow">
				<p><font style="color: white">Past History</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 

    </div>
<%@include file="../footer.html"%>