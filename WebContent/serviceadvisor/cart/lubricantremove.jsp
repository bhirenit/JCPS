<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.*"%>
<%@page import="java.sql.*" %>

<%
if(request.getParameter("lubricant_id")!=null) 
{    
	int lubricant_id = Integer.parseInt(request.getParameter("lubricant_id"));
	int jobcardNumber = Integer.parseInt(request.getParameter("jobcardNumber"));
	int status = JcLubricantDao.deleteById(jobcardNumber, lubricant_id);
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
  		        	jobcardNumber :jobcardNumber
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
  		JcLubricant jlu = itr.next();
    %>        
    	
     <tr>
     	<td><%= jlu.getLubricantName() %></td>
     	<td><%= jlu.getLubricantPrice() %></td>
     	<td><a href="javascript:void(0)" onclick="removeLubricant('<%= jlu.getLubricantId() %>','<%= jobcardNumber %>')">Remove</a></td>
     </tr>    
    <%
  	}
  	%>
  	</table>
  	<%
}
%>