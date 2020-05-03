<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.CustomerComplain"%>
<%@page import="modal.CustomerComplainDao"%>
<%@page import="modal.ConnectionDb"%>

<%
	int complainId =Integer.parseInt(request.getParameter("complain_id"));
	int jobcardNumber; 
	jobcardNumber=Integer.parseInt(request.getParameter("jobcard_number"));
	CustomerComplainDao.deleteById(complainId);
	List<CustomerComplain> list = CustomerComplainDao.getAll(jobcardNumber);
	Iterator<CustomerComplain> itr = list.iterator();
	
	%>
	<table class="table table-hover">
                                    <tr>
                                        <th>Complains</th>
                                        <th></th>
                                    </tr>
	<% 
	while(itr.hasNext())
	{
		CustomerComplain cc = itr.next();
		%>
		<form action="/for-remove-complain-using-id" id="complain_id">
                                        <tr>
                                            <td><%= cc.getCustomerComplain() %></td>
                                            <td><button type="button" class="btn btn-danger btn-sm" form="complain_id" onclick="removeComplain('<%=cc.getComplainId()%>',<%=jobcardNumber%>)">Remove</button></td>
                                        </tr>
                                    </form>
	
<%
	}
%>
</table>

 