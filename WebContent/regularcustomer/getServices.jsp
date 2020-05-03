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
	 <table id="data-table-simple-2" class="table table-striped">
     <thead>
         <th>Name</th>
         <th>Description</th>
         <th>Price</th>
         <th>Add</th>
     </thead>
     <%     
List<VehicleServiceDetails> list1 = VehicleServiceDetailsDao.getSuggestionByKm(running_km,model_varient_id,vehicleNumber);
Iterator<VehicleServiceDetails> itr1=list1.iterator();  
while(itr1.hasNext()){ 
VehicleServiceDetails vsd = itr1.next();
%>
     <tbody>
     <tr>
     <td><%= vsd.getServiceName() %></td>
		<td><%= vsd.getServiceDetails() %></td>
		<td><%=vsd.getServicePrice() %></td>
		<td><a href="javascript:void(0)" onclick="serviceAdd('<%= vsd.getServiceId() %>','<%= vehicleNumber %>')"> + </a></td>
     </tr>           
<%
} }
%>
</table>