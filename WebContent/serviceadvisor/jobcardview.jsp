<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.AdvisorSolutionDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.CustomerComplainDao"%>
<%@page import="modal.CustomerComplain"%>
<%@page import="java.util.List"%>
<%@page import="modal.AdvisorSolution"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleModelVarientDao"%>
<%@page import="modal.JobcardInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@page import="modal.JcAccessories"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.JcAccessoriesDao"%>
<%@page import="modal.JobcardInfoDao"%>
<!DOCTYPE html>
<html>
<head>
	 <!-- links.html -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Index</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <link rel="stylesheet" type="text/css" media="screen" href="../materialize/css/materialize.css"> -->
    <!-- <link rel="stylesheet" href="../materialize/css/materialize.css"> -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../public/style.css">

    <!-- w3 links -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <!-- fontawesome CDN -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
    <!-- <script src="../materialize/js/materialize.js"></script> -->
    <!-- <script src="../materialize/js/materialize.min.js"></script> -->
     <script src="../public/js/jquery.dataTables.min.js"></script>
    <script src="../public/js/data-tables-script.js"></script>
    
    <!-- <script src="./main.js"></script> -->
    <!-- <link rel="stylesheet" href="./customize.css"> -->
    <link rel="stylesheet" href="../public/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="../public/style.css">
    <!-- /links.html -->
	
</head>
<body style="background-color:#ffe6e6";>
 <% //loading all required data
 int jobcardNumber = Integer.parseInt(request.getParameter("id"));
 String vehicleNumber = JobcardInfoDao.getVNByNumber(jobcardNumber);
 CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicleNumber);
 VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicleNumber);
 JobcardInfo jci = JobcardInfoDao.getAllByNumber(vehicleNumber);
 JcAccessories jca = JcAccessoriesDao.getByNumber(jobcardNumber);
 int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicleNumber);
	String company_model = VehicleModelDao.getModelName(vehicle_model_id);
	String varient = VehicleModelVarientDao.getVarientName(vehicle_model_id);
	OfficerInfo oi = OfficerInfoDao.getByUsername(jci.getOfficeUsername());
	String saName = oi.getOfficerName();
 %>
	<div class="container">
		<div>
			<div class="row">
				<div class="col-md-4">
					<i class="fa fa-car" style="font-size: 50px;"></i>
					<%= vehicleNumber %>
				</div>
				<div class="col-md-4"><center><h1>RiyaCars</h1></center></div>
				<div class="col-md-4" align="right">
					<i class="fa fa-clipboard" style="font-size: 50px;"></i>
					JCNo.<%= jobcardNumber %>
				</div>
			</div><hr>
		</div><br>
			<div class="row">
				<div class="col-md-6">
					<div class="row" style="border: solid;">
						<div class="col-md-6">
							<label for="cname">Customer Name: </label>
						</div>
						<div class="col-md-6">
							<label for="cname"><%=ci.getCustomerName() %></label>
						</div>
						<div class="col-md-6">
							<label for="email">Email:</label>
						</div>
						<div class="col-md-6">
							<label for="email"><%= ci.getCustomerEmail() %></label>
						</div>
						<div class="col-md-6">
							<label for="arriavld">Mobile No:</label>
						</div>
						<div class="col-md-6">
							<label for="arriavld"><%=ci.getCustomerContact() %></label>
						</div>
						<div class="col-md-6">
							<label for="arriavld">Arrival Date:</label>
						</div>
						<div class="col-md-6">
							<label for="arriavld"><%= jci.getArrivalDate() %></label>
						</div>
						<div class="col-md-6">
							<label for="arriavlt">Arrival Time:</label>
						</div>
						<div class="col-md-6">
							<label for="arriavlt"><%= jci.getArrivalTime() %></label>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="row" style="border: solid;">
						<div class="col-md-6">
							<label for="vin">VIN:</label>
						</div>
						<div class="col-md-6">
							<label for="vin"><%=vi.getVinNumber() %></label>
						</div>
						<div class="col-md-6">
							<label for="fueltype">Fuel Type:</label>
						</div>
						<div class="col-md-6">
							<label for="fueltype"><%= vi.getFuelType() %></label>
						</div>
						<div class="col-md-6">
							<label for="runningkm">Running Km:</label>
						</div>
						<div class="col-md-6">
							<label for="runningkm"><%= jci.getRunningKm() %></label>
						</div>
						<div class="col-md-6">
							<label for="car">Car:</label>
						</div>
						<div class="col-md-6">
								<label for="car"><%=company_model +" - "+ varient %></label>
						</div>
						<div class="col-md-6">
							<label for="availablefuel">Available Fuel:</label>
						</div>
						<div class="col-md-6">
							<label for="availablefuel"><%=jci.getAvailableFuel()+"%" %></label>
						</div>
					</div>
				</div>
				
				<div class="col-md-12">
					<hr color=black>
					<div class="row">
						<div class="col-md-6">
							<div style="background-color:#cc2900; height: 25%;">	
								<center><font style="color: black; size: 25px;  ">Request</font><center>
							</div>
							<table class="table table-striped table-bordered customer-verification-info-table">
		                                    <tbody>
		                                    	  <tr>
		                                        	<th width="20">SrNo.</th>
		                                            <th>Complain</th>
		                                        </tr>
		                                    	<% List<CustomerComplain> custList = CustomerComplainDao.getAll(jobcardNumber);
		                                    		Iterator<CustomerComplain> custItr = custList.iterator();
		                                    		int i = 1;
		                                    		while(custItr.hasNext())
		                                    		{
		                                    			CustomerComplain cc = custItr.next();
		                                    	%>
		                                      	<tr>
		                                        	<td><%=i %></td>
		                                        	<td clospan=3><%=cc.getCustomerComplain() %></td>
		                                        </tr>
		                                        <% i++;
		                                        } %>
		                                        
		                                    </tbody>
		                    </table>
		                </div>
						<div class="col-md-6">
							<div style="background-color: #4abdac; height: 25%;">	
								<center><font style="color: black; size: 25px;  ">Solution</font><center>
							</div>
							<table class="table table-striped table-bordered customer-verification-info-table">
		                                    <tbody>
		                                        <tr>
		                                        	<th width="20">SrNo.</th>
		                                            <th w>Solution</th> 
		                                            <th >Price</th>
		                                        </tr>
		                                        <% List<AdvisorSolution> advList = AdvisorSolutionDao.getAll(jobcardNumber);
		                                    		Iterator<AdvisorSolution> advItr = advList.iterator();
		                                    		int j = 1;
		                                    		int totalEstimatedPrice = 0;
		                                    		while(advItr.hasNext())
		                                    		{
		                                    			AdvisorSolution as = advItr.next();
		                                    			totalEstimatedPrice += as.getPrice();
		                                    			
		                                    	%>
		                                      	<tr>
		                                        	<td><%=j %></td>
		                                        	<td><%=as.getDescription() %></td>
		                                        	<td><%=as.getPrice() %></td>
		                                        </tr>
		                                        <% j++;
		                                        } %>
		                                    </tbody>
		                    </table>
		                </div>
					</div>
				</div>

				<div class="col-md-12">
					<hr>
				<div class="row">
					<div class="col-md-4" style="border: solid;">
						<div class="row">
						<div class="col-md-8">
							<label for="eprice">Estimated Price</label><br>
							<label for="ddate">Delivery Date</label><br>
							<label for="dtime">Delivery Time</label><br>
							<label for="sdname">Service Advisor Name:</label><br>
							<label for="sacno">Service Advisor ContactNo:</label>
						</div>
						<div class="col-md-4">
							<label for="eprice"><%=totalEstimatedPrice %></label><br>
							<label for="ddate"><%=jci.getDeliveryDate() %></label><br>
							<label for="dtime"><%=jci.getDeliveryTime() %></label><br>
							<label for="sdname"><%=saName %></label><br>
							<label for="sacno"><%=oi.getOfficerContact() %><label>
						</div>
						</div>
					</div>
					<div class="col-md-4"><center><img src="<%=jca.getImage() %>" style="width:300px;height:300px;"/></center>
					</div>
					<div class="col-md-4" style="border: solid;">
						<div class="row">
							<div class="col-md-6">
							<label for="Toolkits">Tool Kits</label></div>
							<div class="col-md-2">
							<label for="Toolkits">Yes/No</label></div>
							</div>
								<div class="row">
								<div class="col-md-6">
									<label for="">Toolkit</label><br>
									<label for="">Spare Wheel</label><br>
									<label for="">Jack And Handle</label><br>
									<label for="">Mats</label><br>
									<label for="">Wheel Caps</label><br>
									<label for="">Mud Flaps</label><br>
									<label for="">Sterio</label><br>
									<label for="">Clock or Photo</label><br>
									<label for="">Other</label>
								</div>
								<div class="col-md-2">
									<label for=""><%=jca.isToolkit()?"Yes":"No"%></label>
		                                                <br>
		                           <label for=""> <%=jca.isSpareWheel()?"Yes":"No"%></label>
		                            					<br>
		                          <label for="">  <%=jca.isJackAndHandle()?"Yes":"No"%></label>
		                            					<br>
		                          <label for="">  <%=jca.isMats()?"Yes":"No"%></label>
		                                                <br>
		                            <label for=""> <%=jca.isWheelCaps()?"Yes":"No"%></label>
		                                                <br>
		                            <label for="">  <%=jca.isMudFlaps()?"Yes":"No"%></label>
		                                                <br>
		                           <label for="">    <%=jca.isSterio()?"Yes":"No" %></label>
		                                                <br>
		                           <label for="">  <%=jca.isClockOrPhoto()?"Yes":"No" %></label>
		                             					<br>
		                            <label for=""> <%=jca.getOther() %></label>
								</div>
							</div>
						</div>
					</div>
					<hr color=black>
					<div class="row">
						<div class="col-md-6">
							<br>
							<center><hr style="width:30%;border: 1px solid;" >
							<label for="sasign">Service Advisor Sign</label></center>
						</div>
						<div class="col-md-6">
							<br>
							<center>
							<hr style="width:30%; border: 1px solid;">
							<label for="csign">Customer Sign</label></center>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>		
</body>
</html>