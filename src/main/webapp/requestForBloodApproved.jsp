<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="project.ConnectionProvider" %>
<%@ page import="java.sql.*" %>

<%
  String mobilenumber = request.getParameter("mobilenumber");

  try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement("UPDATE bloodrequest SET status='approved' WHERE mobilenumber=?");
    ps.setString(1,mobilenumber);
    ps.executeUpdate();
    response.sendRedirect("requestForBlood.jsp");

  }catch (Exception e){
    response.sendRedirect("requestForBlood.jsp");
  }
%>
