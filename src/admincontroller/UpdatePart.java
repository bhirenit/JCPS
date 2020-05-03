package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehiclePartDetails;
import modal.VehiclePartDetailsDao;
import modal.VehicleServiceDetailsDao;
import modal.VehicleServiceDetails;

/**
 * Servlet implementation class UpdatePart
 */
@WebServlet("/UpdatePart")
public class UpdatePart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePart() {
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
		
		String name = request.getParameter("part_name");
		int price = Integer.parseInt(request.getParameter("part_price"));
		int quantity = Integer.parseInt(request.getParameter("part_quantity"));
		int labour = Integer.parseInt(request.getParameter("part_labour"));
		int id = Integer.parseInt(request.getParameter("part_id"));
 
		VehiclePartDetails vsd = new VehiclePartDetails();
		vsd.setPartName(name);
		vsd.setPartPrice(price);
		// vsd.setPartValidity(part_validity);
		vsd.setPartQuantity(quantity);
		vsd.setPartLabour(labour);
		vsd.setPartId(id);

		int status = VehiclePartDetailsDao.update(vsd);
		if (status > 0) {
			response.sendRedirect("admin/parts.jsp?vid="+request.getParameter("vid"));
		} else {
			System.out.println("Part not added due to some error occured");
		}
	}

}
