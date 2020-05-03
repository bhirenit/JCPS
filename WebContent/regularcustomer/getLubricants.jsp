<%@page import="modal.VehicleLubricantDetailsDao"%>
<%@page import="modal.VehicleLubricantDetails"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="java.util.List"%>
<%@page import="modal.VehicleServiceDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%
if(request.getParameter("running_km")!=null) 
{    
	int running_km = Integer.parseInt(request.getParameter("running_km"));
	int model_varient_id = Integer.parseInt(request.getParameter("model_varient_id"));
	String vehicleNumber = request.getParameter("vehicleNumber");
	%>
	 <table id="data-table-simple-3" class="table table-striped">
     <thead>
         <th>Name</th>
         <th>Price</th>
         <th>Quantity</th>
         <th>Add</th>
     </thead>
     <%     
List<VehicleLubricantDetails> list1 = VehicleLubricantDetailsDao.getSuggestionByKm(running_km,model_varient_id,vehicleNumber);
Iterator<VehicleLubricantDetails> itr1=list1.iterator(); 
while(itr1.hasNext()){ 
   VehicleLubricantDetails vld = itr1.next();
%>
     <tbody>
     <tr>
     <td><%= vld.getLubricantName() %></td>
		<td><%= vld.getLubricantPrice() %></td>
		<td><%=vld.getLubricantQuantity()%></td>
		<td><a href="javascript:void(0)" onclick="lubricantAdd('<%= vld.getLubricantId() %>','<%= vehicleNumber %>')"> + </a></td>
     </tr>           
<%
} }
%>
</table>