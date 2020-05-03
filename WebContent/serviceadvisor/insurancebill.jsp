<!DOCTYPE html>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.VehicleLubricantDetailsDao"%>
<%@page import="modal.VehicleLubricantDetails"%>
<%@page import="modal.JcLubricantDao"%>
<%@page import="modal.JcLubricant"%>
<%@page import="modal.VehicleServiceDetailsDao"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="modal.JcService"%>
<%@page import="modal.VehiclePartDetails"%>
<%@page import="modal.VehiclePartDetailsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JcPart"%>
<%@page import="modal.JcPartDao"%>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="java.util.List"%>
<html>
<head>
<title>Bill</title>
<style type="text/css">
.boxed {
	border: 1px solid black;
	margin: 80px;
}

.fix {
	margin-left: 30px;
	margin-right: 30px;
}
</style>
 <%
  if( ! ((String)session.getAttribute("officer_role")).equals("service_advisor")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
</head>
<body>


	<%
		String officer_username = (String) session.getAttribute("officer_username");
		int jobcard_number = Integer.parseInt(request.getParameter("id"));
		String vehicle_number = JobcardInfoDao.getVNByNumber(jobcard_number);
		CustomerInfo ci = CustomerInfoDao.getAllByNumber(vehicle_number);
		VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicle_number);
		JobcardInfo ji = JobcardInfoDao.getAllByNumber(vehicle_number);
		OfficerInfo oi = OfficerInfoDao.getByUsername(officer_username);
		int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicle_number);
		String company_model = VehicleModelDao.getModelName(vehicle_model_id);
		double total_price = 0;
	%>

	<div class="boxed">
		<br>
		<div class="fix">
			<table style="width: 100%;">
				<tr>
					<th align="left" style="width: 50%; color: red;"><b>RIYA</b></th>
					<th align="right" style="width: 50%; color: blue;">INVOICE</th>
				</tr>
			</table>
		</div>
		<hr class="fix" color="gray">
		<div class="fix">
			<table style="width: 100%;">
			<tr>	<td align="left" style="width: 50%;">Riya car Pvt. Ltd;<br>14,abd
					Road,palanpur<br>
				<b>123465789</b>
			
				</td>
			</tr><tr>	<td align="right" style="width: 50%;">DATE:12/03/2019<br>Bill
					No:<b>123465789</b>
				</td></tr>
			</table>
		</div>
		<hr class="fix" color="gray">
		<div class="fix">
			<table style="width: 100%;">
				<tr>
					<th bgcolor=#95C8D8 align="left" style="width: 50%">Customer
					Info</th>
					<th bgcolor=#95C8D8 align="left">Vehicle Details</th>
				</tr>
				<tr>
					<td>Name:<b><%=ci.getCustomerName()%></b></td>
					<td>Vehicle no.:<b><%=vi.getVehicleNumber()%></b></td>
				</tr>
				<tr>
					<td>Mobile No :<%=ci.getCustomerContact()%>
					</td>
					<td>Model: <%=company_model%></td>
				</tr>
				<tr>
					<td>Email : <%=ci.getCustomerEmail()%></td>
					<td>Engine No :<%=vi.getEngineNumber()%>
					</td>
				</tr>

				<tr>
					<td>Paid Using:Cash</td>
					<td>In KM Reading:<%=ji.getRunningKm()%></td>
				</tr>
				<tr>
					<td></td>
					<td>In Time: <%=ji.getArrivalDate()%> <%=ji.getArrivalTime()%></td>
				</tr>
			</table>
			<table style="width: 100%;">
				<tr>
					<th bgcolor=#95C8D8 align="left" style="width: 50%">Jobcard
					Info</th>
				<th bgcolor=#95C8D8 align="left">Adviser Details</th>
				</tr>
				<tr>
					<td>Jobcard Number:<b><%=jobcard_number%></b></td>
					<td>Adviser Name:<b><%=oi.getOfficerName()%></b></td>
				</tr>
				<tr>
					<td>Work Type: <%=ji.getWorkType()%></td>
					<td>Advisor Contact:<%=oi.getOfficerContact()%>
					</td>
				</tr>
				<tr>
					<td>Date Arrival: <%=ji.getArrivalDate()%></td>
					<td></td>
				</tr>
			</table>

			<table style="width: 100%;">
				<tr>
					<th bgcolor=#95C8D8 align="left" style="width: 5%;">Sr.No</th>
					<th bgcolor=#95C8D8 align="left" style="width: 30%;">Spare and Parts</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">Quantity</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">Price</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">Labour
						Price</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">SGST</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">CGST</th>
	
					<th bgcolor=#95C8D8 align="right" style="width: 15%;">Amount</th>
				</tr>
				<tr>
					<%
						int srno = 0;
						List<JcPart> list = JcPartDao.getByNumber(jobcard_number, "approved");
						Iterator<JcPart> itr2 = list.iterator();
						while (itr2.hasNext()) {
							JcPart jp = itr2.next();
							srno++;
							String part_name = jp.getPartName();
							int part_id = jp.getPartId();
							int part_price = jp.getPartPrice();
							int part_quantity = jp.getPartQuantity();
							double sgst = part_price * 0.09;
							double cgst = part_price * 0.09;
							VehiclePartDetails vpd = VehiclePartDetailsDao.getPartsById(part_id);
							int part_labour = vpd.getPartLabour();
							double total_part_price = 0;
					%>
					<td><%=srno%></td>
					<td><%=part_name%></td>
					<td align="right"><%=part_quantity%></td>
					<td align="right">-</td>
					<td align="right">-</td>
					<td align="right">-</td>
					<td align="right">-</td>

					<td align="right">0</td>
				</tr>

				<%
					}
				%>
			</table>
			<table style="width: 100%;">
				<tr>
					<th bgcolor=#95C8D8 align="left" style="width: 5%;">Sr.No</th>
					<th bgcolor=#95C8D8 align="left" style="width: 30%;">Spare and Parts</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">Quantity</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">Price</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">Labour
						Price</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">SGST</th>
					<th bgcolor=#95C8D8 align="right" style="width: 10%;">CGST</th>
	
					<th bgcolor=#95C8D8 align="right" style="width: 15%;">Amount</th>
				</tr>
				<tr>
					<%
						int srno1 = 0;
						List<JcPart> list5 = JcPartDao.getByNumber(jobcard_number, "pending");
						Iterator<JcPart> itr5 = list5.iterator();
						while (itr5.hasNext()) {
							JcPart jp = itr5.next();
							srno++;
							String part_name = jp.getPartName();
							int part_id = jp.getPartId();
							int part_price = jp.getPartPrice();
							int part_quantity = jp.getPartQuantity();
							double sgst = part_price * 0.09;
							double cgst = part_price * 0.09;
							VehiclePartDetails vpd = VehiclePartDetailsDao.getPartsById(part_id);
							int part_labour = vpd.getPartLabour();
							double total_part_price = part_price * part_quantity + sgst + cgst + part_labour;
							total_price += total_part_price; 
					%>
					<td><%=srno%></td>
					<td><%=part_name%></td>
					<td align="right"><%=part_quantity%></td>
					<td align="right"><%=part_price%></td>
					<td align="right"><%=part_labour%></td>
					<td align="right"><%=sgst%></td>
					<td align="right"><%=cgst%></td>

					<td align="right"><%=total_part_price%></td>
				</tr>

				<%
					}
				%>
			</table>

			
			<hr color="red">
			<table style="width: 100%;">
				<tr>
					<td>All tax included</td>
					<td align="right" style="width: 20%;"><b> Total: </b></td>
					<td style="width: 30%;" align="right"><b><%=(int)total_price%> </b> </td>
				</tr>
				<tr>
					<td></td>
					<td align="right" style="width: 20%;"><b>Round Off Amount:</b>
					</td>
					<td style="width: 30%;" align="right"><b><%=(int)total_price%></b></td>
				</tr>
				<tr>
					<td></td>
					<td align="right" style="width: 20%;"><b>Total Amount: </b> </td>
					<td style="width: 30%;" align="right"><b><%=(int)total_price%> </b></td>
				</tr>

			</table>
			<hr color="red">
			<br>
		</div>
		<div class="fix">Customer Voice</div>
		<table style="width: 100%;" class="fix">
			<tr>
				<td style="width: 90%;">Note:SMS scheduled on 16 Feb,2019
					07:56AM</td>
				<td style="width: 10%;"><b>-Poonam</b></td>
			</tr>
		</table>
		<hr color="gray" class="fix">
		<center>
			Next servicing is due on <b>Jun 17 2019</b> OR <b> 4000 KM</b>
			whichever is earlier.
		</center>

		<hr color="gray" class="fix">
		<div class="fix">
			<table style="width: 100%">
				<tr>
					<th style="width: 25%" ; align="center">
					</th>
					<th style="width: 25%" ; align="center"></th>
					<th style="width: 25%" ; align="center"></th>
					<th style="width: 25%" ; align="center"></th>
 
				</tr>
				<tr>
					<td colspan=2><hr style="width: 60%;"></td>
					<td colspan=2><hr style="width: 60%;"></td>
				<tr>
					<td colspan=2><span style="width: 40%; float: right;"><b>Manager
								Sign</b></span></td>

					<td colspan=2><span style="width: 40%; float: right;"><b>Security
								Sign</b></span></td>

				</tr>
			</table>
		</div>
		<hr color="gray" class="fix">
		<center>
			<h4>Thank you! Serice Regularly and Ride safely.</h4>
		</center>
		<!-- <h3> -->
			<form action="../SaveHistory" method="post">
				<center>
					<input type="hidden" name="finalamount" value =<%=(int)total_price%> />
					<input type="hidden" name="id" value=<%=jobcard_number %> />
					<input type="submit" value="Pay & Genarate Pdf" />
				</center>
			</form>
			<%-- <center>
				 <a class="btn btn-secondary my-btn btn-lg" href=<%= link %>>Paymant
					& Genarate Pdf</a>
			</center> --%>
		<!-- </h3> -->
	</div>
	



</body>
</html>