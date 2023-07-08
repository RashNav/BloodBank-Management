<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.ConnectionProvider" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BBM | STOCKS</title>
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
            <a class="navbar-brand col-lg-3 me-0" href="index.html">Blood Bank Management</a>
            <ul class="navbar-nav col-lg-6 justify-content-lg-center">
                <li class="nav-item">
                    <a class="nav-link " href="addNewDonor.jsp">Add donor</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="editDeleteList.jsp">Donor list</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Stocks</a>
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

<div class="container d-flex " style="height: 90vh;">


    <div class="col-3" style="margin-top: 50px;">
        <figure class="text-center">
            <blockquote class="blockquote">
                <p class="fs-2">
                    MANAGE STOCKS
                </p>
            </blockquote>
        </figure>
        <form action="${pageContext.request.contextPath}/manageStockAction">
            <label class="form-label">Blood group </label>
            <select name="bloodGroup" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                <option selected>- - s e l e c t - -</option>
                <option value="A RhD positive (A+)">A RhD positive (A+)</option>
                <option value="A RhD negative (A-)">A RhD negative (A-)</option>
                <option value="B RhD positive (B+)">B RhD positive (B+)</option>
                <option value="B RhD negative (B-)">B RhD negative (B-)</option>
                <option value="O RhD positive (O+)">O RhD positive (O+)</option>
                <option value="O RhD negative (O-)">O RhD negative (O-)</option>
                <option value="AB RhD positive (AB+)">AB RhD positive (AB+)</option>
                <option value="AB RhD negative (AB-)">AB RhD negative (AB-)</option>
            </select>

            <label class="form-label">Action </label>
            <div class="row">
                <div class="col-md-2">
                </div>
                <div class=" col-md-4 form-check">
                    <input class="form-check-input" type="radio" name="state" value="increment" checked>
                    <label class="form-check-label" >Increment</label>
                </div>
                <div class=" col-md-4 form-check">
                    <input class="form-check-input" type="radio" name="state" value="decrement" >
                    <label class="form-check-label" >Decrement</label>
                </div>
                <div class="col-md-2">
                </div>
            </div>

            <br>

            <label class="form-label">Units </label>
            <input name="units" class="form-control form-control-lg" type="text" placeholder="How many units" aria-label="form-control-lg example"><br>

            <div class="d-grid col-8 mx-auto">
                <button class="btn btn-danger" type="submit">Submit</button>
            </div>
        </form>

    </div>
    <div class="col-1">

    </div>
    <div class="col-7" style="margin-top: 50px;">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Blood Group</th>
                <th scope="col">Units</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <%
                    try {
                        Connection con = ConnectionProvider.getCon();
                        Statement st = con.createStatement();
                        ResultSet rs = st.executeQuery("SELECT * FROM stock");
                        int i = 0;
                        while (rs.next()){
                            i=i+1;

                %>
                <th scope="row"><%=i%></th>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
            </tr>
            <%
                    }
                }catch (Exception e){
                    System.out.println(e);
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
