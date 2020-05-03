<%@page import="modal.VehicleCompanyDao"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.JcLubricantDao"%>
<%@page import="modal.JcLubricant"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="modal.JcService"%>
<%@page import="modal.VehiclePartDetailsDao"%>
<%@page import="modal.VehiclePartDetails"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JcPart"%>
<%@page import="java.util.List"%>
<%@page import="modal.JcPartDao"%>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.CustomerInfo"%>
<%@include file="../header.html" %>
<title>Repaired View</title> 
<body>  
  <%
  OfficerInfo oi = OfficerInfoDao.getAllByRole("floor_incharge");
  int jobcard_number = Integer.parseInt(request.getParameter("id")); 
  String vehicle_number = JobcardInfoDao.getVNByNumber(jobcard_number);
  CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
  VehicleInfo vi=VehicleInfoDao.getAllByNumber(vehicle_number);
  JobcardInfo ji=JobcardInfoDao.getAllByNumber(vehicle_number);
  int vehicle_company_id=	vi.getVehicleCompany();	
  int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
  String company_model = VehicleModelDao.getModelName(vehicle_model_id);
  String company_name = VehicleCompanyDao.getCompanyName(vehicle_company_id);
  %>  
  
  <%@include file="saSidebar.jsp" %>

  <main id="main">
   <%@include file="../navbar.jsp" %>

 <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="saDashboard.jsp">Dashboard</a></li>
                 <li class="breadcrumb-item"><a href="repairedlist.jsp">Repaired Cars</a></li>
                <li class="breadcrumb-item active" aria-current="page">Repaired Car View </li>
                
            </ol>
        </nav>    


   <div class="container-95">
    <div class="my-form" id="verify-static-details">
        <div class="my-form-heading">
            <h5>Name</h5>
        </div>


        <div class="row my-form-row">
            <div class="col-md-6">
                <table class="table table-striped table-bordered customer-verification-info-table">
                    <tbody>
                        <tr>
                            <th>Vehicle Number:</th>
                            <td><%=vehicle_number %></td>
                        </tr>
                        <tr>
                            <th>Customer Name:</th>
                            <td><%= ci.getCustomerName() %></td>
                        </tr>
                        <tr>
                            <th>Contact No.:</th>
                            <td><%= ci.getCustomerContact() %></td>
                        </tr>                                        
                        <tr>
                            <th>Car Name:</th>
                            <td> <%=  company_model %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <table class="table table-striped table-bordered customer-verification-info-table">
                    <tbody>
                        <tr>
                            <th>Arrival Date:</th>
                            <td><%= ji.getArrivalDate() %></td>
                        </tr>
                        <tr>
                            <th>Arrival Time:</th>
                            <td><%= ji.getArrivalTime() %></td>
                        </tr>
                        <tr>
                            <th>Superwisor Name:</th>
                            <td><%= oi.getOfficerName() %> </td>
                        </tr>
                        <tr>
                            <th>Jobcard No.:</th>
                            <td><%= jobcard_number %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <h6 style="margin-left:7px;">Approved Parts</h6>
                <table class="table table-striped table-bordered customer-verification-info-table">
                    <tbody>
                        <tr>
                            <th>Sr.No</th>
                            <th>Name</th> 
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
						<tr>
                        <%
                        int srno=0;
                        List<JcPart> list = JcPartDao.getByNumber(jobcard_number, "approved");
                        Iterator<JcPart> itr2 = list.iterator();
                        double approvedprice = 0;
                        while (itr2.hasNext()) {
                        JcPart jp = itr2.next();
                        srno++;
                        %>
                        <td><%=srno%></td>
                        <td><%=jp.getPartName()%></td>
                        <td><%=jp.getPartQuantity()%></td>
                        <td><%=jp.getPartPrice()%></td>   
                        <% approvedprice+=jp.getPartPrice(); %>                     
                    </tr>
                    <%
                }
                %>
                <tr>
                	<td colspan=4>Total price of the approved parts : <b> <%=approvedprice %></b></td>
                </tr>
				
            </tbody>
        </table>
    </div>
    <div class="col-md-6">
        <h6>Not Approved Parts</h6>
        <table class="table table-striped table-bordered customer-verification-info-table">
                    <tbody>
                        <tr>
                            <th>Sr.No</th>
                            <th>Name</th> 
                            <th>Quantity</th>
                            <th>Price</th>
                        </tr>
						<tr>
                        <%
                        int srno1=0;
                        List<JcPart> list3 = JcPartDao.getByNumber(jobcard_number, "pending");
                        Iterator<JcPart> itr3 = list3.iterator();  
                        double rejectedprice = 0;
                        while (itr3.hasNext()) {
                        JcPart jp1 = itr3.next();
                        srno++;
                        %>
                        <td><%=srno%></td>
                        <td><%=jp1.getPartName()%></td>
                        <td><%=jp1.getPartQuantity()%></td>
                        <td><%=jp1.getPartPrice()%></td> 
                        <% rejectedprice+=jp1.getPartPrice(); %>                       
                    </tr>
                    <%  
                }
                %>
				<tr>
					<td colspan=4>Price of rejected parts : <b><%=rejectedprice %></b></td>
				</tr>
            </tbody>
        </table>
   </div>
   <div class="col-md-12">
    <table class="table table-striped">
        <tr>
            <td><label for="ddate" style="margin-left: 8px;"> <b>Delivery Date:<%= ji.getDeliveryDate() %></b> </label></td>
            <td align="center"> <label for="dtime" style="margin-left: 8px;"><b>Delivery Time: <%= ji.getDeliveryTime() %></b></label></td>
           
                    
        </tr>
    </table>
    </div>
    </div>

    <div class="row">
        <div class="col-md"></div>
        <div class="col-md-2">
            <% String link= "insurancebill.jsp?id="+jobcard_number;  %>
            <a class="btn btn-secondary my-btn btn-lg" href=<%= link %> >Generate Bill</a>
        </div>
        <div class="col-md"></div>
    </div>
</div>
</main>





<%@include file="../footer.html"%>