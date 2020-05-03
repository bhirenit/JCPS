<%@page import="modal.OfficerInfo"%>
<%@page import="modal.OfficerInfoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="../header.html" %>
<title>Admin Dashboard</title> 
<% String officer_username = (String)session.getAttribute("officer_username");
    	OfficerInfo oi  = OfficerInfoDao.getByUsername(officer_username);
    	
        %>
<%
  if( ! ((String)session.getAttribute("officer_role")).equals("admin")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
  <body onload="check()">
    
    <!-- Sidebar -->
    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
        <h3 class="w3-bar-item">Menu</h3>
         <a href="adminDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>     
        <a href="companies.jsp" class="w3-bar-item w3-button">Manages Cars</a>
        <a href="addstaff.jsp" class="w3-bar-item w3-button">Manages Staff</a>
        <a href="changeallocation.jsp" class="w3-bar-item w3-button">Change Allocated Cars</a>
    </div>

    <!-- Page Content -->
    <div style="margin-left:20%">

      <div class="my-new-header">
             <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&nbsp;</button>
             <span>JCMS</span>
             <div class="navbar-userpart">
                <span class="navbar-userpart-username">Welcome, <%= oi.getOfficerName() %> | </span> <span><a href="../logout.jsp">logout</a></span>
             </div>
         </div>
         
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" aria-current="page"><a href="adminDashboard.jsp">Dashboard</a> / </li>
            </ol>
        </nav>    

        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Admin's Dashboard</h4>
                </center>
            </div>
            
              <!--   <div class="my-dashboard-content mt-3">
                <div class="row">
                    <div class="col-md-4">
                        whole card is given as a link, so give href in the below anchor tag
                        <a href="companies.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Manage Cars <i class="fa fa-car"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-12">Manage Companies, Models and many more</div>                                        
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>   
                    </div>                 
               
           
            
            
            
               
                    <div class="col-md-4">
                        whole card is given as a link, so give href in the below anchor tag
                        <a href="#" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Add Staff<i class="fa fa-car"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-12">Add new Staff </div>                                        
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>                    
                
            </div>
        </div>

			
                    <div class="col-md-4">
                        whole card is given as a link, so give href in the below anchor tag
                        <a href="companies.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Manage Staff <i class="fa fa-car"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-12">Change Allocated Cars</div>                                        
                                    </div>
                                </div>
                            </div>
                        </a>
                    
            </div>


    </div> -->
    
    
     <div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="companies.jsp" class="my-dashboard-box-link">
			<i class="fa fa-car"></i>
			<div class="stats">
			  <h5 class='' >&nbsp;<span></span></h5>
			  <div class="grow grow1">
				<p><font style="color: white">Manage Cars </p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="#" class="my-dashboard-box-link">
			<i class="fa fa-wrench"></i>
			<div class="stats">
			   <h5 class='#' >&nbsp;<span></span></h5>
                                       
			  <div class="grow grow3">
				<p><font style="color: white">Add New Staff</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="changeallocation.jsp" class="my-dashboard-box-link">
			<i class="fa fa-check-square"></i>
			<div class="stats">
			   <h5 class='' >&nbsp;<span></span></h5>
                                       
			  <div class="grow">
				<p><font style="color: white">Manage Staff</p>
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

<%@include file="../footer.html" %>