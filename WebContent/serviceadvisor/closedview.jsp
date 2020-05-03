<%@page import="modal.HistoryPaymentDao"%>
<%@page import="modal.HistoryPayment"%>
<%@page import="modal.HistoryLubricantDao"%>
<%@page import="modal.HistoryLubricant"%>
<%@page import="modal.HistoryServiceDao"%>
<%@page import="modal.HistoryService"%>
<%@page import="modal.HistoryPartDao"%>
<%@page import="modal.HistoryPart"%>
<%@page import="modal.History"%>
<%@page import="modal.HistoryDao"%>
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
<title>PastHistory View</title> 
<body>  
  <%
  String vehicleNumber=request.getParameter("id");
  History h=HistoryDao.getAllByNumber(vehicleNumber);
  VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicleNumber);
	CustomerInfo ci =CustomerInfoDao.getAllByNumber(vehicleNumber);
	OfficerInfo oi = OfficerInfoDao.getByUsername(h.getOfficerUsername());
	int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicleNumber);
	String company_model = VehicleModelDao.getModelName(vehicle_model_id);
	String history_id=h.getHistoryId();
	HistoryPayment hp=HistoryPaymentDao.getAllById(history_id);
  %>  
  
  <%@include file="saSidebar.jsp" %>

  <main id="main">
   <%@include file="../navbar.jsp" %>

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
                            <td><%=vehicleNumber %></td>
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
                        <tr>
                            <th> VIN no</th>
                            <td> <%=  vi.getVinNumber() %></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6">
                <table class="table table-striped table-bordered customer-verification-info-table">
                    <tbody>
                        <tr>
                            <th>PastHistory Date:</th>
                            <td><%= h.getDeliveryDate() %></td>
                        </tr>
                        <tr>
                            <th> Service Advisor Name</th>
                            <td><%= oi.getOfficerName() %></td>
                        </tr>
                        <tr>
                            <th>Running Km</th>
                            <td><%= h.getRunningKM() %> </td>
                        </tr>
                        <tr>
                            <th>Jobcard No.:</th>
                            <td><%= h.getHistoryId() %></td>
                        </tr>
                        <tr>
                            <th>Work Type</th>
                            <td><%= h.getWorkType() %></td>
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
                        List<HistoryPart> list = HistoryPartDao.getAllById(history_id);
                        Iterator<HistoryPart> itr2 = list.iterator();
                        while (itr2.hasNext()) {
                        	HistoryPart jp = itr2.next();
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
                    List<HistoryService> list1 = HistoryServiceDao.getAllById(history_id);
                    Iterator<HistoryService> itr3 = list1.iterator();
                    while (itr3.hasNext())
                        {
                    	HistoryService js =  itr3.next();
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
             List<HistoryLubricant> list2 = HistoryLubricantDao.getAllById(history_id);
             Iterator<HistoryLubricant> itr4 = list2.iterator();
             while (itr4.hasNext())
                {
            	 HistoryLubricant jl =  itr4.next();
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

    </div>
     <table class="table table-striped table-bordered customer-verification-info-table" >
    <div class="row col-md-12">
                        <tr>
                            <th><h3>Total Amount:  <%= hp.getFinalAmount()  %></h3><th>
                         </tr>   
                    </div>
                    </table>

    <div class="row">
        <div class="col-md"></div>
        <div class="col-md-2">
           
            <a class="btn btn-secondary my-btn btn-lg" href="closedlist.jsp" >Close</a>
        </div>
        <div class="col-md"></div>
    </div>
</div>
</main>





<%@include file="../footer.html"%>