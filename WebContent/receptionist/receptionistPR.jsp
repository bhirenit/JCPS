<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.OfficerInfoDao"%>
<%@page import="modal.OfficerInfo"%>
<%@page import="java.util.List"%>
<%@ include file="../header.html" %>
<title>Report Dashboard</title>
 
  <body>
    
    <!-- Sidebar -->
    <%@include file="receptionistSidebar.html" %>

    <!-- Page Content -->
    <div style="margin-left:20%">

        <div class="w3-container dashboard-header">
          <h3>JCMS</h3>
        </div>
        
        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item" aria-current="page"><a href="receptionistPR.jsp">Report  Dashboard</a> / </li>
            </ol>
        </nav>    

        <div class="container-95">
        	<!-- dashboard -->
	        <div class="my-dashboard">
	            <div class="my-dashboard-header">
	                <center>
	                    <h4>Report Dashboard</h4>
	                </center>
	            </div>
	           
	           <div class="row">
	           		<div class="col-md"></div>
	           		<div class="col-md-3">
	           			<select id="PercentageReports">
	           				<option disabled selected>Select Report Type</option>
	           				<option value="ct">Customer Type</option>
	           				<option value="vt">Vehicle Type</option>
	           				<option value="ft">Fuel Type</option>
	           				<option value="wl">Service Advisor Work Load</option>           				
	           			</select>
	           		</div>
	           		<div class="col-md"></div>           		
	           </div>
	           
	           <div class="row" id="ctpr">
	           	
	           </div>
	           
	           <div class="row" id="vtpr">
	           		
	           </div>
	           
	           <div class="row" id="ftpr">
	           		
	           </div>
	           
	           <div class="row" id="wlpr">
	           		
	           </div>
	               
	        </div>
        </div>
		<script type="text/javascript">
			$("#ctpr").hide(); 
			$("#vtpr").hide();
			$("#ftpr").hide();
			$("#wlpr").hide();
			$("#PercentageReports").change(function() {				
				if($(this).val() === "ct") {
					$("#ctpr").show();
					$("#vtpr").hide();
					$("#ftpr").hide();
					$("#wlpr").hide();					
				} else if($(this).val() === "vt") {
					$("#ctpr").hide();
					$("#vtpr").show();
					$("#ftpr").hide();
					$("#wlpr").hide();					
				} else if($(this).val() === "ft") {
					$("#ctpr").hide();
					$("#vtpr").hide();
					$("#ftpr").show();
					$("#wlpr").hide();					
				} else if($(this).val() === "wl") {
					$("#ctpr").hide();
					$("#vtpr").hide();
					$("#ftpr").hide();
					$("#wlpr").show();					
				}
			});
		</script>
		<script type="text/javascript">
		// Load google charts
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		// Draw the chart and set the chart values
		function drawChart() {
		  var data = google.visualization.arrayToDataTable([
		  ['Task', 'Hours per Day'],
		  ['Corporate', <%= CustomerInfoDao.getCountOfCustomerType("corporate") %>],
		  ['Individual', <%= CustomerInfoDao.getCountOfCustomerType("individual") %>]
		]);
		
		  // Optional; add a title and set the width and height of the chart
		  var options = {'width':550, 'height':400}; //is3D : true try it
		
		  // Display the chart inside the <div> element with id="piechart"
		  var chart = new google.visualization.PieChart(document.getElementById('ctpr'));   
		  chart.draw(data, options);
		}
		</script>
		<script type="text/javascript">
		// Load google charts
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		// Draw the chart and set the chart values
		function drawChart() {
		  var data = google.visualization.arrayToDataTable([
		  ['Task', 'Hours per Day'],
		  ['Passenger', <%= VehicleInfoDao.getCountOfVehicleType("passenger")%>],
		  ['taxi', <%= VehicleInfoDao.getCountOfVehicleType("taxi") %>]
		]);
		
		  // Optional; add a title and set the width and height of the chart
		  var options = {'width':550, 'height':400}; //is3D : true try it
		
		  // Display the chart inside the <div> element with id="piechart"
		  var chart = new google.visualization.PieChart(document.getElementById('vtpr'));   
		  chart.draw(data, options);
		}
		</script>
		<script type="text/javascript">
		// Load google charts
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		// Draw the chart and set the chart values
		function drawChart() {
		  var data = google.visualization.arrayToDataTable([
		  ['Task', 'Hours per Day'],
		  ['Petrol', <%= VehicleInfoDao.getCountOfFuelType("petrol")%>],
		  ['Diesel', <%= VehicleInfoDao.getCountOfFuelType("diesel") %>]
		]);
		
		  // Optional; add a title and set the width and height of the chart
		  var options = {'width':550, 'height':400}; //is3D : true try it
		
		  // Display the chart inside the <div> element with id="piechart"
		  var chart = new google.visualization.PieChart(document.getElementById('ftpr'));   
		  chart.draw(data, options);
		}
		</script>
		<script type="text/javascript">
		// Load google charts
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		// Draw the chart and set the chart values
		function drawChart() {
		  var data = google.visualization.arrayToDataTable([
		  ['Task', 'Hours per Day']
		  <% List<JobcardInfo> list = JobcardInfoDao.getCountOfWorkloadOfSA();
			Iterator<JobcardInfo> itr = list.iterator();
			while (itr.hasNext())
			{
				JobcardInfo jci =  itr.next();
				String officer_username = jci.getOfficeUsername();
				int workload = jci.getAvailableFuel();						
              
              %>
		  ,['<%= officer_username %>', <%= workload %>] 
		  <% } %>
		]); 
		
		  // Optional; add a title and set the width and height of the chart
		  var options = {'width':800,'height':400, 'is3D': true}; //is3D : true try it
		
		  // Display the chart inside the <div> element with id="piechart"
		  var chart = new google.visualization.PieChart(document.getElementById('wlpr'));   
		  chart.draw(data, options);
		}
		</script>
    </div>
    <main>
        <!-- <form class="form-inline">
            <label class="" for="inlineFormInputName2">Name</label>
            <input type="text" class="form-control mb-2 mr-sm-2" id="inlineFormInputName2" placeholder="Jane Doe">                                                            
            
            <button type="submit" class="btn btn-primary mb-2">Submit</button>
        </form> -->
        
    </main>

<%@ include file="../footer.html" %>