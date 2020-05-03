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
<title>Insurance Dashboard</title>
  
  <body onload="check()" >
    <!-- Sidebar -->
    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="receptionistDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
        <a href="" class="w3-bar-item w3-button">Insurance Car</a>
        
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
                <li class="breadcrumb-item" aria-current="page"><a href="receptionistDashboard.jsp">Dashboard</a></li>
             <li class="breadcrumb-item" aria-current="page"><a href="#">Insurance Car</a> / </li>
            </ol>
        </nav>    

        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Insurance Dashboard</h4>
                </center>
            </div>
           
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="insurancelist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-check-square"></i>
			<div class="stats"><% List<OfficerInfo> list = OfficerInfoDao.getByOfficerRole("insurance");
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
			  
				<p><font style="color: white">Insurance Car</p>
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