<%@page import="modal.AppCustomerComplain"%>
<%@page import="modal.AppCustomerComplainDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.CustomerComplain"%>
<%@page import="modal.CustomerComplainDao"%>
<%@page import="modal.ConnectionDb"%>
 <%
  if( ! ((String)session.getAttribute("officer_role")).equals("customer")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
<%
	int complainId =Integer.parseInt(request.getParameter("complain_id"));
	String vehicleNumber; 
	vehicleNumber=request.getParameter("vehicleNumber");
	CustomerComplainDao.deleteById(complainId);
	List<AppCustomerComplain> list = AppCustomerComplainDao.getAll(vehicleNumber);
	Iterator<AppCustomerComplain> itr = list.iterator();
	
	%>
	<table class="table table-hover">
                                    <tr>
                                        <th>Complains</th>
                                        <th></th>
                                    </tr>
	<% 
	while(itr.hasNext())
	{
		AppCustomerComplain cc = itr.next();
		%>
		<form action="/for-remove-complain-using-id" id="complain_id">
                                        <tr>
                                            <td><%= cc.getCustomerComplain() %></td>
                                            <td><button type="button" class="btn btn-danger btn-sm" form="complain_id" onclick="removeComplain('<%=cc.getComplainId()%>',<%=vehicleNumber%>)">Remove</button></td>
                                        </tr>
                                    </form>
	
<%
	}
%>
</table>

 