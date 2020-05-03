<%@page import="modal.HistoryPaymentDao"%>
<%@page import="modal.ReportObj"%>
<%@page import="modal.HistoryDao"%>
<%@page import="modal.History"%>
<%@page import="java.util.Iterator"%>
<%@page import="modal.JobcardInfo"%>
<%@page import="java.util.List"%>
<%@page import="modal.JobcardInfoDao"%>
<%@page import="modal.VehicleCompanyDao"%>
<%@page import="modal.VehicleInfoDao"%>
<%@page import="modal.CustomerInfoDao"%>
<%@page import="modal.CustomerInfo"%>
<%@include file="../header.html" %>
<%
  if( ! ((String)session.getAttribute("officer_role")).equals("receptionist")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
<header>
        <div class="w3-sidebar w3-bar-block w3-card w3-animate-left" style="display:none" id="mySidebar">
            <button class="w3-bar-item w3-button w3-large"
            onclick="w3_close()">Close &times;</button>
            <a href="#" class="w3-bar-item w3-button">Link 1</a>
            <a href="#" class="w3-bar-item w3-button">Link 2</a>
            <a href="#" class="w3-bar-item w3-button">Link 3</a>
        </div>
    </header>
    <!-- Page Content -->
    <main id="main">

        <div class="my-new-header">
            <button id="openNav" class="w3-button w3-xlarge my-hamburger-btn" onclick="w3_open()">&#9776;</button>
            <span>JCMS</span>
        </div>

        <!-- breadcrumbs at top of the page -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="receptionistDashboard.jsp">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Newly Added Cars</li>
            </ol>
        </nav>               
        
        <div class="container-95">
        	 <div class="row">
	        	<select id="reporttype" onchange="showReport()">
	        		<option>Customer Type</option>
	        		<option>Fuel Type</option>
	        		<option>Vehicle Type</option>
	        		<option>Workload on Service Advisor</option>
	        	</select>
	        </div> 
        	<div class="row">
	        	<%= CustomerInfoDao.getCountOfCustomerType("corporate") %>
	        </div>
	        <div class="row">
	        	<%= VehicleInfoDao.getCountOfVehicleType("taxi") %>
	        </div>
	        <div class="row">
	        	<%= VehicleInfoDao.getCountOfFuelType("diesel") %>
	        </div>
	        <div class="row">
	        	<% List<JobcardInfo> list = JobcardInfoDao.getCountOfWorkloadOfSA();
						Iterator<JobcardInfo> itr = list.iterator();
						while (itr.hasNext())
						{
							JobcardInfo jci =  itr.next();
							String officer_username = jci.getOfficeUsername();
							int workload = jci.getAvailableFuel();						
                            
                            %>
                            <%= officer_username   %>
                            <%= workload %>
                            
                           <% } %>
	        </div>
	        <div class="row">
	        	<% List<CustomerInfo> list1 = CustomerInfoDao.getCountOfRegistrationByMonth("2019");
						Iterator<CustomerInfo> itr1 = list1.iterator();
						while (itr1.hasNext())
						{
							CustomerInfo ci =  itr1.next();
							int month = ci.getPincode();
							int count = ci.getCustomerId();
                            
                            %>
                           	<%= month %>
                           : <%= count %>
                            <br>
                           <% } %>
	        </div>
	        <div class="row">
	        		<% List<CustomerInfo> list2 = CustomerInfoDao.getCountOfRegistrationByDate("2019-01-01", "2019-01-31");
						Iterator<CustomerInfo> itr2 = list2.iterator();
						while (itr2.hasNext())
						{
							CustomerInfo ci =  itr2.next();
							int month = ci.getPincode();
							int count = ci.getCustomerId();
                            
                            %>
                           	<%= month %>
                           : <%= count %>
                            <br>
                           <% } %>
	        </div>
	         <div class="row">
	        	<% List<JobcardInfo> list3 = JobcardInfoDao.getAllByDate("2019-01-01", "2019-04-01");
						Iterator<JobcardInfo> itr3 = list3.iterator();
						while (itr3.hasNext())
						{
							JobcardInfo jci =  itr3.next();
							String officer_username = jci.getOfficeUsername();
							int jcno = jci.getJobcardNumber();
							
                            %>
                            <%= officer_username   %>:
                            <%= jcno %>
                            <br>
                           <% } %>
	        </div>
	        
	        <div class="row">
	        sa report
	      
	        <%= JobcardInfoDao.getTotal("b_hiren", "arrived") 
	        %>
	         <%= JobcardInfoDao.getTotal("b_hiren", "repaired") 
	        %>
	         <%= JobcardInfoDao.getTotal("b_hiren", "pending") 
	        %>
	        	       	   
	        
	        
	        </div>
	        
	        <div class="row">
	        	<% List<History> list4 = HistoryDao.getCountOfCompanyByDate("2019-03-20", "2019-03-30", "b_hiren");
						Iterator<History> itr4 = list4.iterator();
						while (itr4.hasNext())
						{
							History h =  itr4.next();
							String company = h.getHistoryId();
							int count = h.getRunningKM();
							
                            %>
                            <%= company   %>:
                            <%= count %>
                            <br>
                           <% } %>
	        </div>
	         <div class="row">
	        	<% List<History> list5 = HistoryDao.getCountOfCompanyNameBySA("c_gunjan");
						Iterator<History> itr5 = list5.iterator();
						while (itr5.hasNext())
						{
							History h =  itr5.next();
							String company = h.getHistoryId();
							int count = h.getRunningKM();							
                            %>
                            <%= company   %>:
                            <%= count %>
                            <br>
                           <% } %>
	        </div>
	          <div class="row">
	        	<% List<ReportObj> list6 = HistoryPaymentDao.getRevenueByMonthAndSa("2019", "b_hiren");
						Iterator<ReportObj> itr6 = list6.iterator();
						while (itr6.hasNext())
						{
							ReportObj hp =  itr6.next();
							int month = hp.getP1();
							int revenue = hp.getP2();
                            %>
                           <%= month  %>
                           <%= revenue %>                           
                            <br>
                           <% } %>
	        </div>
	        
	        <div class="row">
	        	<% List<ReportObj> list7 = JobcardInfoDao.getCountOfJobStatusByUsername("b_hiren");
						Iterator<ReportObj> itr7 = list7.iterator();
						while (itr.hasNext())
						{
							ReportObj jci =  itr7.next();
							int ppc = jci.getP1();
							int cpc = jci.getP2();
							int psc = jci.getS1();
							int csc = jci.getS2();
							int plc = jci.getL1();
							int clc = jci.getL2();						
                            
                            %>
                            <%= ppc %>
                            <%= cpc %>
                            <%= psc %>
                            <%= csc %>
                            <%= plc %>
                            <%= clc %>                                                       
                            
                           <% } %>
	        </div>
	        
        </div>
     </main>

<%@include file="../footer.html" %>