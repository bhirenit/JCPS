<%@page import="modal.AppServiceDao"%>
<%@page import="modal.AppService"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="modal.JcService"%>
<%@page import="modal.VehicleServiceDetailsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.*" %>

<%
if(request.getParameter("reload_flag")!=null) 
{
	String vehicleNumber =request.getParameter("vehicleNumber");
	if(request.getParameter("reload_flag").equals("0")) {
    int id=Integer.parseInt(request.getParameter("service_id")); 
        
  
    	VehicleServiceDetails vsd  = VehicleServiceDetailsDao.getServicesById(id);
    	AppService js = new AppService();
    	js.setVehicleNumber(vehicleNumber);
    	js.setServiceId(id);
    	js.setServiceDetails(vsd.getServiceDetails());
    	js.setServiceName(vsd.getServiceName());
    	js.setServicePrice(vsd.getServicePrice());
    
        int status = AppServiceDao.save(js);
    }
        List<AppService> list = AppServiceDao.getByNumber(vehicleNumber);
      	Iterator<AppService> itr = list.iterator();
      	%>
   	<script>
      		function removeService(serviceid,vehicleNumber) {
      			 $.ajax({
      		        type: "POST",
      		        url: "cart/serviceremove.jsp",
      		        data: {
      		        	service_id : serviceid,
      		        	vehicleNumber : vehicleNumber
      		        },
      		        cache: false,
      		      success: function(response)
      	        {
      	            $("#addedServices").html(response);
      	        }
      		    }); 
      		}
      	</script> 
      	<table class="table table-responsive table-hover">

      	<tr>
	        <th>Service Name</th>
	  	        <th>Service Price</th>
	        <th>Remove</th>        
	      </tr>
      	<%
      	while(itr.hasNext())
      	{
      		AppService js1 = itr.next();
        %>        
        	
         <tr>         	
         	<td data-toggle="tooltip" data-placement="bottom" title="<%= js1.getServiceDetails() %>" >  <%= js1.getServiceName() %></td>
         	<td><%= js1.getServicePrice() %></td>
         	<td><a href="javascript:void(0)" onclick=" removeService('<%= js1.getServiceId() %>','<%= vehicleNumber %>')">Remove</a></td>
         </tr>    
        <%
      	}
      	%>
      	</table>
      	<%
    

}
%>

 