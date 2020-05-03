package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehiclePartDetails;
import modal.VehicleServiceDetailsDao;
import modal.VehicleServiceDetails;

/**
 * Servlet implementation class AddService
 */
@WebServlet("/AddService")
public class AddService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddService() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String service_name = request.getParameter("service_name");
		int model_varient_id = Integer.parseInt(request.getParameter("vid"));
		int service_price = Integer.parseInt(request.getParameter("service_price"));		
		 int service_validity =Integer.parseInt( request.getParameter("service_validity"));
		String service_details = request.getParameter("service_details");
 
		VehicleServiceDetails vsd = new VehicleServiceDetails();
		vsd.setServiceName(service_name);
		vsd.setModelVarientId(model_varient_id);
		vsd.setServicePrice(service_price);
		vsd.setServiceValidity(service_validity);
		vsd.setServiceDetails(service_details);

		int status = VehicleServiceDetailsDao.save(vsd);
		if (status > 0) {
			response.sendRedirect("admin/services.jsp?vid="+request.getParameter("vid"));
		} else {
			System.out.println("Part not added due to some error occured");
		}
	}

}
