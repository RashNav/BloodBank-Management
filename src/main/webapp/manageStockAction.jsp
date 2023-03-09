<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import ="java.sql.*" %>
<%@ page import ="project.ConnectionProvider" %>

<%
    String bloodgroup = request.getParameter("bloodgroup");
    String incdec = request.getParameter("indec");
    String units = request.getParameter("units");
    int units1 = Integer.parseInt(units);

    try {
        Connection con = ConnectionProvider.getCon();
        Statement st = con.createStatement();
        if (incdec.equals("increment")){
            st.executeUpdate("UPDATE stock set units=units+'"+units+"'WHERE bloodgroup='"+bloodgroup+"'");
        }
        else{
            st.executeUpdate("UPDATE stock set units=units-'"+units+"'WHERE bloodgroup='"+bloodgroup+"'");
        }
        response.sendRedirect("manageStock.jsp?msg.valid");
    }catch (Exception e){
        response.sendRedirect("manageStock.jsp?msg.invalid");
    }
%>
