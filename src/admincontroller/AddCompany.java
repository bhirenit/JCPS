package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehicleCompany;
import modal.VehicleCompanyDao;

/**
 * Servlet implementation class AddCompany
 */
@WebServlet("/AddCompany")
public class AddCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCompany() {
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
		String company_name = request.getParameter("company_name");

		VehicleCompany vc = new VehicleCompany();
		vc.setVehicleCompanyName(company_name);

		int status = VehicleCompanyDao.save(vc);
		if (status > 0) {
			response.sendRedirect("admin/companies.jsp");
		} else {
			System.out.println("Company not added due to some error occured");
		}
	}

}
