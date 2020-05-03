<%@page import="modal.ConnectionDb"%>
<%@page import="java.sql.*" %>
<%
  if( ! ((String)session.getAttribute("officer_role")).equals("receptionist")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
<%
if(request.getParameter("company_id")!=null) 
{
    String id=request.getParameter("company_id"); 
        
    try
    {
        Connection con = ConnectionDb.getConnection();
        PreparedStatement pstmt=null ; //create statement
                
        pstmt=con.prepareStatement("select * from vehicle_model where vehicle_company_id=? "); //sql select query
        pstmt.setString(1,id);
        ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.
        %>        
            <option selected="selected">--</option>
        <%    
        while(rs.next())
        {
        %>        
            <option value="<%=rs.getString("vehicle_model_id")%>">
                <%=rs.getString("vehicle_model_name")%>
            </option>
        <%
        }
  
        con.close(); //close connection
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>

