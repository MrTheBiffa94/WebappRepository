<!DOCTYPE html>
<html lang="en">

<head>
    <!--Includo NavbarIN dove è contenuto tutto il codice jsp per la navbar-->
    <jsp:include page="NavbarIN.jsp"></jsp:include>

    <title>Login Error</title>
</head>

<body>
<div class="container" style="max-width: 550px">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>
                    Oops!</h1>
                <h2 style="color: red">Oops! Errore inserimento Email o password</h2>
                <i style="color: red" class="fa fa-exclamation-triangle fa-5x" aria-hidden="true"></i>
                <div class="error-details">
                    Torna alla Home o reinserisci i dati oppure resetta la password
                </div>
                <form action="ControllerView/LoginController.jsp">
                    <div aria-required="true" class="form-group">
                        <label>Email:</label>
                        <input class="form-control" name="Email" id="email" placeholder="Email" type="text" required>
                        <label>Password:</label>
                        <input class="form-control" name="Password" id="pwd" placeholder="Password" type="password"
                               required>
                    </div>
                    <div>
                        <button class="btn btn-primary">Log In</button>
                    </div>
                </form>
                <div class="error-actions">
                    <a href="Homepage.jsp" class="btn btn-primary btn-lg"><i class="fa fa-home" aria-hidden="true"></i>Homepage</a>
                    <a class="btn btn-primary btn-lg" href="ResetPassword.jsp" style="background-color: red"><i
                            class="fa fa-home" aria-hidden="true"></i>Reset Password</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</html>