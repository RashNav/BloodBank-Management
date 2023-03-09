<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>BBM | LOGIN</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<!-- navbar-expand-lg = stay navbar content expanded on large monitors like pc. retract on other smaller displays -->
<!-- bg-danger = Change the color of nav to red -->
<!-- data-bs-theme = "dark" = text on nav adjust to display on a dark color by making them white -->
<nav class="navbar navbar-expand-lg bg-danger" data-bs-theme="dark" >

  <!-- container-fluid =  take the 100% width of the screen at all screen breakpoints-->
  <div class="container-fluid">

    <!-- navbar-brand = Big logo text -->
    <a class="navbar-brand" href="#">Blood Bank Management</a>

    <!-- collapse the text under navbar-brand and expand button on far right if set id="navbarNav" on needed-->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <!-- navbar-collapse = state Collapsing section; behavior of the collapse set by id="navbarNav"-->
    <div class="collapse navbar-collapse" id="navbarNav">

      <!-- ms-auto = pushing all other items to left by adding margin to left-->
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="#">Login</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
  <div class="row justify-content-center">
    <div class="col-fluid">

      <figure class="text-center">
        <blockquote class="blockquote">
          <p class="fs-2">
            Admin Login
          </p>
        </blockquote>
      </figure>
      <%
        String msg = request.getParameter("msg");
        if ("invalid".equals(msg)){
      %>
      <div style="text-align: center;">Invalid username or password!</div>
      <%
        }
      %>
      <form action="adminLoginAction.jsp" method="post">
        <label class="form-label">Username: </label>
        <input name="username" class="form-control form-control-lg" type="text" aria-label="form-control-lg example"><br>

        <label class="form-label">Password: </label>
        <input name="password" class="form-control form-control-lg" type="text" aria-label="form-control-lg example"><br>

        <div class="d-grid col-8 mx-auto">
          <button class="btn btn-danger" type="submit">LOGIN</button>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
