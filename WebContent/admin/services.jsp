<%@page import="modal.VehicleServiceDetailsDao"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="modal.VehicleModelVarientDao"%>
<%@page import="modal.VehicleModelVarient"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleModel"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.VehicleCompany"%>
<%@page import="modal.VehicleCompanyDao"%>
<%@page import="modal.VehiclePartDetails"%>
<%@page import="modal.VehiclePartDetailsDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
  <%
  if( ! ((String)session.getAttribute("officer_role")).equals("admin")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../public/style.css">

    <!-- w3 links -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- fontawesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    
     <div class="w3-sidebar w3-light-grey w3-bar-block" style="width:20%">
        <h3 class="w3-bar-item">Menu</h3>
         <a href="adminDashboard.jsp" class="w3-bar-item w3-button">Dashboard</a>     
        <a href="companies.jsp" class="w3-bar-item w3-button">Manages Cars</a>
        <a href="addstaff.jsp" class="w3-bar-item w3-button">Manages Staff</a>
        <a href="changeallocation.jsp" class="w3-bar-item w3-button">Change Allocated Cars</a>
    </div>

    <!-- Page Content -->
    <div style="margin-left:20%">

    <!-- Page Content -->
    <main id="main">

         <%@include file="../navbar.jsp" %>
        
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="companies.jsp">Companies</a></li>
                <li class="breadcrumb-item"><a href="models.jsp">Models</a></li>
                <li class="breadcrumb-item"><a href="varients.jsp">Varients</a></li>
                <li class="breadcrumb-item" aria-current="page">Services</li>
            </ol>
        </nav>    
        
        <form action="../AddService" method="post" class="my-form">
            <div class="my-form-heading">
                <h5>Add New Service</h5>
            </div>
            <div class="container-95">                
                <div class="row my-form-row">
                    <h6>Enter New Service</h6>
                    <div class="col-md-1">
                        <label for="service_name">Service</label>                                    
                    </div>
                    <div class="col-md-2">
                        <input type="text" name="service_name" id="service_name">                                
                        <input type="hidden" name="vid" id="vid" value="<%= request.getParameter("vid") %>">
                    </div>
                    <div class="col-md-1">
                        <label for="service_price">Price</label>
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="service_price" id="service_price">
                    </div>
                    <div class="col-md-1">
                        <label for="service_details">Description</label>
                    </div>
                    <div class="col-md-5">
                        <textarea name="service_details" id="service_details"></textarea>
                    </div>
                    <div class="col-md-1">
                        <label for="service_validity">Validity(Month)</label>
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="service_validity" id="service_validity" value="1">
                    </div>                    
                </div>
                <div class="my-submit-div">
                    <input type="submit" name="submit" id="submit" class="btn btn-secondary btn-sm" value="Add">
                </div>
            </div>                                   
        </form>
                
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Services</h4>
                </center>
            </div>
            <div class="my-dashboard-content mt-3">
                <div class="row">
                	<% 
                	int vid =Integer.parseInt(request.getParameter("vid"));
			        	List<VehicleServiceDetails> list = VehicleServiceDetailsDao.getServicesByVarientId(vid);
			        	Iterator<VehicleServiceDetails> itr = list.iterator();
			        	while(itr.hasNext()){
			        		VehicleServiceDetails vpd = itr.next();
			        		
			        		%>
					        <div class="col-md-4">		                        
                                <div class="my-dashboard-box-servings">
                                    <div class="my-dashboard-box-header">
                                        <h6><%= vpd.getServiceName() %> <i class="fa fa-puzzle-piece"></i></h6>
                                    </div>
                                    <div class="my-dashboard-box-content">
                                        <div class="row">
                                            <div class="col-md-12">
                                                Price : <%= vpd.getServicePrice() %>
                                                <br>
                                                Details : <%= vpd.getServiceDetails() %>
                                                <br>
                                                Validity : <%= vpd.getServiceValidity() %>
                                            </div>                                        
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <button onclick="editService<%= vpd.getServiceId() %>()" class="btn btn-primary btn-sm">Edit</button>
                                            </div>
                                            <div class="col-md-6">                                                                                            
                                                <form action="../DeleteService" method="post">                                                    
                                                    <input type="hidden" name="service_id" value="<%= vpd.getServiceId() %>">
                                                    <input type="hidden" name="vid1" id="vid1" value="<%= request.getParameter("vid") %>">
                                                    <input type="submit" name="submit" value="Delete" class="btn btn-danger btn-sm" onclick="alertUserDelete<%= vpd.getServiceId() %>()"> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                                
		                    </div>  
                            <script>
                                function alertUserDelete<%= vpd.getServiceId() %>() {
                                    alert("You are deleting your <%= vpd.getServiceName() %> !");
                                }
                            </script>                          
			        		<%
			        	}
			        %>                                                            
                </div>
            </div>
        </div>
    </div>

    <%-- <footer class="my-footer">
        <div class="my-footer-copyright container-95">
            Copyright @ JCMS 2019
        </div>
    </footer>
     --%>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>