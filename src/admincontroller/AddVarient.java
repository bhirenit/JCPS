package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehicleModelVarient;
import modal.VehicleModelVarientDao;

/**
 * Servlet implementation class AddVarient
 */
@WebServlet("/AddVarient")
public class AddVarient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVarient() {
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
		String model_varient_name = request.getParameter("model_varient_name");
		String model_id = request.getParameter("mid");
 
		VehicleModelVarient vm = new VehicleModelVarient();
		vm.setModelVarientName(model_varient_name);
		vm.setVehicleModelId(Integer.parseInt(model_id));

		int status = VehicleModelVarientDao.save(vm);
		if (status > 0) {
			response.sendRedirect("admin/varients.jsp?mid="+request.getParameter("mid"));
		} else {
			System.out.println("Varient not added due to some error occured");
		}
	}

}
