<%@page import="modal.CustomerInfo"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.VehicleInfo"%>
<%@page import="modal.HistoryDao"%>
<%@page import="modal.History"%>
<%@page import="modal.VehicleModelDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.JobcardInfoDao"%>
<%@include file="../header.html" %>
<title>History View</title> 
<body>  

  
  <%@include file="receptionistSidebar.html" %>

  <main id="main">
   <%@include file="../navbar.jsp" %>
   
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="receptionistDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">PassHistoy Cars list</li>
            </ol>
        </nav>    
        
        <% String vehicleNumber = (String)session.getAttribute("vehicle_number"); %>
        <!-- dashboard -->
        <div class="my-dashboard">
            <div class="my-dashboard-header">
                <center>
                    <h4> <%= vehicleNumber %></h4>
                </center>
            </div>
        </div>
		<div class="container mt-5">
	   		<table id="data-table-simple-1" class="table">
			   	<thead style="text-align: center; font-size: 14px;">
			   		<tr>
			   			<th>Customer Name</th>
			   			<th>Date</th>
			   			<th>Service Advisor Name</th>
			   			<th>Running KM</th>
			   			<th>Car Name</th>
			   			<th>Service Type </th>	
			   			<th>Action</th>
			   		</tr>
			   	</thead>
			   	<tbody style="font-size: 12px; text-align: center;">
			   		 <% List<History> list = HistoryDao.getByNumber(vehicleNumber);
						Iterator<History> itr = list.iterator();
						while (itr.hasNext())
						{
							History h =  itr.next();
							VehicleInfo vi = VehicleInfoDao.getAllByNumber(vehicleNumber);
							CustomerInfo ci =CustomerInfoDao.getAllByNumber(vehicleNumber);
							OfficerInfo oi = OfficerInfoDao.getByUsername(h.getOfficerUsername());
							int vehicle_model_id = VehicleInfoDao.getModelByNumber(vehicleNumber);
							String company_model = VehicleModelDao.getModelName(vehicle_model_id);
							String link="pasthistoryview.jsp?id="+vehicleNumber;
							%>
							<tr>
                            <td><%= ci.getCustomerName() %></td>
                            <td><%=h.getDeliveryDate()%></td>
                            <td><%=oi.getOfficerName()%></td>
                            <td><%=h.getRunningKM()%></td>
                            <td><%= company_model %>
                            <td><%=h.getWorkType()%></td>
                            <td><a href=<%= link %>>View</a></td>
                            </tr>	 

						<%	 
						} 
					%>
			   	</tbody>
	   		</table>
		</div>

		<div class="w3-container" style="margin-left: 400px; margin-top: 100px;">
		  <a href='customerverification.jsp' class="w3-button w3-xlarge w3-circle w3-black" style="text-decoration: none;">+</a>Add New JobCard
		</div>
    </div>
    <main>
        <!-- <form class="form-inline">
            <label class="" for="inlineFormInputName2">Name</label>
            <input type="text" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Jane Doe">                                                            
            
            <button type="submit" class="btn btn-primary mb-2">Submit</button>
        </form> -->
        
    </main>

 


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