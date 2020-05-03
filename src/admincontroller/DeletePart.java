package admincontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.VehiclePartDetailsDao;

/**
 * Servlet implementation class DeletePart
 */
@WebServlet("/DeletePart")
public class DeletePart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePart() {
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
		int part_id = Integer.parseInt(request.getParameter("part_id"));		
		
		int status = VehiclePartDetailsDao.deletePartById(part_id);
		System.out.println(status);
		if (status > 0) {
			response.sendRedirect("admin/parts.jsp?vid="+request.getParameter("vid1"));
		} else {
			System.out.println("Part not deleted due to some error occured");
		}
	}

}
