
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
	int jobcardNumber =Integer.parseInt(request.getParameter("jobcardNumber"));
	if(request.getParameter("reload_flag").equals("0")) {
    int id=Integer.parseInt(request.getParameter("lubricant_id")); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
        
    	VehicleLubricantDetails  vld  = VehicleLubricantDetailsDao.getLubricantsById(id);
    	JcLubricant jl = new JcLubricant();
    	jl.setLubricantId(id);
    	jl.setLubricantName(vld.getLubricantName());
    	jl.setLubricantPrice(vld.getLubricantPrice());
    	jl.setLubricantStatus("pending");
    	jl.setJobcardNumber(jobcardNumber);
  
        int status = JcLubricantDao.save(jl);    
    }
        List<JcLubricant> list = JcLubricantDao.getByNumber(jobcardNumber, "pending");
      	Iterator<JcLubricant> itr = list.iterator();
      	%>
   	<script>
      		function removeLubricant(lubricantid,jobcardNumber) {
      			 $.ajax({
      		        type: "POST",
      		        url: "cart/lubricantremove.jsp",
      		        data: {
      		        	lubricant_id : lubricantid,
      		        	jobcardNumber : jobcardNumber
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
      		JcLubricant jlu = itr.next();
        %>        
        	
         <tr>
         	<td><%= jlu.getLubricantName() %></td>
         	<td><%= jlu.getLubricantPrice() %></td>
         	<td><a href="javascript:void(0)" onclick=" removeLubricant('<%= jlu.getLubricantId() %>','<%= jobcardNumber %>')">Remove</a></td>
         </tr>    
        <%
      	}
      	%>
      	</table>
      	<%
    

}
%>

 