<%@page import="modal.VehicleInfo"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.AppointmentDao"%>
<%@page import="modal.Appointment"%>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="java.util.List"%>
<%@ include file="../header.html" %>
<body>	
        
     <% String vehicleNumber = request.getParameter("id");
     	Appointment app=AppointmentDao.getAll();
		int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicleNumber);
		String company_model = VehicleModelDao.getModelName(vehicle_model_id);
		CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicleNumber);
     	VehicleInfo vi= VehicleInfoDao.getAllByNumber(vehicleNumber);
     %>
    <!-- openable navbar -->
    <%@include file="receptionistSidebar.html" %>
    <main id="main">
         <%@include file="../navbar.jsp" %>
           <form action="../AllocateAppointment" method="post">
        <div class="container-95">
            <div class="my-form" id="verify-static-details">
                <div class="my-form-heading">
                    <h5><i class="fa fa-car"></i> <%= vehicleNumber %></h5>
                </div><br>
                <div class="col-md-12">
                <div class="row">
                    <div class="col-md-6">
                    <table class="table table-striped table-hover customer-verification-info-table">
                    	<tbody>
                          <tr>
                           <td>Appointment Date:</td>
                           <td><input type="date" name="request_date" id="request_date" value='<%=app.getRequestDate() %>' required></td>
                           </tr>
                            <tr>
                           <td>Customer Name:</td>
                           <td><%= ci.getCustomerName() %></td>
                           </tr>
                             <tr>
                           <td> Email:</td>
                           <td><%= ci.getCustomerEmail() %></td>
                           </tr>
                             <tr>
                           <td>Vehicle Type:</td>
                           <td><%= vi.getVehicleType() %></td>
                           </tr>
                             <tr>
                           <td>Running km:</td>
                           <td><%= app.getRunningKM() %></td>
                           </tr>
        
                        </table>
                    </div>
                    <div class="col-md-6">
                     <table class="table table-striped table-hover customer-verification-info-table">
                    	<tbody>
                          <tr>
                           <td>Appointment Time:</td>
                           <td><input type="time" name="request_time" id="request_time" value='<%=app.getRequestTime() %>' required></td>
                           </tr>
                            <tr>
                           <td>Customer Contact:</td>
                           <td><%= ci.getCustomerContact() %></td>
                           </tr>
                             <tr>
                           <td>Car Model:</td>
                           <td><%= company_model %></td>
                           </tr>
                             <tr>
                           <td>Customer Type:</td>
                           <td><%=ci.getCustomerType() %></td>
                           </tr>
                             <tr>
                           <td>Work Type:</td>
                           <td><%= app.getWorkType() %></td>
                           </tr>
        
                        </table>
                    </div>
                </div>
            </div><br>
            		
                     
                        <div class="row officer-select">
                            <div class="col-md"></div>
                            <div class="col-md-2">
                                <div class="row">
                                    <div class="col-md-12">
                                        <label for="officer_id">Service Advisor</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <select name="officer_username" id="officer_username">
                                              <%
                                        List<OfficerInfo> list = OfficerInfoDao.getByOfficerRole("service_advisor");
                                        Iterator<OfficerInfo> itr = list.iterator();
                                        while(itr.hasNext()) {
                                            OfficerInfo oi = itr.next();
                                            int count = JobcardInfoDao.getTotal(oi.getOfficerUsername(),"pending") + JobcardInfoDao.getTotal(oi.getOfficerUsername(),"arrived");
                                            out.print("<option value="+ oi.getOfficerUsername() +"> "+ oi.getOfficerName() +" "+count+ " </option>");
                                        }
                                    %>                                      
                                        </select>
                                    </div>
                                </div>
                                <div class="row">
                                 <input type="hidden" name="vehicle_number" value="<%= vehicleNumber %>">
                                    <div class="col-md-12">
                                        <input type="submit" name="submit" id="submit" value="Allocate" class="btn btn-secondary btn-sm">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md"></div>
                        </div>
                    </form>
        </div>
    </main>
<%@ include file="../footer.html" %>