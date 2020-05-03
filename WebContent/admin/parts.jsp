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

         <%@include file="../navbar.jsp" %>
        
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="adminDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="companies.jsp">Companies</a></li>
                <li class="breadcrumb-item"><a href="models.jsp">Models</a></li>
                <li class="breadcrumb-item"><a href="varients.jsp">Varients</a></li>
                <li class="breadcrumb-item" aria-current="page">Parts</li>
            </ol>
        </nav>    
        
        <form action="../AddPart" method="post" class="my-form">
            <div class="my-form-heading">
                <h5>Add New Part</h5>
            </div>
            <div class="container-95">                
                <div class="row my-form-row">
                    <h6>Enter New Part</h6>
                    <div class="col-md-1">
                        <label for="part_name">Part</label>                                    
                    </div>
                    <div class="col-md-2">
                        <input type="text" name="part_name" id="part_name">                                
                        <input type="hidden" name="vid" id="vid" value="<%= request.getParameter("vid") %>">
                    </div>
                    <div class="col-md-1">
                        <label for="part_price">Price</label>
                    </div>
                    <div class="col-md-2">
                        <input type="text" name="part_price" id="part_price">
                    </div>
                    <div class="col-md-1">
                        <label for="part_quantity">Quantity</label>
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="part_quantity" id="part_quantity" value="1">
                    </div>
                    <div class="col-md-1">
                        <label for="part_validity">Validity(Month)</label>
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="part_validity" id="part_validity" value="1">
                    </div>
                    <div class="col-md-1">
                        <label for="part_labour">Labour</label>
                    </div>
                    <div class="col-md-2">
                        <input type="number" name="part_labour" id="part_labour" value="1">
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
                    <h4>Parts</h4>
                </center>
            </div>
            <div class="my-dashboard-content mt-3">
                <div class="row">
                	<% 
                	int vid =Integer.parseInt(request.getParameter("vid"));
			        	List<VehiclePartDetails> list = VehiclePartDetailsDao.getPartsByVarientId(vid);
			        	Iterator<VehiclePartDetails> itr = list.iterator();
			        	while(itr.hasNext()){
			        		VehiclePartDetails vpd = itr.next();
			        		
			        		%>
					        <div class="col-md-4">		                        
                                <div class="my-dashboard-box-servings">
                                    <div class="my-dashboard-box-header">
                                        <h6><%= vpd.getPartName() %> <i class="fa fa-puzzle-piece"></i></h6>
                                    </div>
                                    <div class="my-dashboard-box-content">
                                        <div class="row">
                                            <div class="col-md-12">
                                                Price : <%= vpd.getPartPrice() %>
                                                <br>
                                                Labour : <%= vpd.getPartLabour() %>
                                                <br>
                                                Validity : <%= vpd.getPartValidity() %>
                                            </div>                                        
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <!-- Button trigger modal -->
											    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal<%= vpd.getPartId() %>">Edit</button>
											    
											    <!-- Modal -->
											    <div class="modal fade" id="exampleModal<%= vpd.getPartId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
											    <div class="modal-dialog" role="document">
											        <div class="modal-content">
											        <div class="modal-header">
											            <h5 class="modal-title" id="exampleModalLabel">Edit <%= vpd.getPartName() %></h5>
											            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											            <span aria-hidden="true">&times;</span>
											            </button>
											        </div>
											        <div class="modal-body">
											            <form action="../UpdatePart" id="update_part_form<%= vpd.getPartId() %>" method="post" name="update_part_form">
											            	<div class="row">
											            		<div class="col-md-6">
											            			Part :
											            		</div>
											            		<div class="col-md-6">
											            			<input type="text" name="part_name" value="<%= vpd.getPartName() %>">
											            			<input type="hidden" name="part_id" value="<%= vpd.getPartId() %>">
											            			<input type="hidden" name="vid" value="<%= vpd.getModelVarientId() %>">
											            		</div>
											            	</div>
											            	<div class="row">
											            		<div class="col-md-6">
											            			Price : 
											            		</div>
											            		<div class="col-md-6">
											            			<input type="number" name="part_price" value="<%= vpd.getPartPrice() %>">
											            		</div>
											            	</div>
											            	<div class="row">
											            		<div class="col-md-6">
											            			Quantity : 
											            		</div>
											            		<div class="col-md-6">
											            			<input type="number" name="part_quantity" value="<%= vpd.getPartQuantity() %>">
											            		</div>
											            	</div>
											            	<%-- <div class="row">
											            		<div class="col-md-6">
											            			Validity(yr) : 
											            		</div>
											            		<div class="col-md-6">
											            			<input type="number" name="part_validity" value="<%= vpd.getPartValidity() %>">
											            		</div>
											            	</div> --%>
											            	<div class="row">
											            		<div class="col-md-6">
											            			Labour :
											            		</div>
											            		<div class="col-md-6">
											            			<input type="number" name="part_labour" value="<%= vpd.getPartLabour() %>">
											            		</div>
											            	</div>
											            	<input type="submit" class="btn btn-success" form="update_part_form<%= vpd.getPartId() %>" value="Save Changes">
											            </form>
											        </div>
											        <div class="modal-footer">											        	
											            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
											            <!-- <button type="button" class="btn btn-primary">Update</button> -->
											        </div>
											        </div>
											    </div>
											    </div>
                                            </div>
                                            <div class="col-md-6">                                                                                            
                                                <form action="../DeletePart" method="post">                                                    
                                                    <input type="hidden" name="part_id" value="<%= vpd.getPartId() %>">
                                                    <input type="hidden" name="vid1" id="vid1" value="<%= request.getParameter("vid") %>">
                                                    <input type="submit" name="submit" value="Delete" class="btn btn-danger btn-sm" onclick="alertUserDelete<%= vpd.getPartId() %>()"> 
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                                                
		                    </div>  
                            <script>
                                function alertUserDelete<%= vpd.getPartId() %>() {
                                    alert("You are deleting your <%= vpd.getPartName() %> !");
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