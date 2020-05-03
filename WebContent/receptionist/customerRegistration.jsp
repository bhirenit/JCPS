<%@ include file="../header.html" %>
<title>Customer Registration</title>
<%@page import="java.util.Iterator"%>
<%@page import="modal.VehicleCompany"%>
<%@page import="java.util.List"%>
<%@page import="modal.VehicleCompanyDao"%>
 <%
  if( ! ((String)session.getAttribute("officer_role")).equals("receptionist")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
<script type="text/javascript">
function company_change()
{
    var company_id = $("#vehicle_company").val();
 
    $.ajax({
        type: "POST",
        url: "model.jsp",
        data: "company_id="+company_id,
        cache: false,
        success: function(response)
        {
            $("#company_model").html(response);
        }
    });
}
function model_change()
{
    var model_id = $("#company_model").val();
 
    $.ajax({
        type: "POST",
        url: "varient.jsp",
        data: "vehicle_model_id="+model_id,
        cache: false,
        success: function(response)
        {
            $("#model_varient").html(response);
        }
    });
}
</script>
  <body>
  
   <%@include file="receptionistSidebar.html" %>

    <main>
    	 <%@include file="../navbar.jsp" %>
        
        <form action="../SaveCustomer" method="post" class="my-form container-95">
            <div class="my-form-heading">
                <h5>Customer Registration</h5>
            </div>
            <div class="container-95">                
                <div class="row my-form-row">
                    <h6>Customer Details</h6>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_name">Name</label>                                    
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_name" id="customer_name" required>
                            </div>
                        </div>
                    </div>                    
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_email">Email</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_email" id="customer_email" pattern="[a-z0-9_.]{2,30}[@][a-z]{2,15}[.]{1}[a-z.]{2,15}" required>
                            </div>
                        </div>                        
                    </div>                    
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_contact">Contact No.</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_contact" id="customer_contact" maxlength="10" minlength="10" required>
                            </div>
                        </div>                                            
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_type">Customer Type</label>
                            </div>
                            <div class="col-md-8">
                                <select name="customer_type" id="customer_type" required>
                                    <option value="individual">Individual</option>
                                    <option value="corporate">Corporate</option>
                                </select>
                            </div>
                        </div>                                                
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_aadhaar">Aadhaar Number</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_aadhaar" id="customer_aadhaar" maxlength="12" minlength="12" required>
                            </div>
                        </div>                                                
                    </div>                    
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_license">License Number</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_license" id="customer_license" maxlength="20" minlength="5" placeholder="GJ1820170000231" required>
                            </div>
                        </div>                                                
                    </div>                                                                    
                </div>
                <div class="row my-form-row">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="Address">Address</label>
                            </div>
                            <div class="col-md-8">
                                <textarea name="customer_address" id="customer_address" cols="18" rows="2" required></textarea>
                            </div>
                        </div>                                                
                    </div> 
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_city">City</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_city" id="customer_city" required>
                            </div>
                        </div>                                                
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_state">State</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_state" id="customer_state" required>
                            </div>
                        </div>                                                
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="pincode">Pincode</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="pincode" id="pincode" maxlength="6" minlength="6" required>
                            </div>
                        </div>                                                
                    </div>                                                     
                </div>
                <div class="row my-form-row">
                    <h6>Customer's Vehicle Details</h6>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="vehicle_number">Vehicle No.</label>
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="vehicle_number" id="vehicle_number" readonly value=<%=session.getAttribute("vehicle_number") %>>
                            </div>
                        </div>                                                
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="vin_no">VIN</label>                                
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="vin_number" id="vin_number" maxlength="17" minlength="10" placeholder="1HBh41jxMN109628" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="engine_no">Engine No.</label>                                
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="engine_number" id="engine_number" maxlength="6" minlength="6" placeholder="109628" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="fuel_type">Fuel Type</label>                                
                            </div>
                            <div class="col-md-8">
                                <select name="fuel_type" id="fuel_type" required>
                                    <option value="petrol">Petrol</option>
                                    <option value="diesel">Diesel</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="interior_color">Interior color</label>                                
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="interior_color" id="interior_color" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="exterior_color">Exterior Color</label>                                
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="exterior_color" id="exterior_color" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="customer_rc">RC Number</label>                                
                            </div>
                            <div class="col-md-8">
                                <input type="text" name="customer_rc" id="customer_rc" maxlength="10" minlength="10" placeholder="MH88ZE7876" required>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="vehicle_type">Vehicle Type</label>                                
                            </div>
                            <div class="col-md-8">
                                <select name="vehicle_type" id="vehicle_type" required>
                                    <option value="passenger">Passenger</option>
                                    <option value="taxi">Taxi</option>
                                </select>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="row my-form-row">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-4">
                                <label for="vehicle_company">Company</label>                                
                            </div>
                            <div class="col-md-8">
                                <select name="vehicle_company" id="vehicle_company" onchange="company_change()" required>
                                <option selected>--</option>
                                 <%List<VehicleCompany> list= VehicleCompanyDao.getCompanies();
					                                    Iterator itr=list.iterator();  
					                                    while(itr.hasNext()){ 
					                                    	VehicleCompany v = (VehicleCompany)itr.next();
					                                     out.println("<option value='"+v.getVehicleCompanyId()+"'>"+v.getVehicleCompanyName()+"</option>");  
					                                    }
					                                    	%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md">
                                <label for="vehicle_model">Model</label>                                
                            </div>
                            <div class="col-md">
                                <select name="company_model" id="company_model" onchange="model_change()" required>
                                 <option selected>--</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md">
                                <label for="model_varient">Varient</label>                                
                            </div>
                            <div class="col-md">
                                <select name="model_varient" id="model_varient" required>
                                 <option selected>--</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="my-submit-div">
                    <center>
                    	<input type="submit" name="submit" id="submit" class="btn btn-secondary btn-sm">
                    </center>
                </div>
            </div>                                   
        </form>
    </main>

<%@ include file="../footer.html" %>