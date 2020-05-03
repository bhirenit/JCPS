<%@page import="modal.JcLubricantDao"%>
<%@page import="modal.JcLubricant"%>
<%@page import="modal.JcService"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JcPartDao"%>
<%@page import="modal.JcPart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ include file="../header.html" %>

    <title>Hello, world!</title>
      <%
    int jobcardNumber = Integer.parseInt(request.getParameter("id"));
    %>
</head>
<body>	  
  <%@include file="fincSidebar.jsp" %>
    <!-- Page Content -->
    <div>

        <%@include file="../navbar.jsp" %>

			<!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="fincDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="pendinglist.jsp">Pending Cars</a></li>
                <li class="breadcrumb-item active" aria-current="page">Jobs Done </li>
            </ol>
        </nav>    


        <div class="my-form">
            <div class="my-form-heading">
                <h5>Jobs to be done</h5>
            </div>
        </div>
    
        <div class="container-95">
            <form action="../UpdateStatus" method="post">
                <div class="row">
                    <div class="col-md-4">
                        <h5>parts remaining</h5>
                        <input type="hidden" name="jobcardnumber" value='<%=jobcardNumber %>' />
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>Parts</th>
                            </tr>
                            <%
                            	List<JcPart> partList = JcPartDao.getByNumber(jobcardNumber, "pending"); 
                            	Iterator<JcPart> itr = partList.iterator();
                            	while(itr.hasNext())
                            	{
                            		JcPart jcp = itr.next();
                            %>
                            <tr>
                                <td>
                                    <input type="checkbox" id="part<%=jcp.getPartId()%>" name='parts' value='<%=jcp.getPartId()%>' >    
                                    <label for="part<%=jcp.getPartId()%>" class="checklist-label"><%=jcp.getPartName() %></label>
                                </td>
                            </tr>
                           <% } %>
                          
                        </table>
                    </div>
                    <div class="col-md-4">
                        <h5>Services remaining</h5>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>Services</th>
                            </tr>
                            <%
                            	List<JcService> serviceList = JcServiceDao.getByNumber(jobcardNumber, "pending"); 
                            	Iterator<JcService> itr1 = serviceList.iterator();
                            	while(itr1.hasNext())
                            	{
                            		JcService jcs = itr1.next();
                            %>
                            <!-- Loop for services -->
                            <tr>
                                <td>
                                    <input type="checkbox" id="service<%=jcs.getServiceId()%>" name="services" value='<%=jcs.getServiceId()%>'>     
                                    <label for="service<%=jcs.getServiceId()%>" class="checklist-label"><%= jcs.getServiceName() %></label>
                                </td>
                            </tr>
                            <% }
                            %>
                        </table>
                    </div>
                    <div class="col-md-4">
                        <h5>Lubricants remaining</h5>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>Lubricants</th>
                            </tr>
                             <%
                            	List<JcLubricant> lubricantList = JcLubricantDao.getByNumber(jobcardNumber, "pending"); 
                            	Iterator<JcLubricant> itr2 = lubricantList.iterator();
                            	while(itr2.hasNext())
                            	{
                            		JcLubricant jcl = itr2.next();
                            %>
                            <!-- Loop for Lubricants -->
                            <tr>
                                <td>
                                    <input type="checkbox" id="lubricant<%=jcl.getLubricantId()%>" name="lubricants" value='<%=jcl.getLubricantId()%>'>    
                                    <label for="lubricant<%=jcl.getLubricantId()%>" class="checklist-label"><%=jcl.getLubricantName() %></label>
                                </td>
                            </tr>
                               <% }
                            %>
                           </table>
                    </div>
                </div>
                <div class="my-submit-div">
                    <center>
                        <input type="submit" name="submit" id="submit" class="btn btn-secondary btn-md" value="Save Changes">
                    </center>                    
                </div>
            </form>
        </div>
    </main>
    
    <%@include file="../footer.html"%>