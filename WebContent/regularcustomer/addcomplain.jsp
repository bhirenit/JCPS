<%@page import="modal.AppCustomerComplainDao"%>
<%@page import="modal.AppCustomerComplain"%>
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
	String customerComplain = request.getParameter("complain");
	String vehicleNumber; 
	if(!customerComplain.equals(""))
	{
		vehicleNumber=request.getParameter("vehicleNumber");
	AppCustomerComplain cc = new AppCustomerComplain();
	cc.setCustomerComplain(customerComplain);
	cc.setVehicleNumber(vehicleNumber);
	AppCustomerComplainDao.save(cc);
	}
	else{
		vehicleNumber =request.getParameter("vehicleNumber");;
	}
	List<AppCustomerComplain> list = AppCustomerComplainDao.getAll(vehicleNumber);
	Iterator<AppCustomerComplain> itr = list.iterator();
	%>
	<table id="data-table-simple-1" class="table table-striped">
                                    <tr>
                                        <th>Complains</th>
                                        <th>Remove</th>
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

 