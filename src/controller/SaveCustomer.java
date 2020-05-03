package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.CustomerInfo;
import modal.CustomerInfoDao;
import modal.OfficerInfo;
import modal.OfficerInfoDao;
import modal.VehicleInfo;
import modal.VehicleInfoDao;
import modal.VehicleModelDao;

@WebServlet("/SaveCustomer")
public class SaveCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveCustomer() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String customerName = request.getParameter("customer_name");
		String customerContact = request.getParameter("customer_contact");
		String customerEmail = request.getParameter("customer_email");
		String customerAddress = request.getParameter("customer_address");
		String customerCity = request.getParameter("customer_city");
		String customerState = request.getParameter("customer_state");
		int pincode = Integer.parseInt(request.getParameter("pincode"));
		String customerRc = request.getParameter("customer_rc");
		String customerAadhaar = request.getParameter("customer_aadhaar");
		String customerLicense = request.getParameter("customer_license");
		String customerType = request.getParameter("customer_type");

		String vehicleNumber = request.getParameter("vehicle_number");
		String vinNumber = request.getParameter("vin_number");
		int vehicleCompany = Integer.parseInt(request.getParameter("vehicle_company"));
		int companyModel = Integer.parseInt(request.getParameter("company_model"));
		int modelVarient = Integer.parseInt(request.getParameter("model_varient"));
		String engineNumber = request.getParameter("engine_number");
		String fuelType = request.getParameter("fuel_type");
		String vehicleType = request.getParameter("vehicle_type");
		String interiorColor = request.getParameter("interior_color");
		String exteriorColor = request.getParameter("exterior_color");

		CustomerInfo ci = new CustomerInfo();
		ci.setVehicleNumber(vehicleNumber);
		ci.setCustomerName(customerName);
		ci.setCustomerContact(customerContact);
		ci.setCustomerEmail(customerEmail);
		ci.setCustomerAddress(customerAddress);
		ci.setCustomerCity(customerCity);
		ci.setCustomerState(customerState);
		ci.setPincode(pincode);
		ci.setCustomerRc(customerRc);
		ci.setCustomerAadhaar(customerAadhaar);
		ci.setCustomerLicense(customerLicense);
		ci.setCustomerType(customerType);

		VehicleInfo vi = new VehicleInfo();
		vi.setVehicleNumber(vehicleNumber);
		vi.setVinNumber(vinNumber);
		vi.setVehicleCompany(vehicleCompany);
		vi.setCompanyModel(companyModel);
		vi.setModelVarient(modelVarient);
		vi.setEngineNumber(engineNumber);
		vi.setFuelType(fuelType);
		vi.setVehicleType(vehicleType);
		vi.setInteriorColor(interiorColor);
		vi.setExteriorColor(exteriorColor);
		String modelName = VehicleModelDao.getModelName(companyModel);

		OfficerInfo oi = new OfficerInfo();
		oi.setOfficerUsername(vehicleNumber);
		oi.setOfficerName(customerName);
		oi.setOfficerRole("customer");
		oi.setOfficerContact(customerContact);
		oi.setOfficerEmail(customerEmail);
		String password = vehicleNumber;
		oi.setOfficerPassword(password);

		int status2 = VehicleInfoDao.save(vi);
		int status = CustomerInfoDao.save(ci);
		int status3 = OfficerInfoDao.save(oi);

		if (status > 0 && status2 > 0 && status3 > 0) {
			String msg = "Hello <b>" + customerName + "</b>,<br> Your Car <b>" + modelName + "</b> and Vehicle No. <b>" + vehicleNumber
					+ "</b> is registered. <br> Your Username is <b>" + vehicleNumber + "</b>.<br> Your Password is <b>" + password
					+ "</b>.";
			HttpSession session = request.getSession();
			session.setAttribute("model_varient_id", modelVarient);
			session.setAttribute("customer_name", customerName);
			MyThread t = new MyThread();
			t.StartThread(customerEmail, msg, "Customer Registration");
			response.sendRedirect("receptionist/customerverification.jsp");
		} else {
			out.println("Allready Exist Vehicle Number & Status pending or Completed");

		}

		out.close();
	}

}
