<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.ConnectionProvider" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BBM | LIST</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<!-- navbar-expand-lg = stay navbar content expanded on large monitors like pc. retract on other smaller displays -->
<!-- bg-danger = Change the color of nav to red -->
<!-- data-bs-theme = "dark" = text on nav adjust to display on a dark color by making them white -->
<nav class="navbar navbar-expand-lg bg-danger" data-bs-theme = "dark" aria-label="Thirteenth navbar example">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample11" aria-controls="navbarsExample11" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse d-lg-flex" id="navbarsExample11">
      <a class="navbar-brand col-lg-3 me-0" href="#">Blood Bank Management</a>
      <ul class="navbar-nav col-lg-6 justify-content-lg-center">
        <li class="nav-item">
          <a class="nav-link" href="addNewDonor.jsp">Add donor</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Donor list</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="manageStock.jsp">Stocks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="bloodRequestList.jsp">Requests</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="requestApprovedList.jsp">Completed</a>
        </li>

      </ul>
      <div class="d-lg-flex col-lg-3 justify-content-lg-end">
        <a href="index.jsp">
          <button class="btn btn-danger">Logout</button>
        </a>
      </div>
    </div>
  </div>
</nav>

<div class="container-fluid">

  <div class="container-fluid" style="padding-left: 60px; padding-right: 60px;">
    <br>
    <h2 class="text-center" style="font-family: 'Roboto Mono', monospace;">
      <small class="text-muted">List of Donors</small>
    </h2>
    <%
      String msg = request.getParameter("msg");
      if ("valid".equals(msg)){
    %>
    <div style="text-align: center;">Successfully Updated!</div>
    <%
      }
    %>
    <%
      if ("invalid".equals(msg)){
    %>
    <div style="text-align: center;">Something went wrong!</div>
    <%
      }
    %>
    <%
      if ("deleted".equals(msg)){
    %>
    <div style="text-align: center;">successfully Deleted!</div>
    <%
      }
    %>
    <div class="text-success">
      <hr>
    </div>

    <div class="container text-left" style="padding-left: 0px; margin-left: 0px;">
      <a href="addNewDonor.jsp" class="btn btn-danger">Add New Donor</a>
    </div>

    <br>
    <!-- Donors table -->
    <table class="table table-borderless table-hover">
      <thead class="table-light">
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Father's name</th>
        <th>Mother's name</th>
        <th>Mobile Number</th>
        <th>Gender</th>
        <th>Email</th>
        <th>Blood group</th>
        <th>Address</th>
        <th>Controls</th>
      </tr>
      </thead>
      <%
        try {
          Connection con = ConnectionProvider.getCon();
          Statement st = con.createStatement();
          ResultSet rs = st.executeQuery("SELECT * FROM donor");
          while (rs.next()){

      %>
      <tbody>
      <tr>
        <td><%=rs.getInt(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
        <td><%=rs.getString(7)%></td>
        <td><%=rs.getString(8)%></td>
        <td><%=rs.getString(9)%></td>
        <td>
          <a href="updateDonor.jsp?id=<%=rs.getString(1)%>">Edit</a>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <a href="${pageContext.request.contextPath}/deleteDonorAction?id=<%=rs.getString(1)%>">Delete</a>
        </td>
      </tr>
      <%
          }
        }
        catch (Exception e){
          System.out.println(e);
        }
      %>
      </tbody>
    </table>
  </div>
</div>



</body>
</html>