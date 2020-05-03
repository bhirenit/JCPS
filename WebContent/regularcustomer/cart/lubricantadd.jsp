
<%@page import="modal.AppLubricantDao"%>
<%@page import="modal.AppLubricant"%>
<%@page import="modal.JcLubricantDao"%>
<%@page import="modal.JcLubricant"%>
<%@page import="javax.swing.JButton"%>
<%@page import="modal.VehicleLubricantDetailsDao"%>
<%@page import="modal.VehicleLubricantDetails"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%@page import="java.sql.*" %>

<%
if(request.getParameter("reload_flag")!=null) 
{
	String vehicleNumber =request.getParameter("vehicleNumber");
	if(request.getParameter("reload_flag").equals("0")) {
    int id=Integer.parseInt(request.getParameter("lubricant_id")); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
        
    	VehicleLubricantDetails  vld  = VehicleLubricantDetailsDao.getLubricantsById(id);
    	AppLubricant jl = new AppLubricant();
    	jl.setLubricantId(id);
    	jl.setLubricantName(vld.getLubricantName());
    	jl.setLubricantPrice(vld.getLubricantPrice());
    	jl.setVehicleNumber(vehicleNumber);
  
        int status = AppLubricantDao.save(jl);    
    }
        List<AppLubricant> list = AppLubricantDao.getByNumber(vehicleNumber);
      	Iterator<AppLubricant> itr = list.iterator();
      	%>
   	<script>
      		function removeLubricant(lubricantid,vehicleNumber) {
      			 $.ajax({
      		        type: "POST",
      		        url: "cart/lubricantremove.jsp",
      		        data: {
      		        	lubricant_id : lubricantid,
      		        	vehicleNumber : vehicleNumber
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
	        <th>Lubricant Name</th>
	        <th>Lubricant Price</th>
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
         	<td><a href="javascript:void(0)" onclick=" removeLubricant('<%= jlu.getLubricantId() %>','<%= vehicleNumber %>')">Remove</a></td>
         </tr>    
        <%
      	}
      	%>
      	</table>
      	<%
    

}
%>

 