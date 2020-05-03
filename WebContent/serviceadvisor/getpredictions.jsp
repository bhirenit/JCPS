<%@page import="java.util.List"%>
<%@page import="modal.SuggestionInfoDao"%>
<%@page import="modal.SuggestionInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			<% String complain = request.getParameter("complain");
			SuggestionInfo si = SuggestionInfoDao.getPrediction(complain);
			List<String> list = SuggestionInfoDao.getTokens(si.getDescription());
			%>
</body>
</html>