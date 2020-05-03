package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehiclePartDetails;
import modal.VehiclePartDetailsDao;

/**
 * Servlet implementation class AddPart
 */
@WebServlet("/AddPart")
public class AddPart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPart() {
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
		String part_name = request.getParameter("part_name");
		int model_varient_id = Integer.parseInt(request.getParameter("vid"));
		int part_price = Integer.parseInt(request.getParameter("part_price"));
		int part_quantity = Integer.parseInt(request.getParameter("part_quantity"));
		int part_validity = Integer.parseInt(request.getParameter("part_validity"));
		// Date part_validity = Integer.parseInt(request.getParameter("part_quantity"));
		int part_labour = Integer.parseInt(request.getParameter("part_labour"));
 
		VehiclePartDetails vpd = new VehiclePartDetails();
		vpd.setPartName(part_name);
		vpd.setModelVarientId(model_varient_id);
		vpd.setPartPrice(part_price);
		vpd.setPartQuantity(part_quantity);
		vpd.setPartValidity(part_validity);
		vpd.setPartLabour(part_labour);

		int status = VehiclePartDetailsDao.save(vpd);
		if (status > 0) {
			response.sendRedirect("admin/parts.jsp?vid="+request.getParameter("vid"));
		} else {
			System.out.println("Part not added due to some error occured");
		}
	}

}
