<%@page import="modal.AppServiceDao"%>
<%@page import="modal.AppService"%>
<%@page import="modal.JcService"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.*" %>

<%
if(request.getParameter("service_id")!=null) 
{    
	int service_id = Integer.parseInt(request.getParameter("service_id"));
	String vehicleNumber =request.getParameter("vehicleNumber");
	int status = AppServiceDao.deleteById(vehicleNumber, service_id);
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
  		        	vehicleNumber :vehicleNumber
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
     	<td><%= js1.getServiceName() %></td>
     	
     	<td><%= js1.getServicePrice() %></td>
     	<td><a href="javascript:void(0)" onclick="removeService('<%= js1.getServiceId() %>','<%= vehicleNumber %>')">Remove</a></td>
     </tr>    
    <%
  	}
  	%>
  	</table>
  	<%
}
%>