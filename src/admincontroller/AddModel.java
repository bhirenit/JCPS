package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehicleModel;
import modal.VehicleModelDao;

/**
 * Servlet implementation class AddModel
 */
@WebServlet("/AddModel")
public class AddModel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddModel() {
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
		String model_name = request.getParameter("model_name");
		String company_id = request.getParameter("cid");
 
		VehicleModel vm = new VehicleModel();
		vm.setVehicleModelName(model_name);
		vm.setVehicleCompanyId(Integer.parseInt(company_id));

		int status = VehicleModelDao.save(vm);
		if (status > 0) {
			response.sendRedirect("admin/models.jsp?cid="+request.getParameter("cid"));
		} else {
			System.out.println("Model not added due to some error occured");
		}
	}

}
