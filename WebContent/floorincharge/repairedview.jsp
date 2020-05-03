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

<%
  if( ! ((String)session.getAttribute("officer_role")).equals("floor_incharge")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>

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
    <!-- openable navbar -->
    <header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
            <a href="#" class="w3-bar-item w3-button">Link 1</a>
            <a href="#" class="w3-bar-item w3-button">Link 2</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
        </div>
    </header>
    <main id="main">
        <div class="my-new-header">
            <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&#9776;</button>
            <span>JCMS</span>
        </div>

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
                                        </tr>

							<%
								int srno=0;
								List<JcPart> list = JcPartDao.getByNumber(jobcard_number, "completed");
								Iterator<JcPart> itr2 = list.iterator();
								while (itr2.hasNext()) {
									JcPart jp = itr2.next();
									srno++;
									String part_name = jp.getPartName();
							%>
							<td><%=srno%></td>
							<td><%=part_name%></td>
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
	String service_name=js.getServiceName();
	
	%>
		<td><%= srno1 %></td>
		<td><%= service_name %></td>
		
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
	String lubricant_name=jl.getLubricantName();
	%>
		<td><%= srno2 %></td>
		<td><%= lubricant_name %></td>
		
	</tr>
	
	<% 
	}
%>
                                        </tr>
                                    
                                    </tbody>
                                </table>
                    </div>
                    <div class="col-md-6">
                    <label for="ddate" style="margin-left: 8px;"><b>Delivery Date:<%= ji.getDeliveryDate() %> </label><br>
                    <label for="toalamount" style="margin-left: 8px;"><b>Total Amount: <%=JobcardInfoDao.getFinalAmount(jobcard_number) %></b></label>
                    </div>

                  
                    <label for="dtime" style="margin-left: 8px;"><b>Delivery Time: <%= ji.getDeliveryTime() %></label>
                </div>
                      
            <div class="row">
                        <div class="col-md"></div>
                        <div class="col-md-1">
                            <a class="btn btn-secondary my-btn btn-lg" href="repairedlist.jsp">Close</a>
                        </div>
                        <div class="col-md"></div>
                    </div>
         </div> 
    </main>





<%@include file="../footer.html"%>