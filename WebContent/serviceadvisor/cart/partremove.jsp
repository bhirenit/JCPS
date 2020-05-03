<%@page import="modal.JcPartDao"%>
<%@page import="modal.JcPart"%>
<%@page import="modal.VehiclePartDetails"%>
<%@page import="modal.VehiclePartDetailsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.VehicleServiceDetails"%>
<%@page import="modal.VehicleServiceDetailsDao"%>
<%@page import="java.sql.*" %>

<%
if(request.getParameter("part_id")!=null) 
{    
	int jobcardNumber =Integer.parseInt(request.getParameter("jobcardNumber"));
	int part_id = Integer.parseInt(request.getParameter("part_id"));
	if(request.getParameter("remove_flag").equals("1"))
	{
		int st = JcPartDao.deleteById(jobcardNumber, part_id);
	}
	else
	{
	int status = JcPartDao.decreaseQuantity(jobcardNumber, part_id);
	}
	List<JcPart> list = JcPartDao.getByNumber(jobcardNumber, "pending");
  	Iterator<JcPart> itr = list.iterator();
  	%>
  <!-- 	<script>
  		function removePart(partid) {
  			 $.ajax({
  		        type: "POST",
  		        url: "cart/partremove.jsp",
  		        data: {
  		        	part_id : partid
  		        },
  		        cache: false,
  		        success: function(response)
  	       		{
  	           		 $("#addedParts").html(response);
  	       		}
  		    }); 
  		}
  	</script> --><!-- do not need to declare method again  -->
  	<table class="table table-responsive z-depth-3">
  	<tr>
        <th>Part Name</th>
        <th>Part Price</th>
        <th>Quantity</th>
        <th>Remove</th>        
      </tr>
  	<%
  	while(itr.hasNext())
  	{
  		JcPart jp1 = itr.next();
    %>        
    	
     <tr>
         	<td><%= jp1.getPartName() %></td>
         	<td><%= jp1.getPartPrice() %></td>
         	<td ><a href="javascript:void(0)" onclick=" removePart('<%= jp1.getPartId() %>','<%= jobcardNumber %>')">-</a> <%= jp1.getPartQuantity() %>
         	 <a href="javascript:void(0)" onclick="increase('<%= jp1.getPartId() %>', '<%= jobcardNumber %>')">+</a></td>
         	<td><a href="javascript:void(0)" onclick=" removeAll('<%= jp1.getPartId() %>','<%= jobcardNumber %>')">Remove</a></td>
         </tr>    
    <%
  	}
  	%>
  	</table>
  	<%
}
%>