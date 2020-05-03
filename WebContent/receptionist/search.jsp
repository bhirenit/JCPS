<%@ include file="../header.html" %>
<title>Search</title>
<%@include file="receptionistSidebar.html" %>
<body background="../public/image/carnumberplate.jpg">
  <div class="overlay"> 
    <main id="main">
         <%@include file="../navbar.jsp" %>

		
        <div class="container-95">
        	
        		<div class="col-md-6">
        			<form action="../CheckVehicle" class="my-form" method="post" style="margin-top: 30%;">
			            <div class="my-form-heading">
			                <h5>Enter Vehicle Number</h5>
			            </div>
			            <div class="container-95">
								<div class="my-form-row">
								<h6><font>About Vehicle</font></h6>
								<div class="col-md"></div>
								<div class="col-md-6">
								
									<label for="">Vehicle Number :</label>
									<input type="text" name="vehicle_number" id="vehicle_number" class="" onkeyup="toUppercase()" pattern="[A-Z]{2}[0-9]{1,2}[A-Z]{1,2}[0-9]{1,4}" >
									
								</div>
								<div class="col-md"></div>
							</div>
							<div class="my-submit-div">
								<input type="submit" name="submit" id="submit" class="btn btn-secondary btn-sm" value="Search">
							</div>
						</div>            
			        </form>
        		</div>
        	</div>
        </div>
    </main>
    <script type="text/javascript">
    	function toUppercase() {
    		var str = document.getElementById('vehicle_number').value;
    		document.getElementById('vehicle_number').value = str.toUpperCase();
    	}
    </script>
     </div>
    </body>
  
<%@ include file="../footer.html" %>