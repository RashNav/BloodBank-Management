<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BBM | Home</title>
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
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminLogin.jsp">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container d-flex justify-content-center align-items-center" style="height: 90vh;">
    <div class="row justify-content-center">
        <div class="col-fluid">
            <%
                String msg = request.getParameter("msg");
                if ("valid".equals(msg)){
            %>
            <center>Form Submitted Successfully, YOu will be notified within 8 hours</center>
            <%
                }
            %>
            <%
                if ("invalid".equals(msg)){
            %>
            <center>Invalid data! Try Again</center>
            <%
                }
            %>
            <figure class="text-center">
                <blockquote class="blockquote">
                    <p class="fs-2">
                        REQUEST TO DONATE
                    </p>
                </blockquote>
                <figcaption class="blockquote-footer">
                    Be the reason for someone's
                    <cite title="Source Title">
                        heartbeat.
                    </cite>
                </figcaption>
            </figure>

            <form action="indexFormAction.jsp">
                <label class="form-label">Name: </label>
                <input name="name" class="form-control form-control-lg" type="text" placeholder="Donor name" aria-label="form-control-lg example"><br>

                <label class="form-label">Mobile: </label>
                <input name="mobilenumber" class="form-control form-control-lg" type="number" placeholder="Contact number" aria-label="form-control-lg example"><br>

                <label class="form-label">Email: </label>
                <input name="email" class="form-control form-control-lg" type="email" placeholder="Email address" aria-label="form-control-lg example"><br>

                <label class="form-label">Blood group: </label>
                <select name="bloodgroup" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                    <option selected>- - s e l e c t - -</option>
                    <option value="A+">A RhD positive (A+)</option>
                    <option value="A-">A RhD negative (A-)</option>
                    <option value="B+">B RhD positive (B+)</option>
                    <option value="B-">B RhD negative (B-)</option>
                    <option value="O+">O RhD positive (O+)</option>
                    <option value="O-">O RhD negative (O-)</option>
                    <option value="AB+">AB RhD positive (AB+)</option>
                    <option value="AB-">AB RhD negative (AB-)</option>
                </select>
                <div class="d-grid col-8 mx-auto">
                    <button class="btn btn-danger" type="submit">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>


</body>
</html>