<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modal.CustomerComplain"%>
<%@page import="modal.CustomerComplainDao"%>
<%@page import="modal.ConnectionDb"%>

<% int jobcardNumber; 
if(request.getParameter("reload_flag").equals("0")){
	String customerComplain = request.getParameter("complain");
	
	if(customerComplain!=null)
	{
	jobcardNumber=Integer.parseInt(request.getParameter("jobcard_number"));
	CustomerComplain cc = new CustomerComplain();
	cc.setCustomerComplain(customerComplain);
	cc.setJobcardNumber(jobcardNumber);
	CustomerComplainDao.save(cc);
	}
	else{
		jobcardNumber =Integer.parseInt((String)session.getAttribute("jobcard_number"));
	}
}else
{
	jobcardNumber=Integer.parseInt(request.getParameter("jobcard_number"));
}
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

 