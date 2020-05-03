package admincontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.JobcardInfoDao;

/**
 * Servlet implementation class ChangeAllocation
 */
@WebServlet("/ChangeAllocation")
public class ChangeAllocation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeAllocation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		int jobcardNumber = Integer.parseInt(request.getParameter("id"));
		String officer_username = request.getParameter("username");
		int status = JobcardInfoDao.changeAllocation(jobcardNumber, officer_username);
		if(status>0)
		{
			response.sendRedirect("admin/changeallocation.jsp");
		}
	}

}
