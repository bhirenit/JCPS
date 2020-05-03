<%@page import="modal.JcService"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.*" %>

<%
if(request.getParameter("service_id")!=null) 
{    
	int service_id = Integer.parseInt(request.getParameter("service_id"));
	int jobcardNumber =Integer.parseInt(request.getParameter("jobcardNumber"));
	int status = JcServiceDao.deleteById(jobcardNumber, service_id);
	List<JcService> list = JcServiceDao.getByNumber(jobcardNumber, "pending");
  	Iterator<JcService> itr = list.iterator();
  	%>
  	<script>
  		function removeService(serviceid,jobcardNumber) {
  			 $.ajax({
  		        type: "POST",
  		        url: "cart/serviceremove.jsp",
  		        data: {
  		        	service_id : serviceid,
  		        	jobcardNumber :jobcardNumber
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
  		JcService js1 = itr.next();
    %>        
    	
     <tr>
     	<td><%= js1.getServiceName() %></td>
     	<td><%= js1.getServicePrice() %></td>
     	<td><a href="javascript:void(0)" onclick="removeService('<%= js1.getServiceId() %>','<%= jobcardNumber %>')">Remove</a></td>
     </tr>    
    <%
  	}
  	%>
  	</table>
  	<%
}
%>