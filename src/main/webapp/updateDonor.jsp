<%@ page import="java.sql.Connection" %>
<%@ page import="dao.ConnectionProvider" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BBM | ADD</title>
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
            <a class="navbar-brand col-lg-3 me-0" href="index.jsp">Blood Bank Management</a>
            <ul class="navbar-nav col-lg-6 justify-content-lg-center">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Add donor</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="editDeleteList.jsp">Donor list</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Stocks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Requests</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Completed</a>
                </li>

            </ul>
            <div class="d-lg-flex col-lg-3 justify-content-lg-end">
                <button class="btn btn-danger">Logout</button>
            </div>
        </div>
    </div>
</nav>
<br>
<figure class="text-center">
    <blockquote class="blockquote">
        <h2 class="text-center" style="font-family: 'Roboto Mono', monospace;">
            <small class="text-muted">Update Donor</small>
        </h2>

        <div class="text-success" style="margin-left: 100px;margin-right: 100px;">
            <hr>
        </div>
    </blockquote>
</figure>

<div class="container d-flex justify-content-center align-items-center" style="height: 70vh;">
    <div class="row justify-content-center">
        <div class="col-9">


            <%
                String id = request.getParameter("id");
                try {
                    Connection con = ConnectionProvider.getCon();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM donor WHERE id = '"+id+"'");
                    while (rs.next()){
            %>
            <form action="${pageContext.request.contextPath}/updateDonorAction" class="row g-3">
                <input type="hidden" class="form-control form-control-lg" name="id" value="<%=id%>">
                <div class="col-md-6">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-control form-control-lg" name="name" value="<%=rs.getString(2)%>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Mobile</label>
                    <input type="number" class="form-control form-control-lg" name="mobileNumber" value="<%=rs.getString(5)%>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Father's Name</label>
                    <input type="text" class="form-control form-control-lg" name="father" value="<%=rs.getString(3)%>">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Mother's Name</label>
                    <input class="form-control form-control-lg" name="mother" value="<%=rs.getString(4)%>">
                </div>

                <div class="col-8">
                    <label class="form-label">Address</label>
                    <input type="text" class="form-control form-control-lg" name="address" placeholder="1234 Main St" value="<%=rs.getString(9)%>">
                </div>
                <div class="col-md-4">
                    <label class="form-label">Blood Group</label>
                    <select name="bloodgroup" class="form-select form-select-lg">
                        <option selected><%=rs.getString(8)%></option>
                        <option value="A+">A RhD positive (A+)</option>
                        <option value="A-">A RhD negative (A-)</option>
                        <option value="B+">B RhD positive (B+)</option>
                        <option value="B-">B RhD negative (B-)</option>
                        <option value="O+">O RhD positive (O+)</option>
                        <option value="O-">O RhD negative (O-)</option>
                        <option value="AB+">AB RhD positive (AB+)</option>
                        <option value="AB-">AB RhD negative (AB-)</option>
                    </select>
                </div>
                <div class="col-md-8">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control form-control-lg" name="email" value="<%=rs.getString(7)%>">
                </div>

                <div class="col-md-4">
                    <label class="form-label">Gender</label>
                    <select name="gender" class="form-select form-select-lg">
                        <option selected><%=rs.getString(6)%></option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="d-grid col-3 ">
                    <button class="btn btn-danger" type="submit">Update Donor</button>
                </div>
            </form>
        </div>
        <%
                }
            }
            catch (Exception e){
                System.out.println(e);
            }
        %>
    </div>
</div>


</body>
</html>
