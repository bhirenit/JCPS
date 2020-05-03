<%
session.invalidate();
request.getRequestDispatcher("index.jsp").include(request, response);

%>