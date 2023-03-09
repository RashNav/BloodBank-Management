<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");

  if ("admin".equals(username) && "admin".equals(password)){
    response.sendRedirect("addNewDonor.jsp");
  }
  else{
    response.sendRedirect("adminLogin.jsp?msg=invalid");
  }
%>