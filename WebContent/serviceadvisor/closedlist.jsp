<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.HistoryDao"%>
<%@page import="modal.History"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="java.util.Date"%>
<%@page import="modal.CustomerInfo"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@include file="../header.html" %>
  <body>
    <% String officer_username = (String)session.getAttribute("officer_username");
    %>
    <!-- Sidebar -->
    <%@include file="saSidebar.jsp" %>
    <!-- Page Content -->
    <div>

        <%@include file="../navbar.jsp" %>

        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="saDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Closed Cars</li>
            </ol>
        </nav>    
        
        
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4>Closed Car list 
                    </h4>
                </center>
            </div>
           <div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center; font-size: 14px;">
			   		<tr>
			   			<th>Customer Name</th>
			   			<th>Vehicle Number</th>
			   			<th>Date</th>
			   			<th>Service Advisor Name</th>
			   			<th>Running KM</th>
			   			<th>Service Type </th>	
			   			<th>Action</th>
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		 <% 
			   		
			   		 List<History> list = HistoryDao.getByOfficerUsername(officer_username);
						Iterator<History> itr = list.iterator();
						while (itr.hasNext())
						{
							History h =  itr.next();
							String vehicleNumber=h.getVehicleNumber();
							VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicleNumber);
							String Customername= CustomerInfoDao.getNameByNumber(vehicleNumber);
							String username = h.getOfficerUsername();
							OfficerInfo oi = OfficerInfoDao.getByUsername(username);
									
							String link="closedview.jsp?id="+vehicleNumber;
							%>
							<tr>
                            <td><%= Customername %></td>
                            <td><%= vehicleNumber %>
                            <td><%=h.getDeliveryDate()%></td>
                            <td><%=oi.getOfficerName()%></td>
                            <td><%=h.getRunningKM()%></td>
                            
                            <td><%=h.getWorkType()%></td>
                           
                          
                            <td><a href=<%= link %>>View</a></td>
                            </tr>	 

						<%	 
						} 
					%>
			   	</tbody>
	   		</table>
		</div>

            <div class="my-dashboard-content mt-3">
                <div class="row">
                    <!-- Put the iterator over here, put this whole div in the loop and the cards will be set accordingly -->
                    <!-- LOOP Starts -->
                    
          
                </div>
            </div>
        </div>
    </div>
<footer class="my-footer">
        <div class="my-footer-copyright container-95">
            Copyright @ JCMS 2019
        </div>
    </footer>


    <!-- jslink.html -->
    <script>
        function w3_open() {
            // document.getElementById("main").style.marginLeft = "25%";
            document.getElementById("mySidebar").style.width = "25%";
            document.getElementById("mySidebar").style.display = "block";
            // document.getElementById("openNav").style.display = 'none';
        }
        function w3_close() {
            // document.getElementById("main").style.marginLeft = "0%";
            document.getElementById("mySidebar").style.display = "none";
            // document.getElementById("openNav").style.display = "inline-block";
        }
    </script>

    <script>
        var vsd = document.getElementById("verify-static-details");
        var ef = document.getElementById("edit-form");

        ef.style.display = "none";
        function editButtonClicked() {           

            vsd.style.display = "none";
            ef.style.display = "block";
        }
        function cancelButtonClicked() {
            vsd.style.display = "block";
            ef.style.display = "none";
        }
    </script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>    
 </body>
</html>