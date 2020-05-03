<%@page import="modal.AppointmentDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="java.util.List"%>
<%@ include file="../header.html" %>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.OfficerInfoDao"%>


<% String username = (String) session.getAttribute("officer_username");
	OfficerInfo oi2 = OfficerInfoDao.getByUsername(username);
    String name =oi2.getOfficerName();
    %>
<title>Receptionist Dashboard</title>
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


  <body onload="check()" >
    <!-- Sidebar -->
    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="receptionistDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
        <a href="search.jsp" class="w3-bar-item w3-button">Search Customer</a>
        <a href="serviceadvisorlist.jsp" class="w3-bar-item w3-button">Service Advisor List</a>
<!--         <a href="servicedetails.jsp" class="w3-bar-item w3-button">Service Details</a> -->
        <a href="receptionistPR.jsp" class="w3-bar-item w3-button">Reports</a>
        
    </div>

    <!-- Page Content -->
    <div style="margin-left:20%">
         <div class="my-new-header">
             <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&nbsp;</button>
             <span>JCMS</span>
             <div class="navbar-userpart">
                <span class="navbar-userpart-username">Welcome, <%= name %> | </span> <span><a href="../logout.jsp">logout</a></span>
             </div>
         </div>
        
        
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" aria-current="page"><a href="receptionistDashboard.jsp">Dashboard</a> / </li>
            </ol>
        </nav>    

        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Receptionist Dashboard</h4>
                </center>
            </div>
            <%-- <div class="my-dashboard-content mt-3">
                <div class="row">
                    <div class="col-md-4">
                        <!-- whole card is given as a link, so give href in the below anchor tag -->
                        <a href="search.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Search <i class="fa fa-search"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Search Cars</div>
                                        
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    
                  
                    <div class="col-md-4">
                        <!-- whole card is given as a link, so give href in the below anchor tag -->
                        <a href="appointmentlist.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Appointments <i class="fa fa-calendar-check"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Your Appointments</div>                                        
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                   
                    
                    <div class="col-md-4">
                        <a href="serviceadvisorlist.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Service Advisor List <i class="fa fa-tasks"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Service Advisor</div>
                                        <div class="col-md-2">
                                        <% List<OfficerInfo> list = OfficerInfoDao.getByOfficerRole("service_advisor");
											Iterator<OfficerInfo> itr = list.iterator();
											int sa_count = 0;
											while (itr.hasNext())
											{
												OfficerInfo oi =  itr.next();
												sa_count++;
											}
											%>
											<span class='numscroller' data-min='0' data-max=<%= sa_count %> data-delay='0.5' data-increment='1'><%= sa_count %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
   
                    
                    
                </div>
            </div> --%>
            
            
            
            <div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="search.jsp" class="my-dashboard-box-link">
			<i class="fa fa-car"></i>
			<div class="stats">
			  <h5 class='' >&nbsp;<span></span></h5>
			  <div class="grow grow1">
				<p><font style="color: white">Search Cars</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="appointmentlist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-wrench"></i>
			<div class="stats">
			   <h5 class='numscroller' data-min='0' data-max=<%= AppointmentDao.getCount() %> data-delay='0.5' data-increment='1'><%= AppointmentDao.getCount() %><span></span></h5>
                                       
			  <div class="grow grow3">
				<p><font style="color: white">Appointments</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="serviceadvisorlist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-check-square"></i>
			<div class="stats"><% List<OfficerInfo> list = OfficerInfoDao.getByOfficerRole("service_advisor");
											Iterator<OfficerInfo> itr = list.iterator();
											int sa_count = 0;
											while (itr.hasNext())
											{
												OfficerInfo oi =  itr.next();
												sa_count++;
											}
											%>
			
			  <h5 class='numscroller' data-min='0' data-max=<%= sa_count %> data-delay='0.5' data-increment='1'><%= sa_count %></h5>
			  <div class="grow">
			  
				<p><font style="color: white">ServiceAdvisor List</p>
			  </div>
			</div>
			</a>
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