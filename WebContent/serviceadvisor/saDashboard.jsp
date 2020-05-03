<%@page import="modal.HistoryDao"%>
<%@include file="../header.html" %>
<%@page import="modal.JobcardInfoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <title>Service Advisor Dashboard</title>
  <%
  if( ! ((String)session.getAttribute("officer_role")).equals("service_advisor")  ){
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
    <% String officer_username = (String)session.getAttribute("officer_username");
    	String officer_name = (String)session.getAttribute("officer_name");
    	String officer_role = (String)session.getAttribute("officer_role");
    	
        %>

    <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
        <h3 class="w3-bar-item">Menu</h3>
        <a href="saDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
        <a href="newarrival.jsp" class="w3-bar-item w3-button">New Arrival Cars</a>
        <a href="pendinglist.jsp" class="w3-bar-item w3-button">Pending Cars</a>
        <a href="repairedlist.jsp" class="w3-bar-item w3-button">Repaired Cars</a>
        <a href="closedlist.jsp" class="w3-bar-item w3-button">Closed Cars</a>
        <a href="alljobcardlist.jsp" class="w3-bar-item w3-button">Jobcard View</a>
        <a href="serviceadvisorPR.jsp" class="w3-bar-item w3-button">Reports</a>   
        
    </div>

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
                <li class="breadcrumb-item" aria-current="page"><a href="saDashboard.jsp">Dashboard</a> / </li>
            </ol>
        </nav>    

        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">           
                <center>
                    <h4>Service Advisor's Dashboard</h4>
                </center>
            </div>
           <%--  <div class="my-dashboard-content mt-3">
                <div class="row">
                <div class="col-md-4">
                        <a href="newarrival.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>New <i class="fa fa-plus"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Newly added cars</div>
                                        <div class="col-md-2">
                                        	<span class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getTotal(officer_username,"arrived") %> data-delay='0.5' data-increment='1'><%=JobcardInfoDao.getTotal(officer_username,"arrived") %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <!-- whole card is given as a link, so give href in the below anchor tag -->
                        <a href="pendinglist.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Pending <i class="fa fa-tools"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Your pending cars</div>
                                        <div class="col-md-2">
                                        	<span class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getTotal(officer_username,"pending") %> data-delay='0.5' data-increment='1'><%=JobcardInfoDao.getTotal(officer_username,"pending") %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-4">
                        <a href="repairedlist.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Repaired <i class="fa fa-car-side"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Your repaired cars</div>
                                        <div class="col-md-2">                                        	
                                        	<span class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getTotal(officer_username,"repaired") %> data-delay='0.5' data-increment='1'><%=JobcardInfoDao.getTotal(officer_username,"repaired") %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                  
                    <div class="col-md-4">
                        <a href="closedlist.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Closed <i class="fa fa-times"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Closed cars</div>
                                        <div class="col-md-2">
                                        	<span class='numscroller' data-min='0' data-max=<%=HistoryDao.getTotal(officer_username) %> data-delay='0.5' data-increment='1'><%=HistoryDao.getTotal(officer_username) %> </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    
               
                    
                </div>
            </div>
        </div>
 --%>
 	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="newarrival.jsp" class="my-dashboard-box-link">
			<i class="fa fa-car"></i>
			<div class="stats">
			  <h5 class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getTotal(officer_username,"arrived") %> data-delay='0.5' data-increment='1'><%=JobcardInfoDao.getTotal(officer_username,"arrived") %><span></span></h5>
			  <div class="grow grow1">
				<p><font style="color: white">Arrived</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="pendinglist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-wrench"></i>
			<div class="stats">
			  <h5 class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getTotal(officer_username,"pending") %> data-delay='0.5' data-increment='1'><%=JobcardInfoDao.getTotal(officer_username,"pending") %></h5>
			  <div class="grow grow3">
				<p><font style="color: white">Pending</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="repairedlist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-check-square"></i>
			<div class="stats">
			  <h5 class='numscroller' >5</h5>
			  <div class="grow">
				<p><font style="color: white">Repaired</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="closedlist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-lock"></i>
			<div class="stats">
			  <h5 class='numscroller' data-min='0' data-max=<%=HistoryDao.getTotal(officer_username) %> data-delay='0.5' data-increment='1'><%=HistoryDao.getTotal(officer_username) %></h5>
			  <div class="grow grow2">
				<p><font style="color: white">Closed</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
    </div>
    <div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="insurancelist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-car-crash"></i>
			<div class="stats">
			 <h5 class='numscroller' >2</h5>
			  <div class="grow grow1">
				<p><font style="color: white">Insurance</font></p>
			  </div>
			</div>
			</a>
		</div>
	</div>
	<div class="col-md-3 widget widget1">
		<div class="r3_counter_box">
		<a href="insurancerepairedlist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-lock"></i>
			<div class="stats">
			  <h5 class='numscroller' >3</h5>
			  <div class="grow grow2">
				<p><font style="color: white">Insurance repaired</font></p>
			  </div>
			</div>
			</a>
		</div>
	</div>
    <main>
        <!-- <form class="form-inline">
            <label class="" for="inlineFormInputName2">Name</label>
            <input type="text" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Jane Doe">                                                            
            
            <button type="submit" class="btn btn-primary mb-2">Submit</button>
        </form> -->
        
    </main>

<%@include file="../footer.html"%>