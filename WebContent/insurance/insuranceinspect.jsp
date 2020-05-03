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
            <form action="../UpdateInsuranceStatus" method="post">
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