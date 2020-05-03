<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.*"%>
<%@page import="java.sql.*" %>

<%
if(request.getParameter("lubricant_id")!=null) 
{    
	int lubricant_id = Integer.parseInt(request.getParameter("lubricant_id"));
	String vehicleNumber = request.getParameter("vehicleNumber");
	int status = AppLubricantDao.deleteById(vehicleNumber, lubricant_id);
	List<AppLubricant> list = AppLubricantDao.getByNumber(vehicleNumber);
  	Iterator<AppLubricant> itr = list.iterator();
  	%>
  	<script>
  		function removeLubricant(lubricantid,jobcardNumber) {
  			 $.ajax({
  	        type: "POST",
  		        url: "cart/lubricantremove.jsp",
  		        data: {
  		        	lubricant_id : lubricantid,
  		        	vehicleNumber :vehicleNumber
  		        },
  		        cache: false,
  		        success: function(response)
  	       		{
  	           		 $("#addedLubricants").html(response);
  	       		}
  		    }); 
  		}
  	</script>
  	<table class="table table-responsive table-hover">

  	<tr>
        <th>lubricant Name</th>
        <th>lubricant Price</th>
        <th>Remove</th>        
      </tr>
  	<%
  	while(itr.hasNext())
  	{
  		AppLubricant jlu = itr.next();
    %>        
    	
     <tr>
     	<td><%= jlu.getLubricantName() %></td>
     	<td><%= jlu.getLubricantPrice() %></td>
     	<td><a href="javascript:void(0)" onclick="removeLubricant('<%= jlu.getLubricantId() %>','<%= vehicleNumber %>')">Remove</a></td>
     </tr>    
    <%
  	}
  	%>
  	</table>
  	<%
}
%>