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
            <div class="col-md-4">
                <h6 style="margin-left:7px;">Parts</h6>
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
                        List<JcPart> list = JcPartDao.getByNumber(jobcard_number, "completed");
                        Iterator<JcPart> itr2 = list.iterator();
                        while (itr2.hasNext()) {
                        JcPart jp = itr2.next();
                        srno++;
                        %>
                        <td><%=srno%></td>
                        <td><%=jp.getPartName()%></td>
                        <td><%=jp.getPartQuantity()%></td>
                        <td><%=jp.getPartPrice()%></td>                        
                    </tr>
                    <%
                }
                %>
				
            </tbody>
        </table>
    </div>
    <div class="col-md-4">
        <h6>Services</h6>
        <table class="table table-striped table-bordered customer-verification-info-table">
            <tbody>
                <tr>
                    <th>Sr.No</th>
                    <th>Name</th>
                    <th>Price</th>                                        
                </tr>
                <tr>
                    <%
                    int srno1=0;
                    List<JcService> list1 = JcServiceDao.getByNumber(jobcard_number, "completed");
                    Iterator<JcService> itr3 = list1.iterator();
                    while (itr3.hasNext())
                        {
                           JcService js =  itr3.next();
                           srno1++;
                           %>
                           <td><%= srno1 %></td>
                           <td><%= js.getServiceName() %></td>
                           <td><%= js.getServicePrice() %></td>

                       </tr>

                       <% 
                   }
                   %>

               </tr>

           </tbody>
       </table>
   </div>
   <div class="col-md-4">
    <h6>Lubricants</h6>
    <table class="table table-striped table-bordered customer-verification-info-table">
        <tbody>
            <tr>
                <th>Sr.No</th>
                <th>Name</th> 
                <th>Lubricant</th>
            </tr>
            <tr>
             <%
             int srno2=0;
             List<JcLubricant> list2 = JcLubricantDao.getByNumber(jobcard_number, "completed");
             Iterator<JcLubricant> itr4 = list2.iterator();
             while (itr4.hasNext())
                {
                   JcLubricant jl =  itr4.next();
                   srno2++;
                   
                   %>
                   <td><%= srno2 %></td>
                   <td><%= jl.getLubricantName() %></td>
                   <td><%= jl.getLubricantPrice() %></td>

               </tr>

               <% 
           }
           %>
       </tr>

   </tbody>
</table>
</div>
<div class="col-md-12">
    <table class="table table-striped">
        <tr>
            <td><label for="ddate" style="margin-left: 8px;"> <b>Delivery Date:<%= ji.getDeliveryDate() %></b> </label></td>
            <td align="center"> <label for="dtime" style="margin-left: 8px;"><b>Delivery Time: <%= ji.getDeliveryTime() %></b></label></td>
            <td align="right"> <label for="amount" style=""><b>Total Amount: <%= JobcardInfoDao.getFinalAmount(jobcard_number) %></b></label></td>
                    
        </tr>
    </table>
    </div>
    </div>

    <div class="row">
        <div class="col-md"></div>
        <div class="col-md-2">
            <% String link= "bill.jsp?id="+jobcard_number;  %>
            <a class="btn btn-secondary my-btn btn-lg" href=<%= link %> >Generate Bill</a>
        </div>
        <div class="col-md"></div>
    </div>
</div>
</main>





<%@include file="../footer.html"%>