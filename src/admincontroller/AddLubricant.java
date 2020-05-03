package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehicleLubricantDetails;
import modal.VehicleLubricantDetailsDao;

/**
 * Servlet implementation class AddLubricant
 */
@WebServlet("/AddLubricant")
public class AddLubricant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLubricant() {
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
		String lubricant_name = request.getParameter("lubricant_name");
		int model_varient_id = Integer.parseInt(request.getParameter("vid"));
		int lubricant_price = Integer.parseInt(request.getParameter("lubricant_price"));
		int lubricant_quantity = Integer.parseInt(request.getParameter("lubricant_quantity"));
		int lubricant_validity = Integer.parseInt(request.getParameter("lubricant_validity"));
		int lubricant_labour = Integer.parseInt(request.getParameter("lubricant_labour"));
		int lubricant_validity_km = Integer.parseInt(request.getParameter("lubricant_validity_km"));
		
 
		VehicleLubricantDetails vld = new VehicleLubricantDetails();
		vld.setLubricantName(lubricant_name);
		vld.setModelVarientid(model_varient_id);
		vld.setLubricantPrice(lubricant_price);
		vld.setLubricantQuantity(lubricant_quantity);
		vld.setLubricantValidity(lubricant_validity);
		vld.setLubricantLabour(lubricant_labour);

		int status = VehicleLubricantDetailsDao.save(vld);
		if (status > 0) {
			response.sendRedirect("admin/lubricants.jsp?vid="+request.getParameter("vid"));
		} else {
			System.out.println("Part not added due to some error occured");
		}
	}

}
