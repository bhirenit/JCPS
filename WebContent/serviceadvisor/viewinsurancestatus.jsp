<%@include file="../header.html"%>

<%@page import="modal.JcLubricantDao"%>
<%@page import="modal.JcLubricant"%>
<%@page import="modal.JcService"%>
<%@page import="modal.JcServiceDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JcPartDao"%>
<%@page import="modal.JcPart"%>
<%@page import="java.util.List"%>

<%@include file="saSidebar.jsp" %>
    <main id="main">
         <%@include file="../navbar.jsp" %>
        <div class="row mt-3">
        	<div class="col-md"></div>
        	<div class="col-md-2">
        		<button onclick="pendingClicked()" class="btn my-btn btn-md" style="color:white;">Approved</button>
        	</div>
        	<div class="col-md-2">
        		<button onclick="completedClicked()" class="btn my-btn btn-md" style="color:white;">Rejected</button>
        	</div>
        	<div class="col-md"></div>
        </div>
        	<div  id="pendingContent" class="container-95">
              <div class="row">  
              		<div class="col-md-4"></div>        		
        			<div class="col-md-4">
        			<h5>parts approved by Insurance inspector</h5>
                        <% int jobcardNumber = Integer.parseInt(request.getParameter("id")); %>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>Parts</th>
                            </tr>
                            <%
                            	List<JcPart> partList = JcPartDao.getByNumber(jobcardNumber, "approved"); 
                            	Iterator<JcPart> itr = partList.iterator();
                            	while(itr.hasNext())
                            	{
                            		JcPart jcp = itr.next();
                            %>
                            <tr>
                                <td>
                                   
                                    <label for="part<%=jcp.getPartId()%>" class="checklist-label"><%=jcp.getPartName() %></label>
                                </td>
                            </tr>
                           <% } %>
                          
                        </table>
                    </div> 
                    <div class="col-md-4"></div>                   
                 </div>
             </div>
             <div id="completedContent" class="container-95">
                 <div class="row">
                 	<div class="col-md-4"></div>          		
        			<div class="col-md-4">
        			<h5>parts not approved by insurance inspector</h5>                        
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th>Parts</th>
                            </tr>
                            <%
                            	List<JcPart> partList1 = JcPartDao.getByNumber(jobcardNumber, "pending"); 
                            	Iterator<JcPart> itr3 = partList1.iterator();
                            	while(itr3.hasNext())
                            	{
                            		JcPart jcp = itr3.next();
                            %>
                            <tr>
                                <td>
                                     
                                    <label for="part<%=jcp.getPartId()%>" class="checklist-label"><%=jcp.getPartName() %></label>
                                </td>
                            </tr>
                           <% } %>
                          
                        </table>
                    </div>                    
                    <div class="col-md-4"></div>
                 </div>                 
                 
             </div>
             <div class="row">
                 <div class="col-md"></div>
                 <div class="col-md-2">
                     <a href="insurancelist.jsp" class="btn btn-secondary btn-md">Back</a>
                 </div>
                 <div class="col-md"></div>
              </div>      
    </main>
    
    <script>
    	var pc = document.getElementById("pendingContent");
    	var cc = document.getElementById("completedContent");
    	pc.style.display = "block";
    	cc.style.display = "none";
    	function pendingClicked() {
    		pc.style.display = "block";
    		cc.style.display = "none";
    	}
    	function completedClicked() {
    		pc.style.display = "none";
    		cc.style.display = "block";
    	}
    </script>

<%@include file="../footer.html"%>