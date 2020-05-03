<%@page import="modal.ConnectionDb"%>
<%@page import="java.sql.*" %>
<%
  if( ! ((String)session.getAttribute("officer_role")).equals("receptionist")  ){
	  response.sendRedirect("../notaccess.jsp");
  }
  
  %>
<%
if(request.getParameter("vehicle_model_id")!=null) 
{
    String id=request.getParameter("vehicle_model_id"); 
        
    try
    {
       Connection con = ConnectionDb.getConnection();
        PreparedStatement pstmt=null ;
                
        pstmt=con.prepareStatement("select * from vehicle_model_varient where vehicle_model_id=? "); 
        pstmt.setString(1,id);
        ResultSet rs=pstmt.executeQuery(); 
        %>        
            <option selected="selected">--</option>
        <%    
        while(rs.next())
        {
        %> 
            <option value="<%=rs.getString("model_varient_id")%>">
                <%=rs.getString("model_varient_name")%>
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