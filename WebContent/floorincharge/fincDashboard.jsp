<%@page import="modal.JobcardInfoDao"%>
<%@ include file="../header.html" %>
    <title>Hello, world!</title>
  </head>
  <%
  if( ! ((String)session.getAttribute("officer_role")).equals("floor_incharge")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
  <% String officer_username = (String)session.getAttribute("officer_username");
    	String officer_name = (String)session.getAttribute("officer_name");
    	String officer_role = (String)session.getAttribute("officer_role");
    	
        %>
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
        <a href="fincDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>
       	<a href="pendinglist.jsp" class="w3-bar-item w3-button">Pending Cars</a>
       	<a href="repairedlist.jsp" class="w3-bar-item w3-button">Repaired Cars</a> 
       	
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
                <li class="breadcrumb-item" aria-current="page"><a href="fincDashboard.jsp">Dashboard</a> / </li>
            </ol>
        </nav>    

        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Superviser Dashboard</h4>
                </center>
            </div>
            
                   <%--  <div class="row">
                    	<div class="col-md-4">
                        <a href="pendinglist.jsp" class="my-dashboard-box-link">
                            <div class="my-dashboard-box">
                                <div class="my-dashboard-box-header">
                                    <h6>Pending Car<i class="fa fa-car-side"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Your Pending cars</div>
                                        <div class="col-md-2">
                                        	<span class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getCountByStatus("pending")%> data-delay='0.5' data-increment='1'><%=JobcardInfoDao.getCountByStatus("pending")%></span>
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
                                    <h6>repaired Cars <i class="fa fa-check-circle"></i></h6>
                                </div>
                                <div class="my-dashboard-box-content">
                                    <div class="row">
                                        <div class="col-md-10">Your repaired cars</div>
                                        <div class="col-md-2">
                                        	<span class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getCountByStatus("repaired")%>  data-delay='0.5' data-increment='1'><%=JobcardInfoDao.getCountByStatus("repaired")%></span>
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
		<a href="pendinglist.jsp" class="my-dashboard-box-link">
			<i class="fa fa-wrench"></i>
			<div class="stats">
			  <h5 class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getCountByStatus("pending")%> data-delay='0.5' data-increment='1'></h5>
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
			  <h5 class='numscroller' data-min='0' data-max=<%=JobcardInfoDao.getCountByStatus("pending") %> data-delay='0.5' data-increment='1'></h5>
			  <div class="grow">
				<p><font style="color: white">Repaired</p>
			  </div>
			</div>
			</a>
		</div>
	</div> 
	
        
        

    </div>
<%@include file="../footer.html"%>